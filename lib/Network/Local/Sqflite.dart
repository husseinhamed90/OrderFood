import 'package:orderfood/Models/Meal.dart';
import 'package:orderfood/Models/UserAccount.dart';
import 'package:sqflite/sqflite.dart';

class SqfLite{

  static late Database database;

  static Future<Database> init() async
  {
    print("init is called");
    database = await createDataBase();

    print("database is created");
    print(database);
    return database;
  }
  static Future<Database> createDataBase()async{
    return await openDatabase(
      "Cart.db"
      ,version: 1,
      onCreate: (db, version) {
        db.execute("CREATE TABLE Cart (id INTEGER PRIMARY KEY,mealname TEXT, description TEXT ,mealprice REAL ,quantity INTEGER ,userID TEXT,path TEXT,mealID TEXT,categoryId TEXT)").then((value) {
          print("Table is Created");
        });
        db.execute("CREATE TABLE Favourites (id INTEGER PRIMARY KEY,mealname TEXT, description TEXT ,mealprice REAL ,quantity INTEGER ,userID TEXT,path TEXT,mealID TEXT,categoryId TEXT)").then((value) {
          print("Table is Created");
        });
      },onOpen: (db) {
      print("Database is Opened");
    },).then((value) {
      print("DataBase Created");
      database=value;
      return value;
    });
  }


  static Future removeCachedData(UserAccount account)async{
    await database.transaction((txn) {
      return txn.rawDelete('DELETE FROM Cart WHERE userID = "${account.id}"').then((value) {
      });
    });
  }

  static Future updateMealInDatabaseCart(Meal meal,UserAccount account)async{
    await database.transaction((txn) {
      return txn.rawUpdate('UPDATE Cart SET quantity = ${meal.quantity} WHERE(userID ="${account.id}" AND mealID = "${meal.mealID}")').then((value) {
        print("Record Updated Successfully 2");
      });
    });
  }

  static Future updateMealInDatabaseFavourite(Meal meal,UserAccount account)async{
    await database.transaction((txn) {
      return txn.rawUpdate('UPDATE Favourites SET quantity = ${meal.quantity} WHERE(userID ="${account.id}" AND mealID = "${meal.mealID}")').then((value) {
        print("Record Updated Successfully");
      });
    });
  }


  static Future deleteMealFromDatabaseCart(Meal meal,UserAccount account)async{
    await database.transaction((txn) {
      return txn.rawDelete('DELETE FROM Cart WHERE (userID ="${account.id}" AND mealID = "${meal.mealID}")').then((value) async {
        print("Record Deleted Successfully");
      });
    });
  }


  static Future insertIntoDatabase(Meal meal,UserAccount account)async{
    await  database.transaction((txn) {
      return txn.rawInsert('INSERT INTO Cart (mealname, description, mealprice, quantity, userID, path ,mealID,categoryId) VALUES ("${meal.mealname}","${meal.description}",${meal.mealprice},${meal.quantity},"${account.id}","${meal.path}","${meal.mealID}","${meal.categoryId}")').then((value) {
        print("Record added Successfully");
      });
    });
  }

  static Future insertMealIntoFavourites(Meal meal,UserAccount account)async{
    await database.transaction((txn) {
      return txn.rawInsert('INSERT INTO Favourites (mealname, description, mealprice, quantity, userID, path ,mealID,categoryId) VALUES ("${meal.mealname}","${meal.description}",${meal.mealprice},${meal.quantity},"${account.id}","${meal.path}","${meal.mealID}","${meal.categoryId}")').then((value) {
        print("Record added Successfully");
      });
    });
  }

  static Future deleteMealFromDatabaseFavourite(Meal meal,UserAccount account)async{

    await database.transaction((txn) {
      return txn.rawDelete('DELETE FROM Favourites WHERE (userID ="${account.id}" AND mealID = "${meal.mealID}")').then((value) {
        print("Record Deleted Successfully");
      });
    });
  }

  static Future<List<Map<String ,dynamic>>>  getUserFavouritesMeals(UserAccount account)async{
    return await database.transaction((txn) {
      return txn.rawQuery('SELECT * FROM Favourites WHERE userID = "${account.id}"').then((value) {
        print("Favourites coming Successfully");
        print("return now 1");
        return value;
      });
    });
  }

  static Future<List<Map<String ,dynamic>>> getUserCartMeals(UserAccount account)async{
    return await database.transaction((txn) {
      return txn.rawQuery('SELECT * FROM Cart WHERE userID = "${account.id}"').then((value) {
        print("Meals coming Successfully");

        return value;
      });
    });
  }

}