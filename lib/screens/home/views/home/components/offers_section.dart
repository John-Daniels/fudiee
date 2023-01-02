import 'package:flutter/material.dart';
import 'package:fudiee/constants/data.dart';
import 'package:fudiee/screens/home/widgets/offer_card.dart';

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
