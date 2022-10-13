import 'package:flutter/material.dart';
import 'package:ui_ux/src/ui/pages/forgot_password/forgot_password_controller.dart';
import 'package:ui_ux/src/ui/pages/forgot_password/widgets/forgot_password_form.dart';
import 'package:provider/provider.dart';
import '../../../utils/font_styles.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForgotPasswordController>(
      create: (_) => ForgotPasswordController(),
      builder: (_, __) {
        final MediaQueryData data = MediaQuery.of(_);
        final Size size = data.size;
        final padding = data.padding;

        final AppBar appBar = AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        );

        return Scaffold(
          appBar: appBar,
          body: SafeArea(
            child: SingleChildScrollView(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Container(
                  width: double.infinity,
                  height: size.height - padding.top - padding.bottom - appBar.preferredSize.height,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Forgot Password",
                        style: FontStyles.title.copyWith(
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 30,
                        ),
                        child: Text(
                          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
                          style: FontStyles.normal.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ForgotPasswordForm(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
