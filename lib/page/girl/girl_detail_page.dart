
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:wan_android/controller/girl/girl_detail_controller.dart';

class GirlDetailPage extends GetView<GirlDetailController> {
  final String imageUrl;
  const GirlDetailPage({Key key,this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        onTap: (){
          Get.back();
        },
        onDoubleTap:() {

        },
        child: Hero(
          tag: imageUrl,
          child: PhotoView(
            imageProvider: CachedNetworkImageProvider(imageUrl),
          ),
        ),
      )
    );
  }
}
