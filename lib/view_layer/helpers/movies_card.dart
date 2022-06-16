import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squadio_task/data_layer/models/popular_people_model.dart';
import 'package:squadio_task/global_helpers/net_image.dart';
import 'package:squadio_task/view_layer/helpers/full_image_view.dart';

import '../../controller_layer/save_image_provider.dart';

class MoviesCard extends StatelessWidget {
  const MoviesCard({Key key, this.model}) : super(key: key);
  final KnownFor model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => SaveImageProvider(),
              child: FullImageView(
                imageUrl: model.posterPath??'',
                imageName: model.title ?? 'image',
              ),
            ),
          ),
        );
      },
      child: Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NetImage(
              model.posterPath??'',
              height: 200,
              width: double.infinity,
            ),
            Text(
              model.title ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    model.mediaType ?? '',
                    style: const TextStyle(
                      fontSize: 12,
                        color: Colors.white
                    ),
                  ),
                  const Spacer(),
                  Text(
                    model.voteAverage.toString()??'',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}
