import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_ux/src/ui/pages/forgot_password/forgot_password_controller.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/utils/dialogs.dart';
import '../../../global_widgets/input_text.dart';
import '../../../global_widgets/rounded_button.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({Key key}) : super(key: key);

  void _submit(BuildContext context) async {
    final controller = context.read<ForgotPasswordController>();
    ProgressDialog.show(context);
    final sent = await controller.submit();
    Navigator.pop(context);

    if (sent) {
      await Dialogs.alert(
        context,
        title: "GOOD",
        description: "We have sent an email ${controller.email}",
        dismissible: false,
      );
      Navigator.pop(context);
    } else {
      Dialogs.alert(
        context,
        title: "Error",
        description: "Email ${controller.email} not found",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ForgotPasswordController>();

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 330,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          SvgPicture.asset(
            "assets/pages/forgot_password/forgot_password.svg",
            width: 250,
          ),
          const SizedBox(
            height: 25,
          ),
          InputText(
            prefixIcon: const Icon(Icons.email_rounded),
            labelText: "Email",
            onchanged: controller.onEmailChanged,
            validator: (text) {
              if (text.contains("@")) return null;
              return "Invalid email";
            },
          ),
          const SizedBox(
            height: 25,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: RoundedButton(
              onPressed: () => _submit(context),
              fullWidth: false,
              label: "Send",
            ),
          ),
        ],
      ),
    );
  }
}
