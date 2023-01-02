import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './components/add_meal.dart';
import './components/build_image.dart';
import './components/descriptions_and_ratings.dart';
import './components/price_and_cart_actions.dart';
import 'package:fudiee/themes/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.index,
    required this.image,
    required this.title,
    required this.desc,
    required this.price,
    required this.rating,
  }) : super(key: key);

  final int index;
  final String image;
  final String title;
  final String desc;
  final double price;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BuildImage(image: image),
          const SizedBox(height: 10),
          SmoothIndicator(
            offset: index.toDouble(),
            count: 4,
            effect: const WormEffect(
              activeDotColor: Colors.pink,
              spacing: 12,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                BuildPriceAndCartActions(
                  price: price,
                  index: index,
                ),
                SizedBox(height: 34.h),
                BuildDescriptionsAndRatings(
                  title: title,
                  desc: desc,
                  rating: rating,
                  index: index,
                ),
                SizedBox(height: 25.h),
                const AddYourMeal(),
                SizedBox(height: 35.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: const Size(double.infinity, 60),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Place Order',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(height: 12.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
