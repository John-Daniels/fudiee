import 'package:flutter/material.dart';
import 'package:fudiee/screens/home/widgets/fadein_image.dart';
import 'package:fudiee/themes/app_colors.dart';

class MealSuggestionWidget extends StatelessWidget {
  const MealSuggestionWidget({
    Key? key,
    required this.image,
    required this.onAdd,
    this.isAdded = false,
  }) : super(key: key);

  final String image;
  final VoidCallback onAdd;
  final bool isAdded;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 81,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              width: 81,
              height: 81,
              child: Transform.scale(
                scale: 1.1,
                child: AppFadeinImageView(
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
          Positioned(
            right: -13,
            bottom: -13,
            child: IconButton(
              onPressed: onAdd,
              icon: Icon(
                Icons.add_circle_rounded,
                size: 20,
                color: pinkColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
