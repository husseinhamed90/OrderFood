import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import 'package:orderfood/Models/Category.dart';
import 'package:orderfood/Models/Meal.dart';
import 'package:orderfood/Models/UserAccount.dart';
import 'package:orderfood/Network/Local/Sqflite.dart';
import 'package:orderfood/Network/Remote/Firebase.dart';
import '../../Screens/Profile.dart';
import '../../Widgets/BuildFavouritePage.dart';
import 'package:orderfood/Widgets/BuildCartPage.dart';
import 'package:orderfood/Widgets/BuildHomePage.dart';
class AppCubit extends Cubit<CubitState>{

  PageController controller =new PageController();

  AppCubit() : super(InitialState());

  List<Widget>pages=[
    BuildHomePage(),
    BuildFavouritePage(),
    BuildCartPage(),
    Profile(),
  ];
  UserAccount ?account;
  int currentIndex=0;
  int currentCategoryPosition=0;
  int currentFlipIndex=0;
  double total=0.0;
  String payOnArrival="";
  String location ="10 Al Nahda Street";
  Widget currentPage = BuildHomePage();
  late User user;
  List<Meal> popularMeals=[];
  String verificationId="";
  late List<Category>categories;
  static AppCubit get(BuildContext context) => BlocProvider.of(context);


  void setVerificationId(String verifyID){
    verificationId=verifyID;
    emit(SetVerificationIdState());
  }

  Future checkValidSignUpInputs(String username,String password,String confirmPassword,String name,String phoneNumber)async{
    emit(CheckForValidDataAndValidNumber());
    if(username==""||password ==""|| confirmPassword==""||phoneNumber==""||name==""){
      emit(EmptyFieldsFound());
    }
    else{
      if(password ==confirmPassword){
        await verifyPhoneNumber(phoneNumber);
      }
      else{
        emit(InvalidRegistration());
      }

    }
  }

  Future verifyPhoneNumber(String phoneNumber)async{

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) {
      },
      verificationFailed: (FirebaseAuthException e) {
        emit(InvalidNumber());
      },
      codeSent: (String verificationId, int? resendToken) {
        setVerificationId(verificationId);

        emit(GoToOtpScreenToEnterOTPCode());
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future checkOTPCode(String otpCode,UserAccount userAccount)async{
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otpCode);
    await FirebaseAuth.instance.signInWithCredential(credential).then((value)async {
      await register(userAccount);
    }).onError((error, stackTrace) {
      emit(WrongOTPCode());
    });
  }

  Future getCachedData()async{
    await getUserCartMeals();
    await getUserFavouriteMeals();
    emit(AccountMealState());
  }

  Future<void> getUserFavouriteMeals() async {
    List< Map<String,dynamic>> favouriteMeals = await SqfLite.getUserFavouritesMeals(account!);
     favouriteMeals.forEach((element) {
      account!.mapOfFavouritesMeals[Meal.fromJson(element).mealID]=Meal.fromJson(element);
    });
  }

  Future<void> getUserCartMeals() async {
    List< Map<String,dynamic>> cartMeals = await SqfLite.getUserCartMeals(account!);
    cartMeals.forEach((element) {
      account!.mapOfCartMeals[Meal.fromJson(element).mealID]=Meal.fromJson(element);
    });
  }

  bool isMealInFavourites(Meal meal){
    return account!.mapOfFavouritesMeals.containsKey(meal.mealID);
  }

  bool isMealInCart(Meal meal){
    print( account!.mapOfCartMeals.containsKey(meal.mealID));
    return account!.mapOfCartMeals.containsKey(meal.mealID);
  }

  void changeValueOfPayOnArrival(String value){
    payOnArrival=value;
    emit(ChangePayOnArrivalState());
  }

  void calculateTotalPrice(){
    total=0;
    account!.mapOfCartMeals.values.toList().forEach((element) {
      total+=element.mealprice*element.quantity;
    });
    emit(TotalPriceIsCalculated());
  }

  Future<void> updateProfileInfo(UserAccount newaccount)async{
    emit(LoadingIndicator());
    await Firebase.updateProfile(newaccount,account!.id,this);
  }

  Future incrementCartNumber(Meal meal)async{
    meal.quantity++;
    if(meal.quantity==1){
      addMealToCart(meal);
    }
    else if(meal.quantity>1){
      updateAccountCart(meal);
      await SqfLite.updateMealInDatabaseCart(meal,account!);
    }
    calculateTotalPrice();
    await SqfLite.updateMealInDatabaseFavourite(meal,account!);
    emit(QuantityOfMealIncreased());

  }

  Future decreaseCartNumber(Meal meal,int quantity,)async{
    quantity--;
    if(quantity>0){
      await updateCartAndFavourite(meal, quantity);
    }
    else if(quantity==0){
      meal.quantity=quantity;
      await deleteMealFromCartAndUpdateFavourite(meal);
    }
    calculateTotalPrice();
    emit(QuantityOfMealDecreased());
  }

