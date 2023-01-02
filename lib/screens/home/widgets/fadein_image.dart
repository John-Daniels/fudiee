import 'package:flutter/material.dart';

class AppFadeinImageView extends StatelessWidget {
  const AppFadeinImageView({super.key, required this.image, this.fit});

  final ImageProvider<Object> image;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: image,
      image: image,
      fit: fit,
    );
  }
}
