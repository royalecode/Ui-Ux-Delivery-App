

import 'package:flutter/material.dart';
import 'package:ui_ux/src/ui/pages/my_cart/my_cart_page.dart';
import 'package:ui_ux/src/ui/pages/dish/dish_page.dart';
import 'package:ui_ux/src/ui/pages/forgot_password/forgot_password_page.dart';
import 'package:ui_ux/src/ui/pages/home/home_page.dart';
import 'package:ui_ux/src/ui/pages/login/login_page.dart';
import 'package:ui_ux/src/ui/pages/onboard/onboard_page.dart';
import 'package:ui_ux/src/ui/pages/register/register_page.dart';
import 'package:ui_ux/src/ui/pages/welcome/welcome_page.dart';

import 'routes.dart';

abstract class Pages{

  static const String INITIAL = Routes.ONBOARD;

  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.ONBOARD: (_) => const OnBoardPage(),
    Routes.WELCOME: (_) => const WelcomePage(),
    Routes.LOGIN: (_) => const LoginPage(),
    Routes.REGISTER: (_) => const RegisterPage(),
    Routes.FORGOT_PASSWORD: (_) => const ForgotPasswordPage(),
    Routes.HOME: (_) => const HomePage(),
    Routes.DISH: (_) => const DishPage(),
    Routes.CHECK_OUT: (_) => const MyCartPage(),
    Routes.MY_CART: (_) => const MyCartPage(),
  };

}