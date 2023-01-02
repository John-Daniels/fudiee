import 'package:flutter/material.dart';
import 'package:fudiee/screens/home/widgets/category_card.dart';
import 'package:fudiee/themes/app_colors.dart';
import 'package:fudiee/widgets/buttons/app_icon_button.dart';

class PopularNowCard extends StatelessWidget {
  const PopularNowCard({
    Key? key,
    required this.title,
    required this.deliveryTime,
    required this.price,
    required this.onPressed,
    required this.onLike,
    required this.image,
    this.favorite = false,
  }) : super(key: key);

  final String title;
  final double deliveryTime;
  final double price;
  final String image;
  final VoidCallback onPressed;
  final Function(bool value) onLike;
  final bool favorite;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 155,
          height: 230,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [lightBoxShadow],
          ),
          // padding: EdgeInsets.zero,
          child: Column(
            children: [
              Transform.translate(
                offset: const Offset(0, -8),
                child: Transform.scale(
                  scale: 1.2,
                  child: FadeInImage(
                    placeholder: AssetImage(image),
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 145,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 14,
                            letterSpacing: 1.1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${deliveryTime.round()} minutes delivery',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text('\$$price'),
                      ],
                    ),
                    AppIconButton(
                      icon: const Icon(
                        Icons.add_circle_rounded,
                        color: Colors.pink,
                      ),
                      onPressed: onPressed,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: 0,
          child: IconButton(
            onPressed: () => onLike(!favorite),
            icon: favorite
                ? const Icon(
                    Icons.favorite,
                    color: Colors.pink,
                  )
                : Icon(
                    Icons.favorite_border,
                    color: greyColor,
                  ),
          ),
        ),
      ],
    );
  }
}
