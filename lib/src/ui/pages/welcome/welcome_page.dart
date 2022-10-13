import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_ux/src/ui/global_widgets/circle_button.dart';
import 'package:ui_ux/src/ui/global_widgets/rounded_button.dart';
import 'package:ui_ux/src/utils/font_styles.dart';

import '../../../routes/routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SvgPicture.asset(
                    "assets/pages/welcome/welcome.svg",
                  ),
                ),
              ),
              Text(
                "Welcome",
                style: FontStyles.title,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 280,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: RoundedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Routes.LOGIN);
                        },
                        label: "Login",
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: RoundedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.REGISTER);
                        },
                        label: "Sign Up",
                        textColor: Colors.black,
                        backgroundColor: Colors.white,
                        borderColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
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
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
