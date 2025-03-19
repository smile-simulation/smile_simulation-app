import 'package:flutter/material.dart';
import 'package:smile_simulation/generated/assets.dart';

class OtherUserCircleImage extends StatelessWidget {
  const OtherUserCircleImage({super.key, required this.onTap});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundImage: AssetImage(Assets.imagesEngMahmoudMagdy),
      ),
    );
  }
}
