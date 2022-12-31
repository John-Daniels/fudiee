import 'package:flutter/material.dart';
import 'package:fudiee/constants/data.dart';
import 'package:fudiee/screens/home/components/app_circle_image.dart';
import 'package:fudiee/screens/home/components/app_header.dart';
import 'package:fudiee/screens/home/components/offer_card.dart';
import 'package:fudiee/screens/home/components/search_bar.dart';
import 'package:fudiee/themes/app_colors.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var seletedCategory = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          height: Get.height,
          child: Column(
            children: [
              const SizedBox(height: 80),
              const AvaterHeaderWithNotifications(),
              const SizedBox(height: 35),
              const SearchBar(),
              const SizedBox(height: 30),
              // offers section
              const OffersSection(),
              const SizedBox(height: 30),
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
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 23),
                  itemBuilder: (context, index) {
                    final category = categoryData[index];
                    return CategoryCard(
                      category: category.category,
                      image: category.image,
                      onSelected: (value) {
                        print(value);
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
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.category,
    required this.image,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  final String category;
  final String image;
  final bool selected;
  final ValueChanged onSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelected(!selected),
      borderRadius: BorderRadius.circular(15),
      child: Ink(
        width: 119,
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? lightAmberColor : Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 1,
              color: greyColor.withOpacity(0.5),
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppCircleImage(image: image),
            Text(category),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              'See All',
              style: TextStyle(
                color: primaryColor,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OffersSection extends StatelessWidget {
  const OffersSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // padding: const EdgeInsets.only(left: 26),
      height: MediaQuery.of(context).size.height * 0.18,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        separatorBuilder: (context, index) => const SizedBox(width: 28),
        itemBuilder: (context, index) {
          final offer = offerData[index];
          return OfferCard(
            image: offer.image,
            percentOff: offer.percentOff,
            onPressed: () {},
            offer: offer.offer,
          );
        },
      ),
    );
  }
}
