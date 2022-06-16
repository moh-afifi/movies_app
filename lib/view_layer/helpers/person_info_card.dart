import 'package:flutter/material.dart';

import '../../data_layer/models/popular_people_model.dart';
import '../../global_helpers/net_image.dart';

class PersonInfoCard extends StatelessWidget {
  const PersonInfoCard({Key key,this.model}) : super(key: key);
  final Results model;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            NetImage(
              model.profilePath??'',
              height: 140,
              width: 120,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  model?.name ?? '',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Spacer(),
                Text(
                  'Know For: '
                  '${model?.knownForDepartment ?? ''}',
                  style: const TextStyle(color: Colors.white),
                ),
                const Spacer(),
                Text(
                  'Popularity: '
                  '${model?.popularity?.toStringAsFixed(1) ?? ''}',
                  style: const TextStyle(color: Colors.white),
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
