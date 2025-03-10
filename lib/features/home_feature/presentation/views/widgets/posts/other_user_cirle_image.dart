import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_assets.dart';

class OtherUserCircleImage extends StatelessWidget {
  const OtherUserCircleImage({super.key});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(AppAssets.userImage),
      radius: 24,
    );
  }
}
