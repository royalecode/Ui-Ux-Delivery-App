import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/ui/pages/onboard/widgets/slider.dart';

import 'onboard_controller.dart';
import 'widgets/bottom_controls.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnboardController>(
      create: (_) {
        final controller = OnboardController();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.afterFirstLayout();
        });
        return controller;
      },
      builder: (context, __) => Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              children: const [
                OnboardSlider(),
                SizedBox(
                  height: 50,
                ),
                OnboardControls(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}