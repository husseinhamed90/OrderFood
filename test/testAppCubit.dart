import 'package:mockito/annotations.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Models/Restaurant.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:orderfood/Repository.dart';


class repositoryMock extends Mock implements Repository{}
class mockAppcubit extends Mock implements AppCubit{
  repositoryMock repo;
  mockAppcubit(this.repo);
}
void main(){
  setUp((){

  });
  tearDown((){

  });
  //var mock=new mockAppcubit(new Repository());
  repositoryMock r =new repositoryMock();
  mockAppcubit mockAppcubut =new mockAppcubit(r);
  test('Counter value should be incremented', ()async{
     // List<Restaurant> dataBase =await mock.GetAllResturants();
     // print(dataBase);

  });

  // test('Counter value should be incremented 1', (){
  //   expect(mock.increamentCounter(), 1);
  // });
  // test('Counter value should be decreament 0', (){
  //   expect(mock.decreamentCounter(), 1);
  // });
}