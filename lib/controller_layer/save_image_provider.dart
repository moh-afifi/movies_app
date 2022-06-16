import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:squadio_task/utils/check_connection.dart';
import '../global_helpers/common_snackbar.dart';

class SaveImageProvider extends ChangeNotifier {
  bool spinner = false;

  changeSpinner(bool val) {
    spinner = val;
    notifyListeners();
  }

  Future<void> saveImage({BuildContext context, String imageUrl, String imageName}) async {
    if (await CheckInternet.checkInternet(context)) {
      var permission = await Permission.storage.status;
      await [
        Permission.storage,
      ].request();

      if (permission.isGranted) {
        changeSpinner(true);
        var response = await Dio().get(
          imageUrl,
          options: Options(responseType: ResponseType.bytes),
        );
        await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data),
          quality: 80,
          name: imageName,
        );
        changeSpinner(false);
        showSnackBar(
          context,
          backgroundColor: Colors.teal,
          textColor: Colors.white,
          text: 'Photo Saved Successfully',
        );
      }
    }else{
      showSnackBar(
        context,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        text: 'No Internet Connection',
      );
    }

  }
}
