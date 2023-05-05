import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/models/product_model.dart';

class CustomHomeItem extends StatelessWidget {
  const CustomHomeItem({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return
      Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          width: 250.w,
          height: 250.h,
          child: Card(
            shadowColor: Colors.blue,
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModel.title,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${productModel.price} EGP",
                      style: TextStyle(
                        //fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "${productModel.ratingModel.rate}",
                          style: TextStyle(
                            //fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              color: Colors.black),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 30.sp,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 10.h,
          child: Image.network(
            productModel.image,
            height: 100.h,
            width: 100.w,
          ),
        ),
      ],
    );
  }
}
