import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squadio_task/controller_layer/popular_people_provider.dart';
import 'package:squadio_task/view_layer/views/popular_people_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Squadio Task',
      debugShowCheckedModeBanner: false,
      home:  ChangeNotifierProvider(
        create: (context) => PopularPeopleProvider(),
        child: const PopularPeopleView(),
      ),
    );
  }
}
