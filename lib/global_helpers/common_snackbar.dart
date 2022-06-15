import 'package:flutter/material.dart';

showSnackBar(BuildContext context,
    {Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    String? text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      content: Text(
        text ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
        ),
      ),
    ),
  );
}
