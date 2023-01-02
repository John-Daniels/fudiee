import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fudiee/constants/assets_constant.dart';
import 'package:fudiee/themes/app_colors.dart';

import 'meal_suggestion_widget.dart';

class AddYourMeal extends StatelessWidget {
  const AddYourMeal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // probably add some more metadata
    final List suggestedMeals = [
      Assets.cake2,
      Assets.iceCream,
      Assets.iceCream1
    ];
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Add to your meal',
            style: TextStyle(
              fontSize: 16,
              color: primaryTextColor,
            ),
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          width: double.infinity,
          height: 81,
          child: ListView.separated(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MealSuggestionWidget(
                image: suggestedMeals[index],
                onAdd: () {},
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 68),
            itemCount: 3,
          ),
        )
      ],
    );
  }
}
