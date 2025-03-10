import 'package:flutter/material.dart';
import 'package:smile_simulation/core/services/localization_helper.dart';

class PostFooterActionItem extends StatelessWidget {
  const PostFooterActionItem({
    super.key,
    required this.onTap,
    required this.actionText,
    required this.icon,
  });
  final Function() onTap;
  final String actionText;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          SizedBox(width: 6),
          Text(LocalizationHelper.translate(actionText)),
        ],
      ),
    );
  }
}
