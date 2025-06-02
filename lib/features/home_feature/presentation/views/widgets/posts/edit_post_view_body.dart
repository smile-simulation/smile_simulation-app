import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/database/cache/cache_helper.dart';
import '../../../../../../generated/assets.dart';
import 'custom_post_image.dart';

class EditPostViewBody extends StatelessWidget {
  const EditPostViewBody({super.key, required this.post});
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final userMap = CacheHelper().getMap(key: userData)!;
    final size = MediaQuery.of(context).size;

    return CustomBodyScreen(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.03),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        (userMap['image'] != null &&
                                userMap['image'].toString().isNotEmpty)
                            ? NetworkImage(userMap['image'])
                            : const AssetImage(Assets.imagesUser)
                                as ImageProvider,
                    radius: size.width * 0.06,
                  ),
                  SizedBox(width: size.width * 0.03),
                  Expanded(
                    child: Text(
                      userMap['fullName'] ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.headline2(context).copyWith(
                        fontSize: size.width * 0.045,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.image,
                    color: AppColors.primaryColor,
                    size: size.width * 0.06,
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.04),
              EditPostForm(
                initialText: post.content ?? '',
                imageLink: post.postImage,
                size: size,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditPostForm extends StatefulWidget {
  const EditPostForm({
    super.key,
    required this.initialText,
    required this.imageLink,
    required this.size,
  });

  final String initialText;
  final String? imageLink;
  final Size size;

  @override
  State<EditPostForm> createState() => _EditPostFormState();
}

class _EditPostFormState extends State<EditPostForm> {
  late final TextEditingController _postController;

  @override
  void initState() {
    super.initState();
    _postController = TextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.imageLink != null) ...[
          Container(
            height: size.height / 3,
            alignment: Alignment.center,
            width: double.infinity,
            child: CustomPostImage(imageLink: widget.imageLink!),
          ),
          SizedBox(height: size.height * 0.02),
        ],
        TextFormField(
          controller: _postController,
          maxLines: 6,
          decoration: InputDecoration(
            hintText: 'S.of(context).writeSomething',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        SizedBox(height: size.height * 0.04),
        CustomButton(
          onPressed: () {
            // context.read<PostsCubit>().editPost(_postController.text);
          },
          title: S.of(context).edit,
        ),
        SizedBox(height: size.height * 0.02),
      ],
    );
  }
}
