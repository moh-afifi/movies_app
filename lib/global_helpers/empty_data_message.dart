import 'package:flutter/material.dart';

class EmptyDataMessage extends StatelessWidget {
  const EmptyDataMessage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No Data Found..',
        style: TextStyle(
          fontSize: 16,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
