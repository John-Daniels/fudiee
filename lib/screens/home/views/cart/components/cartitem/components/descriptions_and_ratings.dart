import 'package:flutter/material.dart';

class BuildDescriptionsAndRatings extends StatelessWidget {
  const BuildDescriptionsAndRatings({
    Key? key,
    required this.title,
    required this.desc,
    required this.rating,
  }) : super(key: key);

  final String title;
  final String desc;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 11),
              SizedBox(
                width: 320,
                child: Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              )
            ],
          ),
        ),
        const Positioned(
          right: 0,
          child: Icon(
            Icons.star,
            color: Colors.amber,
          ),
        )
      ],
    );
  }
}
