import 'package:go_router/go_router.dart';
import 'package:simple_ecommerce/modules/login/login_screen.dart';


abstract class AppRoutes{
  static final route = GoRouter(
      routes: [
        GoRoute(
          path: "/",
          builder: (context, state) =>const LoginScreen(),
        ),
      ]
  );


}