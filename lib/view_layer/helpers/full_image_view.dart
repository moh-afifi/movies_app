import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:squadio_task/controller_layer/save_image_provider.dart';
import 'package:squadio_task/global_helpers/common_loader.dart';
import 'package:squadio_task/utils/api_handler.dart';

class FullImageView extends StatelessWidget {
  const FullImageView({Key key, this.imageUrl, this.imageName})
      : super(key: key);
  final String imageUrl, imageName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Consumer<SaveImageProvider>(
        builder: (context, saveImageProvider, child) {
          return ModalProgressHUD(
            inAsyncCall: saveImageProvider.spinner,
            progressIndicator: const CommonLoader(),
            child: Stack(
              children: [
                Container(
                  key: const Key('full_size_image'),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        '${ApiHandler.imageBaseUrl}$imageUrl',
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () async {
                      await saveImageProvider.saveImage(
                        imageName: imageName,
                        imageUrl: '${ApiHandler.imageBaseUrl}$imageUrl',
                        context: context,
                      );
                    },
                    child: const Icon(
                      Icons.save_alt,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
