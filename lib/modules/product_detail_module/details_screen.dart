import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/models/product_model.dart';
import 'package:simple_ecommerce/shared/components/custom_button.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.productModel, }) : super(key: key);
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(
         productModel.title,
          style: const TextStyle(
           overflow: TextOverflow.ellipsis
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.network(
                productModel.image,
                width: 170.w,
                height: 160.h,
              ),
            ),
            SizedBox(height: 15.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    productModel.title,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      productModel.ratingModel.rate.toString(),
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
            ),
            SizedBox(height: 10.h,),
            Text(
               productModel.category,
              style: TextStyle(
                  fontSize: 19.sp,
                color: Colors.grey
              ),
            ),
            SizedBox(height: 10.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  productModel.price.toString(),
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600
                  ),
                ),
                Text(
                  " EGP",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Text(
              productModel.description,
              style: TextStyle(
                  fontSize: 19.sp,
                  color: Colors.grey
              ),
            ),
            const Spacer(),
           CustomButton(
               text: "Add To Cart",
               onPressed: (){},
           )
          ],
        ),
      ),

    );
  }
}
