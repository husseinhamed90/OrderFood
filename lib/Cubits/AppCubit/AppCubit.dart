import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:orderfood/BuildFavouritePage.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import 'package:orderfood/Models/Category.dart';
import 'package:orderfood/Models/Meal.dart';
import 'package:orderfood/Models/Order.dart';
import 'package:orderfood/Models/Restaurant.dart';
import 'package:orderfood/Models/UserAccount.dart';
import 'package:orderfood/Profile.dart';
import 'package:orderfood/Repository.dart';
import 'package:orderfood/Services.dart';
import 'package:orderfood/Widgets/BuildCartPage.dart';
import 'package:orderfood/Widgets/BuildHomePage.dart';
import 'package:sqflite/sqflite.dart';
class AppCubit extends Cubit<CubitState>{
  late Repository repository;
  Database ?database;

  PageController controller =new PageController();

  AppCubit(this.repository,this.database) : super(initialState());


  List<Widget>pages=[
    BuildHomePage(),
    BuildFavouritePage(),
    BuildCartPage(),
    Profile(),
  ];

  int currentindex=0;
  int currentflipindex=0;
  double total=0.0;
  Widget currentpage = BuildHomePage();
  late User user;
  late List<Restaurant> resturants;
  late List<Meal> PopularMeals;
  late List<Category>categories;
  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  Future getCachedData()async{
    getUserCartMeals();
    getUserFavouritesMeals();
  }

  Future removeCachedData()async{
    database!.transaction((txn) {
      return txn.rawDelete('DELETE FROM Cart WHERE userID = "${account!.id}"').then((value) {
      });
    });
    database!.transaction((txn) {
      return txn.rawDelete('DELETE FROM Favourites WHERE userID = "${account!.id}"').then((value) {
      });
    });
  }

  void calculateTotalPrice(){
    total=0;
    account!.Meals.forEach((element) {
      total+=element.mealprice*element.quantity;
    });
    emit(totalPriceIsCalculated());
  }
  Future<void> UpdateProfileInfo(UserAccount newaccount)async{
    emit(LoadingIndicator());
    await Services.UpdateProfile(newaccount,account!.id,this);
  }
  Future IncreamentCartNumber(Meal meal)async{
    emit(addingMealToCartInProgress());
    meal.quantity++;
    if(meal.quantity==1){
      AddMealToCart(meal);
    }
    else if(meal.quantity>1){
      await updateMealInDatabaseCart(meal);
    }
    calculateTotalPrice();
    await updateMealInDatabaseFavourite(meal);
    emit(quantityofMealIncreased());

  }
  Future DecreaseCartNumber(Meal meal,int quantity,)async{
    emit(addingMealToCartInProgress());
    quantity--;
    if(quantity>0){
      meal.quantity=quantity;
      await updateMealInDatabaseCart(meal);
      await updateMealInDatabaseFavourite(meal);
    }
    else if(quantity==0){
      meal.quantity=quantity;
      deleteMealFromDatabaseCart(meal);
    }
    calculateTotalPrice();

    emit(quantityofMealDecreased());
  }

  Future<List<Meal>> AddMealToCart(Meal meal)async{
    bool mealFound=false;
    //meal.quantity++;
    emit(addingMealToCartInProgress());
    for(int i=0;i<account!.Meals.length;i++){
      if(account!.Meals[i].mealID==meal.mealID){
        account!.Meals[i]=meal;
        account!.mapOfCartMeals[meal.mealID]=meal;
        mealFound=true;
      }
    }
    if(!mealFound){
      account!.Meals.add(meal);
      account!.mapOfCartMeals[meal.mealID]=meal;
    }
    calculateTotalPrice();
    await insertIntoDatabase(meal).then((value) async{
      await updateMealInDatabaseFavourite(meal);
      emit(MealAddedToCart());
      return account!.Meals;
    });
    emit(quantityofMealIncreased());
    return account!.Meals;
  }
  Future updateMealInDatabaseCart(Meal meal)async{

    database!.transaction((txn) {
      return txn.rawUpdate('UPDATE Cart SET quantity = ${meal.quantity} WHERE(userID ="${account!.id}" AND mealID = "${meal.mealID}")').then((value) {
        print("Record Updated Successfully");
      });
    });
  }