  Future<void> updateCartAndFavourite(Meal meal, int quantity) async {
    meal.quantity=quantity;
    updateAccountCart(meal);
    await SqfLite.updateMealInDatabaseCart(meal,account!);
    await SqfLite.updateMealInDatabaseFavourite(meal,account!);
  }

  Future addMealToCart(Meal meal)async{
    bool mealFound=false;
    emit(AddingMealToCartInProgress());
    if(account!.mapOfCartMeals.containsKey(meal.mealID)){
      account!.mapOfCartMeals[meal.mealID]=meal;
      mealFound=true;
    }
    if(!mealFound){
      account!.mapOfCartMeals[meal.mealID]=meal;
    }
    calculateTotalPrice();
    await SqfLite.insertIntoDatabase(meal,account!).then((value) async{
      await SqfLite.updateMealInDatabaseFavourite(meal,account!);
      emit(MealAddedToCart());
    });
    emit(QuantityOfMealIncreased());
  }

  void updateAccountCart(Meal meal) {
    account!.mapOfCartMeals[meal.mealID]=meal;
  }

  Future removeMealFromCart(Meal meal)async{
    account!.mapOfCartMeals.remove(meal.mealID);
    emit(MealDeletedFromUserMeals());
  }

  Future removeMealFromFavourites(Meal meal)async{
    account!.mapOfFavouritesMeals.remove(meal.mealID);
    emit(MealDeletedFromUserFavourites());
  }

  Future resetCubitData()async{
    total=0;
    account!.meals.clear();
    account!.mapOfCartMeals.clear();
    changeValueOfPayOnArrival("");
    categories.forEach((element) {
      element.meals.forEach((meal) {
        meal.quantity=0;
      });
    });
    await SqfLite.removeCachedData(account!);
    emit(AccountIsReseated());
  }

  void addMealToFavourite(Meal meal){
    bool mealFound=false;
    if(account!.mapOfFavouritesMeals.containsKey(meal.mealID)){
      account!.mapOfFavouritesMeals[meal.mealID]=meal;
      mealFound=true;
    }
    if(!mealFound){
      account!.mapOfFavouritesMeals[meal.mealID]=meal;
      SqfLite.insertMealIntoFavourites(meal,account!);
    }
    emit(MealAddedToFavourite());
  }

  void updateAccount(UserAccount userAccount){
    account =userAccount;
    currentIndex=0;
    currentPage=pages[0];
    emit(AccountIsUpdated());
  }

  void setInitialControllerPage(){
    controller=PageController(initialPage: currentFlipIndex);
    emit(SetControl());
  }

  void changePosition(int newPosition){
    currentPage=pages[newPosition];
    currentIndex=newPosition;
    emit(PositionChanged());
  }

  void goToNextPage (PageController controller){
    controller.nextPage(duration: kTabScrollDuration, curve: Curves.ease);
  }

  Future<void> register (UserAccount userAccount)async{

    emit(LoadingIndicator());
    account =await Firebase.register(userAccount)??null;
    if(account!=null){
      await loadData().then((value) {
        emit(ValidUserState());
      });
    }
    else{
      emit(InvalidUserState());
    }
  }

  Future<void> changeCurrentCategory(int index)async{
    currentCategoryPosition=index;
    popularMeals=categories[index].meals;
    emit(PositionChanged());
  }

  void login(String username,String password)async{
    emit(LoadingIndicator());
    account  =await Firebase.login(username, password)??null;
    if(account!=null){
      await loadData().then((value) async {
        emit(ValidUserState());
      });
    }
    else{
      emit(InvalidUserState());
    }
  }

  Future loadData()async{
    emit(LoadingIndicator());
    await getAllCategories();
    await getCachedData();
    emit(DataIsInLoadingPhase());
  }

  Future<void> getAllCategories()async{
    await Firebase.getCategories().then((value) {
      this.categories=value;
    });
  }

  Future deleteMealFromCartAndUpdateFavourite(Meal meal)async{
    await SqfLite.deleteMealFromDatabaseCart(meal,account!);
    meal.quantity=0;
    removeMealFromCart(meal);
    await SqfLite.updateMealInDatabaseFavourite(meal,account!);
  }

  Future deleteMealFromFavouriteAndUpdateCart(Meal meal)async{
    emit(DeleteMealFromFavouritesInProgress());
    await SqfLite.deleteMealFromDatabaseFavourite(meal,account!);
    meal.quantity=0;
    await removeMealFromFavourites(meal);
    await SqfLite.updateMealInDatabaseFavourite(meal,account!);

  }

  Future makeOrder()async{
    await Firebase.makeOrder(account!);
  }
}