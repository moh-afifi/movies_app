import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class SaveImageProvider extends ChangeNotifier {
  bool spinner = false;

  changeSpinner(bool val) {
    spinner = val;
    notifyListeners();
  }

  Future<void> saveImage({BuildContext? context, String? imageUrl, String? imageName}) async {
    var permission = await Permission.storage.status;
    await [
      Permission.storage,
    ].request();

    if (permission.isGranted) {
      changeSpinner(true);
      var response = await Dio().get(
        imageUrl!,
        options: Options(responseType: ResponseType.bytes),
      );
      await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 80,
        name: imageName,
      );
      changeSpinner(false);
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            'Photo Saved Successfully',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }
}
