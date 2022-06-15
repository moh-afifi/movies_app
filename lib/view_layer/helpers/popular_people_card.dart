import 'package:flutter/material.dart';
import 'package:squadio_task/data_layer/models/popular_people_model.dart';
import 'package:squadio_task/global_helpers/net_image.dart';
import 'package:squadio_task/view_layer/views/person_details_view.dart';

class PopularPeopleCard extends StatelessWidget {
  const PopularPeopleCard({Key? key, this.model}) : super(key: key);
  final Result? model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PersonDetailsView(model: model),
          ),
        );
      },
      child: Card(
        elevation: 10,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            NetImage(model!.profilePath!,
                height: 350, width: double.infinity, fit: BoxFit.fill),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                model!.name!,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
