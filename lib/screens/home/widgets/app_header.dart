import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fudiee/constants/assets_constant.dart';
import 'package:fudiee/screens/home/widgets/app_circle_image.dart';

class AvaterHeaderWithNotifications extends StatelessWidget {
  const AvaterHeaderWithNotifications({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppCircleImage(
          image: Assets.profilePic,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Hello Bella!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Hungry? We got you covered!',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Color(0xFF6A6A6A),
              ),
            ),
          ],
        ),
        const Spacer(),
        // Image.asset(Assets.badgedNotif),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          icon: const NotificationBell(isActive: true),
        ),
      ],
    );
  }
}

class NotificationBell extends StatelessWidget {
  const NotificationBell({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Icon(
          CupertinoIcons.bell,
          size: 27,
        ),
        if (isActive)
          const Positioned(
            top: 3.4,
            right: 5,
            child: CircleAvatar(
              backgroundColor: Colors.pink,
              radius: 4,
            ),
          )
      ],
    );
  }
}
