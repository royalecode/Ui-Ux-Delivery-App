

import 'package:ui_ux/src/data/providers/remote/food_menu_provider.dart';
import 'package:ui_ux/src/data/repositores/food_menu_repository.dart';
import 'package:ui_ux/src/data/repositories_implementation/food_menu_repository_impl.dart';
import 'package:ui_ux/src/helpers/get.dart';

import '../data/providers/remote/authentication_provider.dart';
import '../data/repositores/authentication_repository.dart';
import '../data/repositories_implementation/authentication_repository_impl.dart';

abstract class DependencyInjection {
  
  static void initialize() {
    final AuthenticationRepository authenticationRepository = AuthenticationRepositoryImpl(
      AuthenticationProvider(),
    );

    final FoodMenuRepository foodMenuRepository = FoodMenuRepositoryImpl(
      FoodMenuProvider(),
    );

    Get.i.put<AuthenticationRepository>(authenticationRepository);
    Get.i.put<FoodMenuRepository>(foodMenuRepository);
  }
}