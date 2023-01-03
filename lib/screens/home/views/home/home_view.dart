import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiee/constants/data.dart';
import 'package:fudiee/screens/home/widgets/app_header.dart';
import 'package:fudiee/screens/home/widgets/category_card.dart';
import 'package:fudiee/screens/home/widgets/search_bar.dart';

import 'components/header_section.dart';
import 'components/offers_section.dart';
import '../../widgets/popular_now_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String seletedCategory = '';
  List<String> favorites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // height: Get.height,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const AvaterHeaderWithNotifications(),
            const SizedBox(height: 35),
            const SearchBar(),
            const SizedBox(height: 30),
            // offers section
            const OffersSection(),
            const SizedBox(height: 20),
            HeaderSection(
              onPressed: () {},
              title: 'Categories',
            ),

            // categories section
            SizedBox(
              height: 115,
              child: ListView.separated(
                clipBehavior: Clip.none,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                separatorBuilder: (context, index) => const SizedBox(width: 23),
                itemBuilder: (context, index) {
                  final category = categoryData[index];
                  return CategoryCard(
                    category: category.category,
                    image: category.image,
                    onSelected: (value) {
                      setState(() {
                        if (value) {
                          seletedCategory = category.category;
                        } else {
                          seletedCategory = '';
                        }
                      });
                    },
                    selected:
                        seletedCategory == category.category ? true : false,
                  );
                },
              ),
            ),

            //
            HeaderSection(
              onPressed: () {},
              title: 'Popular Now',
            ),

            SizedBox(
              height: 230,
              child: ListView.separated(
                shrinkWrap: true,
                clipBehavior: Clip.none,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (context, index) => const SizedBox(width: 23),
                itemBuilder: (_, index) {
                  final food = popularData[index];
                  return PopularNowCard(
                    title: food.title,
                    deliveryTime: food.deliveryTime,
                    price: food.price,
                    image: food.image,
                    onPressed: () {},
                    favorite: favorites.contains(food.title),
                    onLike: (value) {
                      value && !favorites.contains(food.title)
                          ? setState(() => favorites.add(food.title))
                          : setState(() => favorites.remove(food.title));
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
