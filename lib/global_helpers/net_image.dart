import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mismar_app/utilities/vars.dart';
import 'package:shimmer/shimmer.dart';

import '../../utilities/app_util.dart';
import '../../utilities/path_util.dart';

class NetImage extends CachedNetworkImage {

  NetImage(
    String src,
      {
    Key? key,
    String? url,
    double? height,
    double? width,
    BoxFit? fit,
    Color? color,
    String? errorImage,
    BoxFit? errorImageFit,
    bool errorWidgetIsLoadingWidget = false,
    bool showErrorWidget = true,
  }) : super(
          key: key,
          imageUrl: Connection.IMG_URL + src,
          width: width,
          height: height,
          fit: fit ?? BoxFit.cover,
          color: color,
          placeholder: (context, url) => errorWidgetIsLoadingWidget
              ? Image.asset(
                  errorImage ?? PathUtil.appIcon,
                  height: 75.sp,
                  width: 75.sp,
                  // color: ColorUtil.primaryGreen,
                  fit: BoxFit.contain,
                )
              : Shimmer.fromColors(
                  baseColor: Colors.transparent,
                  highlightColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: AppUtil.borderRadius6,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
          errorWidget: (context, url, error) => showErrorWidget
              ? Image.asset(
                  errorImage ?? PathUtil.appIcon,
                  // color: ColorUtil.primaryGreen,
                  fit: errorImageFit ?? BoxFit.contain,
                )
              : const SizedBox.shrink(),
        );
}
