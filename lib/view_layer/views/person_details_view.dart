import 'package:flutter/material.dart';
import 'package:squadio_task/view_layer/helpers/movies_card.dart';
import 'package:squadio_task/view_layer/helpers/person_info_card.dart';
import '../../data_layer/models/popular_people_model.dart';

class PersonDetailsView extends StatelessWidget {
  const PersonDetailsView({Key key, this.model}) : super(key: key);
  final Results model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(height: 10,),
             PersonInfoCard(model: model,),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  key: const Key('grid_view'),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemCount: model.knownFor.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MoviesCard(
                      key: const Key('grid_view_card'),
                      model: model?.knownFor[index],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
