import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/ui/pages/onboard/onboard_controller.dart';
import 'package:ui_ux/src/utils/font_styles.dart';

import '../../../../data/models/onboard_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardSlider extends StatelessWidget {
  const OnboardSlider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OnboardController>(context, listen: false);

    return Expanded(
      child: PageView(
        controller: controller.pageController,
        children: List.generate(
          controller.items.length,
          (index) {
            final OnBoardItem item = controller.items[index];

            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: SvgPicture.asset(item.image),
                    ),
                    Text(
                      item.title,
                      textAlign: TextAlign.center,
                      style: FontStyles.title,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      item.description,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
