import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:squadio_task/utils/api_handler.dart';

class NetImage extends CachedNetworkImage {
  NetImage(
    String src, {
    Key key,
    String url,
    double height,
    double width,
    BoxFit fit,
    Color color,
    String errorImage,
    BoxFit errorImageFit,
    bool errorWidgetIsLoadingWidget = false,
    bool showErrorWidget = true,
  }) : super(
          key: key,
          imageUrl: ApiHandler.imageBaseUrl + src,
          width: width,
          height: height,
          fit: fit ?? BoxFit.cover,
          color: color,
          placeholder: (context, url) => errorWidgetIsLoadingWidget
              ? Image.asset(
                  errorImage ?? 'images/spare.jpg',
                  height: 50,
                  width: 50,
                  // color: ColorUtil.primaryGreen,
                  fit: BoxFit.contain,
                )
              : Shimmer.fromColors(
                  baseColor: Colors.transparent,
                  highlightColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
          errorWidget: (context, url, error) => showErrorWidget
              ? Image.asset(
                  errorImage ?? 'images/spare.jpg',
                  fit: errorImageFit ?? BoxFit.contain,
                )
              : const SizedBox.shrink(),
        );
}
