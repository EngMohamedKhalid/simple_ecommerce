import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_ecommerce/shared/components/custom_button.dart';
import 'package:simple_ecommerce/shared/components/custom_text_field.dart';
import 'package:simple_ecommerce/shared/network/local/cash_helper.dart';
import 'package:simple_ecommerce/shared/network/remote/api_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController(text: "mor_2314");
  TextEditingController passwordController = TextEditingController(text: "83r5^_");
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 75.h
          ),
          children: [
             Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28.sp,
              ),
            ),
             SizedBox(height: 13.h,),
             Text(
              "Please sign in to continue",
              style: TextStyle(
                fontSize: 17.sp,
                color: Colors.black54
              ),
            ),
            SizedBox(height: 20.h,),
             Text(
              "Username",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 21.sp,
              ),
            ),
            SizedBox(height: 8.h,),
            CustomTextFormField(controller: nameController),
            SizedBox(height: 25.h,),
            Text(
              "Password",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 21.sp,
              ),
            ),
            SizedBox(height: 8.h,),
            CustomTextFormField(
                controller: passwordController,
                suffixIcon: IconButton(
                  onPressed: (){},
                  icon:const Icon(
                    Icons.visibility,
                    color: Colors.black54,
                  ),
                )
            ),
            SizedBox(height: 22.h,),
            CustomButton(
                text: "LOGIN",
                onPressed: (){
                  if(formKey.currentState!.validate()){
                    ApiServices().signIn(
                        username: nameController.text, password: passwordController.text
                    ).then((value){
                          Fluttertoast.showToast(
                            msg: "Login Successfully",
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 20,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3
                          ).then((value) {
                            GoRouter.of(context).pushReplacement("/home");
                          });
                        CashHelper.saveData(key: "token", value: value.token);
                    }).catchError((error){
                      Fluttertoast.showToast(
                          msg: "Something Error,please try again",
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 20,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3
                      );
                    });
                  }
                },
            ),
            SizedBox(height: 12.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.black
                  ),
                ),
                TextButton(
                    onPressed: (){},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 18.5.sp
                      ),
                    ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
