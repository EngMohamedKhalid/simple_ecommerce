import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key, required this.controller, this.suffixIcon, this.prefixIcon, this.hintText, this.maxLines=1, this.keyType, this.initValue}) : super(key: key);
 final TextEditingController controller;
 final Widget? suffixIcon;
 final Widget? prefixIcon;
 final String? hintText;
 final String? initValue;
 final int? maxLines;
 final TextInputType? keyType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyType,
      initialValue: initValue,
      validator: (value) {
        if(value!.isEmpty){
          return "Field Must be Not Empty";
        }
        else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 22.h,horizontal: 10.w),
          fillColor: Colors.blue.withOpacity(.2),
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.white,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                  color: Colors.white
              )
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon
      ),
    );
  }
}
