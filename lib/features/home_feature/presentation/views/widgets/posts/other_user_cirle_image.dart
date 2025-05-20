import 'package:flutter/material.dart';
import 'package:smile_simulation/generated/assets.dart';

class UserCircleImage extends StatelessWidget {
  const UserCircleImage({
    super.key,
    required this.onTap,
    this.imageProvider = const AssetImage(Assets.imagesUser),
  });
  
  final Function() onTap;
  final ImageProvider imageProvider;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(backgroundImage: imageProvider, radius: 22),
    );
  }
}
