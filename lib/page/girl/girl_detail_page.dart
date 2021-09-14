import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:oktoast/oktoast.dart';
import 'package:photo_view/photo_view.dart';
import 'package:wan_android/controller/girl/girl_detail_controller.dart';
import 'package:wan_android/http/http_manager.dart';
import 'package:wan_android/theme/app_style.dart';

class GirlDetailPage extends GetView<GirlDetailController> {
  final String imageUrl;

  const GirlDetailPage({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:lightSystemUiStyle,
      child: Scaffold(
        body: Stack(
          children: [_buildImageContent(), _buildSaveButton()],
        ),
      ),
    );
  }

  _buildImageContent() {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Hero(
        tag: imageUrl,
        child: PhotoView(
          imageProvider: CachedNetworkImageProvider(imageUrl),
        ),
      ),
    );
  }

  _buildSaveButton() {
    return Positioned(
      child:SafeArea(
        child: TextButton(
          child: Text("保存", style: TextStyle(color: Colors.white, fontSize: 16.sp)),
          onPressed: () async{
            await _saveImage();
          },
        ),
      ),
      bottom: 5.0.h,
      right: 10.0.w,
    );
  }

  _saveImage() async {
    //保存图片到本地
    var data = await HttpManager.instance.request(imageUrl, option: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(data),
        quality: 100,
        name: imageUrl.substring(
            imageUrl.lastIndexOf("/"), imageUrl.lastIndexOf(".")));
    if (Platform.isAndroid) {
      showToast(result != null ? "保存成功" : "保存失败",
          position: ToastPosition.bottom);
    } else {
      showToast(result ? "保存成功" : "保存失败", position: ToastPosition.bottom);
    }
  }
}
