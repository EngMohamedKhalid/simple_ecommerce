import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_ecommerce/shared/constant.dart';
import 'package:simple_ecommerce/shared/network/local/cash_helper.dart';
import 'package:simple_ecommerce/shared/routes.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  token = CashHelper.getData(key:"token");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder:(context,child){
          return  MaterialApp.router(
            routerConfig: AppRoutes.route,
            debugShowCheckedModeBanner: false,
          );
        }
    );
  }
}

