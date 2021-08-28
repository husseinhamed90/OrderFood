import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderfood/Cubits/AppCubit/AppCubit.dart';
import 'package:orderfood/Cubits/AppCubit/CubitStates.dart';
import 'package:orderfood/Models/Category.dart';

class BuildCategoryItem extends StatelessWidget {
  Category category;
  int index;
  BuildCategoryItem(this.category,this.index);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,CubitState>(
      listener: (context, state) {},
      builder: (context, state) =>  GestureDetector(
        onTap: () {
          AppCubit.get(context).changeCurrentCategory(index);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 109,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: (AppCubit.get(context).currentcategoryposition==index)?
                    Colors.black:Color(0xffF9881F),
                    width: 1,
                  )),
              //   height: double.infinity-0,
              width: 82,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffA9E88B).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(45)),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Image.network("${category.path}",height: 24,width: 24,),
                    ),
                    flex: 5,
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "${category.name}",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              // alignment: Alignment.center,
              height: 87,
              width: 65,
            ),
          ],
        ),
      ),
    );
  }

}