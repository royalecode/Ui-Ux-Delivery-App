import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/ui/pages/dish/dish_controller.dart';
import 'package:flutter/services.dart';
import 'package:ui_ux/src/ui/pages/dish/widgets/add_to_cart_button.dart';
import 'package:ui_ux/src/ui/global_widgets/dish_counter.dart';
import 'package:ui_ux/src/ui/pages/dish/widgets/dish_header.dart';
import 'package:ui_ux/src/ui/pages/home/home_controller.dart';
import 'package:ui_ux/src/utils/colors.dart';
import 'package:ui_ux/src/utils/font_styles.dart';

import '../../../helpers/get.dart';

class DishPage extends StatelessWidget {
  const DishPage({Key key}) : super(key: key);

  void _setStatusBar(bool light) {
    SystemChrome.setSystemUIOverlayStyle(
      light ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
    );
  }

  void _toggleFavorite(BuildContext context) {
    final homeController = Get.i.find<HomeController>();
    final controller = context.read<DishController>();
    if (!controller.isFavorite) {
      final SnackBar snackBar = SnackBar(
        content: const Text(
          "Added to favorites",
          textAlign: TextAlign.center,
        ),
        backgroundColor: primaryColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    controller.toggleFavorite();
    homeController.toggleFavorite(controller.dish);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DishController>(
      create: (_) {
        final homeController = Get.i.find<HomeController>();
        final DishPageArguments args =
            ModalRoute.of(context).settings.arguments;
        final isFavorite = homeController.isFavorite(args.dish);

        final controller = DishController(args, isFavorite);
        _setStatusBar(true);
        controller.onDispose = () => _setStatusBar(false);
        return controller;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: AddToCartButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DishHeader(),
                Builder(
                  builder: (_) {
                    final controller = Provider.of<DishController>(_);
                    final dish = controller.dish;

                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dish.name,
                                      style: FontStyles.title,
                                    ),
                                    Text(
                                      "\$ ${dish.price}",
                                      style: FontStyles.regular
                                          .copyWith(fontSize: 30),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CupertinoButton(
                                padding: const EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                  "assets/pages/home/favorite.svg",
                                  width: 35,
                                  height: 35,
                                  color: controller.isFavorite
                                      ? primaryColor
                                      : Colors.grey,
                                ),
                                onPressed: () => _toggleFavorite(_),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          DishCounter(
                            onChanged: controller.onCounterChanged,
                            initialValue: controller.dish.counter,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            dish.description,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