  Future updateMealInDatabaseFavourite(Meal meal)async{
    database!.transaction((txn) {
      return txn.rawUpdate('UPDATE Favourites SET quantity = ${meal.quantity} WHERE(userID ="${account!.id}" AND mealID = "${meal.mealID}")').then((value) {
        print("Record Updated Successfully");
      });
    });
  }
  Future removeMealFromCart(Meal meal)async{
    for(int i=0;i<account!.Meals.length;i++){
      if(account!.Meals[i].mealID==meal.mealID){
        account!.Meals.removeAt(i);
        account!.mapOfCartMeals.remove(meal.mealID);
        emit(mealDeletedFromUserMeals());
      }
    }
  }

  Future removeMealFromFavourites(Meal meal)async{
    for(int i=0;i<account!.favourite.length;i++){
      if(account!.favourite[i].mealID==meal.mealID){
        account!.favourite.removeAt(i);
        account!.mapOfFavouritesMeals.remove(meal.mealID);

        emit(mealDeletedFromUserFavourites());
        return;
      }
    }
  }

  Future updateAccount()async{
    emit(updateUserAccountInProgress());
    await FirebaseFirestore.instance.collection("Users").doc(account!.id).update(account!.toJson()).then((value) {
      emit(MealAddedToAccount());
    });
  }
  Future resetCubitData()async{
    total=0;
    account!.Meals.clear();
    account!.mapOfCartMeals.clear();
    PopularMeals.forEach((element) {
      element.quantity=0;
    });
    await removeCachedData();
    emit(accountisReseted());
  }

  Future makeOrder()async{
    Order order =new Order(account!.id, account!.Meals);
    FirebaseFirestore.instance.collection('Orders').add(order.toJson());
  }

  Future deleteMealFromDatabaseCart(Meal meal)async{
    //total-=meal.mealprice*meal.quantity;
    database!.transaction((txn) {
      return txn.rawDelete('DELETE FROM Cart WHERE (userID ="${account!.id}" AND mealID = "${meal.mealID}")').then((value) async {
        removeMealFromCart(meal);
        meal.quantity=0;
        await updateMealInDatabaseFavourite(meal);
        print("Record Deleted Successfully");
      });
    });
  }

  Future<bool> deleteMealFromDatabaseFavourite(Meal meal)async{

    emit(deleteMealFromFvouritesInProgess());
    database!.transaction((txn) {
      return txn.rawDelete('DELETE FROM Favourites WHERE (userID ="${account!.id}" AND mealID = "${meal.mealID}")').then((value) {
        removeMealFromFavourites(meal);
        meal.quantity=0;
        print("Record Deleted Successfully");
        return false;
      });
    });
    return true;
  }



  Future getUserCartMeals()async{

    database!.transaction((txn) {
      return txn.rawQuery('SELECT * FROM Cart WHERE userID = "${account!.id}"').then((value) {
        print(value.length);
        value.forEach((element) {
          print("dfsdfdsd222222222");
          account!.Meals.add(Meal.fromJson(element));
          account!.mapOfCartMeals[Meal.fromJson(element).mealID]=Meal.fromJson(element);
        });
        account!.Meals.forEach((element) {
          print(element.mealname);
        });
        print("Meals coming Successfully");
      });
    });
  }

  Future getUserFavouritesMeals()async{
    database!.transaction((txn) {
      return txn.rawQuery('SELECT * FROM Favourites WHERE userID = "${account!.id}"').then((value) {
        value.forEach((element) {
          account!.favourite.add(Meal.fromJson(element));
          account!.mapOfFavouritesMeals[Meal.fromJson(element).mealID]=Meal.fromJson(element);
        });
        account!.favourite.forEach((element) {
          print(element.mealname);
        });
        print("Favourites coming Successfully");
      });
    });
  }

