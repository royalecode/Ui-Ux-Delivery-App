import 'package:flutter/material.dart';
import 'package:ui_ux/src/ui/global_widgets/input_text.dart';
import 'package:ui_ux/src/ui/global_widgets/rounded_button.dart';
import 'package:provider/provider.dart';
import 'package:ui_ux/src/ui/pages/register/register_controller.dart';

import '../../../global_widgets/custom_form.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/dialogs.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key key}) : super(key: key);

  void _submit(BuildContext context) async {
    final controller = context.read<RegisterController>();
    final isFormOK = controller.formKey.currentState.validate();

    if (isFormOK) {
      ProgressDialog.show(context);

      final isOk = await controller.submit();
      Navigator.pop(context);
      if (!isOk) {
        Dialogs.alert(
          context,
          title: "ERROR",
          description: "Register failed",
        );
      } else {
        await Dialogs.alert(
          context,
          title: "GOOD",
          description: "Register Ok",
          okText: "Go to login",
          dismissible: false,
        );
        Navigator.pop(context);
      }
    } else {
      Dialogs.alert(
          context,
          title: "Error",
          description: "Invalid inputs",
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RegisterController>();

    return CustomForm(
      key: controller.formKey,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 340,
        ),
        child: Column(
          children: [
            InputText(
              labelText: "Name",
              validator: (text) {
                return text.trim().length > 1 ? null : "Invalid name";
              },
              prefixIcon: Icon(Icons.person_outline),
              onchanged: controller.onNameChanged,
            ),
            const SizedBox(
              height: 15,
            ),
            InputText(
              labelText: "Last Name",
              validator: (text) {
                return text.trim().length > 1 ? null : "Invalid last name";
              },
              prefixIcon: Icon(Icons.person_add_outlined),
              onchanged: controller.onLastnameChanged,
            ),
            const SizedBox(
              height: 15,
            ),
            InputText(
              labelText: "Email",
              validator: (text) {
                return text.contains("@") ? null : "Invalid email";
              },
              prefixIcon: Icon(Icons.email_outlined),
              keyboardType: TextInputType.emailAddress,
              onchanged: controller.onEmailChanged,
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: RoundedButton(
                onPressed: () {
                  _submit(context);
                },
                fullWidth: false,
                label: "Sign Up",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
