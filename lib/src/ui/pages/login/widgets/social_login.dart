import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../global_widgets/circle_button.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/font_styles.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Or via social media",
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleButton(
              onPressed: () {},
              iconPath: "assets/pages/welcome/facebook.svg",
              backgroundColor: Colors.blueAccent,
            ),
            const SizedBox(
              width: 10,
            ),
            CircleButton(
              onPressed: () {},
              iconPath: "assets/pages/welcome/google.svg",
              backgroundColor: Colors.redAccent,
            ),
            const SizedBox(
              width: 10,
            ),
            CircleButton(
              onPressed: () {},
              iconPath: "assets/pages/welcome/apple.svg",
              backgroundColor: Colors.grey,
            ),
          ],
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text(
              "Don't have an account?",
            ),
            CupertinoButton(
              child: Text(
                "Sign Up",
                style: FontStyles.regular,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.REGISTER);
              },
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
