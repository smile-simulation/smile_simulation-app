import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_assets.dart';

class OtherUserCircleImage extends StatelessWidget {
  const OtherUserCircleImage({super.key, required this.onTap});
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundImage: AssetImage(AppAssets.userImage),
      ),
    );
  }
}
