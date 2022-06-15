import 'package:flutter/material.dart';
import 'package:squadio_task/data_layer/models/popular_people_model.dart';

class PopularPeopleCard extends StatelessWidget {
  const PopularPeopleCard({Key? key, this.model}) : super(key: key);
  final Result? model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              model!.name!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20
              ),
            ),
          ),
        ],
      ),
    );
  }
}
