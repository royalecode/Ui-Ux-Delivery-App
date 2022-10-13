import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_ux/src/ui/global_widgets/custom_form.dart';
import 'package:ui_ux/src/utils/colors.dart';

class InputText extends StatefulWidget {
  final Widget prefixIcon;
  final String Function(String) validator;
  final bool obscureText;
  final void Function(String) onchanged;
  final void Function(String) onSubmitted;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String labelText;

  const InputText({
    Key key,
    this.prefixIcon,
    this.validator,
    this.obscureText = false,
    this.onchanged,
    this.onSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.labelText,
  }) : super(key: key);

  @override
  State<InputText> createState() => InputTextState();
}

class InputTextState extends State<InputText> {
  String _errorText = '';
  bool _obscureText;
  CustomFormState _formState;

  String get errorText => _errorText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _formState = CustomForm.of(context);
      _formState?.register(this);
    });
  }

  @override
  void deactivate() {
    _formState?.remove(this);
    super.deactivate();
  }

  void _validate(String text) {
    if (widget.validator != null) {
      _errorText = widget.validator(text);
      setState(() {});
    }

    if (widget.onchanged != null) {
      widget.onchanged(text);
    }
  }

  void _onVisibleChange() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _validate,
      obscureText: _obscureText,
      onSubmitted: widget.onSubmitted,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.obscureText
            ? CupertinoButton(
                minSize: 25,
                padding: const EdgeInsets.all(10),
                onPressed: _onVisibleChange,
                child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
              )
            : Icon(
                Icons.check_circle,
                color: _errorText == null ? primaryColor : Colors.grey,
              ),
      ),
    );
  }
}
