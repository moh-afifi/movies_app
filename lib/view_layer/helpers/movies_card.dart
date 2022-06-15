import 'package:flutter/material.dart';
import 'package:squadio_task/data_layer/models/popular_people_model.dart';
import 'package:squadio_task/global_helpers/net_image.dart';

class MoviesCard extends StatelessWidget {
  const MoviesCard({Key? key, this.model}) : super(key: key);
  final KnownFor? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NetImage(
            model!.posterPath!,
            height: 250,
            width: double.infinity,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            model!.title ?? '',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  model!.mediaType ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Text(
                  model!.voteAverage.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
            height: 10,
          ),
        ],
      ),
    );
  }
}