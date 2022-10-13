import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/font_styles.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color textColor, backgroundColor, borderColor;
  final bool fullWidth;
  final EdgeInsets padding;
  final double fontSize;

  const RoundedButton({
    Key key,
    @required this.onPressed,
    @required this.label, 
    this.textColor = Colors.white, 
    this.backgroundColor = primaryColor, 
    this.borderColor = primaryColor, 
    this.fullWidth = true, 
    this.padding = const EdgeInsets.symmetric(vertical: 9, horizontal: 30,), 
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: this.onPressed,
      minSize: 30,
      padding: EdgeInsets.zero,
      child: Container(
        width: this.fullWidth ? double.infinity : null,
        padding: this.padding,
        decoration: BoxDecoration(
          color: this.backgroundColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 1.4,
            color: this.borderColor,
          )
        ),
        child: Text(
          this.label,
          textAlign: TextAlign.center,
          style: FontStyles.normal.copyWith(
            fontWeight: FontWeight.w600,
            color: this.textColor,
            fontSize: this.fontSize,
          ),
        ),
      ),
    );
  }
}