  Future insertIntoDatabase(Meal meal)async{
   print(database);
    database!.transaction((txn) {
      return txn.rawInsert('INSERT INTO Cart (mealname, description, mealprice, quantity, userID, path ,mealID) VALUES ("${meal.mealname}","${meal.description}",${meal.mealprice},${meal.quantity},"${account!.id}","${meal.path}","${meal.mealID}")').then((value) {
        print(value);
        print("Record added Successfully");
      });
    });
  }

  Future insertMealIntoFavourites(Meal meal)async{
    database!.transaction((txn) {
      return txn.rawInsert('INSERT INTO Favourites (mealname, description, mealprice, quantity, userID, path ,mealID) VALUES ("${meal.mealname}","${meal.description}",${meal.mealprice},${meal.quantity},"${account!.id}","${meal.path}","${meal.mealID}")').then((value) {
        print(value);
        print("Record added Successfully");
      });
    });
  }

  void addMealToFavourite(Meal meal){
    bool mealFound=false;
    for(int i=0;i<account!.favourite.length;i++){
      if(account!.favourite[i].mealID==meal.mealID){
        account!.favourite[i]=meal;
        account!.mapOfFavouritesMeals[meal.mealID]=meal;
        mealFound=true;
      }
    }
    if(!mealFound){
      account!.favourite.add(meal);
      account!.mapOfFavouritesMeals[meal.mealID]=meal;
      insertMealIntoFavourites(meal);
    }
    //FirebaseFirestore.instance.collection("Users").doc(account!.id).update(account!.toJson());
    emit(MealAddedToFavourite());
  }
  bool IsMealInFavourites(Meal meal){
    for(int i=0;i<account!.favourite.length;i++){
      if(account!.favourite[i].mealID==meal.mealID){
        print("meal found");
        emit(mealInFavourites());
        return true;
      }
    }
    return false;
  }

  Meal? isMealInCart(Meal meal){
    for(int i=0;i<account!.Meals.length;i++){
      if(account!.Meals[i].mealID==meal.mealID){

        emit(mealInCart());
        return account!.Meals[i];
      }
    }
    return null;
  }
  void updateaccount(UserAccount userAccount){
    account =userAccount;
    currentindex=0;
    currentpage=pages[0];
    emit(AccountisUpdated());
  }
  void SetInitialControllerPage(){
    controller=PageController(initialPage: currentflipindex);
    emit(setcontroll());
  }
  void changeposition(int newposition){
    currentpage=pages[newposition];
    currentindex=newposition;
    emit(positionchanged());
  }
  void goToNextPage (PageController controller){
    controller.nextPage(duration: kTabScrollDuration, curve: Curves.ease);
  }
  UserAccount ?account;
  Future<void> register (String username,String password,String confirmpassword,String name)async{

    if(username==""||password ==""|| confirmpassword==""){
      emit(EmptyFeildsFound());
    }
    else{
      emit(LoadingIndicator());
      if(password ==confirmpassword){
        account =await Services.Register(username, password,name)??null;

        if(account!=null){
          await LoadData().then((value) {
            emit(ValidUserState());
          });
        }
        else{
          emit(InvalidUserState());
        }
      }
      else{
        emit(InvalidRegisteration());
      }
    }
  }

  int currentcategoryposition=0;
  Future<void> changecurrentcategory(int index)async{
    currentcategoryposition=index;
    emit(positionchanged());
  }

  void Login(String username,String password)async{
    emit(LoadingIndicator());
    account  =await Services.Login(username, password)??null;
    if(account!=null){
      await LoadData().then((value) async {
        await getCachedData();
        emit(ValidUserState());
      });
    }
    else{
      emit(InvalidUserState());
    }
  }
  Future<void>LoadData()async{
    emit(LoadingIndicator());
    await GetAllCategories();
    await GetPopularMeals();
    emit(DataisInLoaded());
  }

  Future<List<Restaurant>> GetAllResturants()async{
    await repository.getresturants().then((value) {
      this.resturants=value;
    });
    return resturants;
  }

  Future<void> GetPopularMeals()async{
    await repository.getPopularMeals().then((value) {
      this.PopularMeals=value;
    });
  }
  Future<void> GetAllCategories()async{
    await repository.getCategories().then((value) {
      this.categories=value;
    });
  }
}