import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_ecommerce/shared/components/custom_added_item.dart';
import 'package:simple_ecommerce/shared/constant.dart';

class AddedProductScreen extends StatefulWidget {
  const AddedProductScreen({Key? key,   this.file}) : super(key: key);
  //final AddProductModel productModel;
  final File? file;
  @override
  State<AddedProductScreen> createState() => _AddedProductScreenState();
}

class _AddedProductScreenState extends State<AddedProductScreen> {

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Added Products"
        ),
        leading: IconButton(
            onPressed: (){
              GoRouter.of(context).pushReplacement("/home");
            },
            icon: Icon(
              Icons.arrow_back_sharp,
              size: 25.sp,
            ),
        ),
      ),
      body:  GridView.builder(
        itemCount: addedList.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 5
        ),
        itemBuilder: (context, index) {
          return CustomAddedItem(
            productModel: addedList[index],
            image: widget.file,
            id: index,
          );
        },
      )
    );
  }
}
