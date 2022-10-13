import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/utils/dialogs.dart';
import '../../../../data/models/user.dart';
import '../../../global_widgets/input_text.dart';
import '../../../global_widgets/rounded_button.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/font_styles.dart';
import '../login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  void _submit(BuildContext context) async {
    final controller = context.read<LoginController>();
    ProgressDialog.show(context);

    final User user = await controller.submit();
    Navigator.pop(context);
    if (user == null) {
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          title: Text("ERROR"),
          content: Text("Invalid email or password"),
        ),
      );
    } else {
      // go to home
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.HOME,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoginController>(context, listen: false);

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 340),
      child: Column(
        children: [
          InputText(
            prefixIcon: Icon(Icons.email_outlined),
            validator: (text) {
              if(text.contains("@")) return null;
              return "Invalid email";
            },
            labelText: "Email",
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            onchanged: controller.onEmailChanged,
          ),
          const SizedBox(
            height: 20,
          ),
          InputText(
            labelText: "Password",
            prefixIcon: Icon(Icons.lock_outline),
            obscureText: true,
            textInputAction: TextInputAction.send,
            onchanged: controller.onPasswordChanged,
            onSubmitted: (text) => _submit(context),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: CupertinoButton(
              child: Text(
                "Forgot Password",
                style: FontStyles.regular,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.FORGOT_PASSWORD);
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          RoundedButton(
            onPressed: () => _submit(context),
            label: "Login",
            fullWidth: false,
            padding: const EdgeInsets.symmetric(
              vertical: 9,
              horizontal: 50,
            ),
          ),
        ],
      ),
    );
  }
}
