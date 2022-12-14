import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/ui/pages/home/home_controller.dart';
import 'package:ui_ux/src/ui/pages/home/tabs/favorites_tab/favorites_tab.dart';
import 'package:ui_ux/src/ui/pages/home/tabs/home_tab/home_tab.dart';
import 'package:ui_ux/src/ui/pages/home/tabs/notifications_tab.dart';
import 'package:ui_ux/src/ui/pages/home/tabs/profile_tab.dart';
import 'package:ui_ux/src/ui/pages/home/widgets/home_bottom_bar.dart';

import '../../../helpers/get.dart';
import 'widgets/my_cart_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
      create: (_){
        final controller = HomeController();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.afterFistLayout();
        });
        Get.i.put<HomeController>(controller);
        controller.onDispose = () => Get.i.remove<HomeController>();
        return controller;
      },
      builder: (_, __) {
        final controller = Provider.of<HomeController>(_, listen: false);

        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: HomeBottomBar(),
          floatingActionButton: const FloatingMyCartOutButton(),
          body: SafeArea(
            child: TabBarView(
              controller: controller.tabController,
              children: const [
                HomeTab(),
                FavoritesTab(),
                NotificationsTab(),
                ProfileTab(),
              ],
            ),
          ),
        );
      },
    );
  }
}