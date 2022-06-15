import 'package:flutter/material.dart';
import 'package:squadio_task/global_helpers/net_image.dart';
import 'package:squadio_task/view_layer/helpers/movies_card.dart';

import '../../data_layer/models/popular_people_model.dart';

class PersonDetailsView extends StatelessWidget {
  const PersonDetailsView({Key? key, this.model}) : super(key: key);
  final Results? model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      NetImage(
                        model!.profilePath!,
                        height: 100,
                        width: 70,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text(
                            model?.name ?? '',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text('Know For: '
                              '${model?.knownForDepartment ?? ''}'),
                          Spacer(),
                          Text('Popularity: '
                              '${model?.popularity?.toStringAsFixed(1) ?? ''}'),
                          Spacer(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.48,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  itemCount: model!.knownFor!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MoviesCard(
                      model: model?.knownFor?[index],
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
