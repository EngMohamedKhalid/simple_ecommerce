import 'package:go_router/go_router.dart';
import 'package:simple_ecommerce/layout/home_screen.dart';
import 'package:simple_ecommerce/modules/add_product_module/add_product_screen.dart';
import 'package:simple_ecommerce/modules/added_products_module/added_products_screen.dart';
import 'package:simple_ecommerce/modules/login_module/login_screen.dart';
import 'package:simple_ecommerce/shared/constant.dart';


abstract class AppRoutes{
  static final route = GoRouter(
      routes: [
        GoRoute(
          path: "/",
          builder: (context, state) => token==null?const LoginScreen():const HomeScreen(),
        ),
        GoRoute(
          path: "/add",
          builder: (context, state) =>const AddProductScreen(),
        ),
        GoRoute(
          path: "/home",
          builder: (context, state) =>const HomeScreen(),
        ),
        GoRoute(
          path: "/added",
          builder: (context, state) =>const AddedProductScreen(),
        ),

      ]
  );


}