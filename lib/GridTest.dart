// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
// import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
// class GridTest extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocConsumer<AppCubit,CubitState>(
//         listener: (context, state) {
//
//         },
//         builder: (context, state) {
//           AppCubit appCubit =AppCubit.get(context);
//           return Container(
//             color: Colors.black,
//               padding: EdgeInsets.all(12.0),
//               child: GridView.builder(
//                 itemCount: appCubit.charchters.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 5,
//                     mainAxisSpacing: 5,
//                 ),
//                 itemBuilder: (BuildContext context, int index){
//                  // print(appCubit.charchters[index].img);
//                   return Card(
//                     child: Container(child: Stack(
//                       alignment: Alignment.bottomCenter,
//                       children: [
//                         Container(width: double.infinity,height: double.infinity,child: Image.network("${appCubit.charchters[index].img}",fit: BoxFit.fill,)),
//                         Container(height: 40,width: double.infinity,child: Center(child: Text("${appCubit.charchters[index].name}",style: TextStyle(
//                           color: Colors.white,fontSize: 15
//                         ),)),color: Colors.black.withOpacity(0.3),)
//                       ],
//                     )),
//                   );
//                 },
//               ));
//         },
//
//       ),
//     );
//   }
// }
