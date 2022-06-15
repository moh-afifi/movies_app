import 'package:flutter/material.dart';

class CommonErrorMessage extends StatelessWidget {
  const CommonErrorMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Error Happened..\nCheck Your Internet Connection',
        style: TextStyle(
          fontSize: 16,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
