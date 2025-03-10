import 'package:flutter/material.dart';

import 'other_user_cirle_image.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [OtherUserCircleImage()]);
  }
}
