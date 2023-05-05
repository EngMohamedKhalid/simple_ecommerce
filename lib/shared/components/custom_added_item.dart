import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/models/add_product_model.dart';
import 'package:simple_ecommerce/modules/update_product_module/update_product_screen.dart';
import 'package:simple_ecommerce/shared/constant.dart';
import 'package:simple_ecommerce/shared/network/remote/api_services.dart';

class CustomAddedItem extends StatefulWidget {
  const CustomAddedItem({Key? key, required this.productModel, this.image, required this.id}) : super(key: key);
final AddProductModel productModel;
final int id;
final File? image;

  @override
  State<CustomAddedItem> createState() => _CustomAddedItemState();
}

class _CustomAddedItemState extends State<CustomAddedItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blue,
      elevation: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                 image: FileImage(widget.image!),
                  width: 100.w,
                  height: 100.h,
                ),
                IconButton(
                  onPressed:(){
                    ApiServices().deleteProduct(id: widget.productModel.id).then((value){
                      addedList.remove(widget.productModel);
                    });
                  },
                  icon: Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.red,
                    size: 35.sp,
                  ),
                )
              ],
            ),
          ),
          Text(
            widget.productModel.category,
            style: TextStyle(
              fontSize: 19.sp,
            ),
          ),
          Text(
            "${widget.productModel.price.toString()} EGP",
            style: TextStyle(
              fontSize: 19.sp,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: (){
                 Navigator.of(context).push(
                   MaterialPageRoute(
                     builder: (context) => UpdateProductScreen(
                       id: widget.id,
                     ),
                   )
                 );
                },
                child: Text(
                  "Edit Product",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


