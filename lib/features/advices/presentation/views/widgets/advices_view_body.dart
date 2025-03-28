import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_app_bar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/posts/edit_post_view_body.dart';
import 'package:smile_simulation/generated/l10n.dart';

class AdvicesViewBody extends StatelessWidget {
  const AdvicesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'النصائح',),
        Expanded(
          child: CustomBodyScreen(child: Container(child: Text("Hello"))),
        ),
      ],
    );
  }
}
