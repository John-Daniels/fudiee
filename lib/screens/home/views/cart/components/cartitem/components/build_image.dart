import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fudiee/screens/home/widgets/fadein_image.dart';
import 'package:get/get.dart';

class BuildImage extends StatelessWidget {
  const BuildImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      child: SizedBox(
        width: double.infinity,
        height: Get.height * 0.4,
        child: Transform.scale(
          scale: 1.1,
          child: AppFadeinImageView(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
