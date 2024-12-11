import 'package:ecommerceaudio/product/constants/app_image_constants.dart';
import 'package:flutter/material.dart';

final class CircleProfilePicture extends StatelessWidget {
  const CircleProfilePicture(this.radius, {super.key});

  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: const AssetImage(AppImageConstants.profilePic),
      backgroundColor: Colors.transparent,
    );
  }
}
