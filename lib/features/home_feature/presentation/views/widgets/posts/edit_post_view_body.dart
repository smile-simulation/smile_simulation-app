import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:smile_simulation/core/widgets/bottom_navigation_bar/bottom_nvaigation_view.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/generated/l10n.dart';
import 'package:smile_simulation/main.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/database/cache/cache_helper.dart';
import '../../../../../../generated/assets.dart';
import '../../../cubits/edit_post_cubit/edit_post_cubit.dart';
import 'custom_post_image.dart';

class EditPostViewBody extends StatelessWidget {
  const EditPostViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final userMap = CacheHelper().getMap(key: userData)!;
    final size = MediaQuery.of(context).size;

    return BlocConsumer<EditPostCubit, EditPostState>(
      listener: (BuildContext context, EditPostState state) {
        if (state is EditPostSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigationView()),
            (route) => false, // امسح كل اللي قبل
          );
        }
      },

      builder: (context, state) {
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
                            userMap['image'] != null &&
                                    userMap['image'].toString().isNotEmpty
                                ? NetworkImage(userMap['image'])
                                : AssetImage(Assets.imagesUser),

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
                      IconButton(
                        onPressed: () async {
                          await context.read<EditPostCubit>().pickImage();
                        },
                        icon: Icon(
                          Icons.image,
                          color: AppColors.primaryColor,
                          size: size.width * 0.06,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.04),
                  EditPostForm(
                    initialText:
                        context.read<EditPostCubit>().post.content ?? '',
                    imageLink: context.read<EditPostCubit>().post.postImage,
                    size: size,
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
  late EditPostCubit cubit;
  @override
  void initState() {
    cubit = context.read<EditPostCubit>();
    cubit.contentController.text = cubit.post.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EditPostCubit>();
    final size = widget.size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (cubit.imageFile != null) ...[
          Stack(
            alignment:
                isArabic == 'ar'
                    ? AlignmentDirectional.topStart
                    : AlignmentDirectional.topEnd,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.memory(
                  cubit.imageBytes!,
                  width: double.infinity,
                  height: size.height / 3,
                  fit: BoxFit.cover,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close, color: AppColors.redColor),
                onPressed: () {
                  cubit.clearImage();
                  setState(() {});
                },
              ),
            ],
          ),
          SizedBox(height: size.height * 0.02),
        ] else if (widget.imageLink != null) ...[
          Container(
            height: size.height / 3,
            alignment: Alignment.center,
            width: double.infinity,
            child: CustomPostImage(imageLink: widget.imageLink!),
          ),
          SizedBox(height: size.height * 0.02),
        ],
        TextFormField(
          controller: cubit.contentController,
          maxLines: 6,
          decoration: InputDecoration(
            hintText: S.of(context).writeSomething,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        SizedBox(height: size.height * 0.04),
        cubit.state is EditPostLoading
            ? Center(child: CircularProgressIndicator())
            : CustomButton(
              onPressed: () {
                context.read<EditPostCubit>().EditPost(
                  onError: (txt) {
                    MotionToast.error(
                      toastAlignment: Alignment.topCenter,
                      description: Text(txt),
                    ).show(context);
                  },
                );
              },
              title: S.of(context).edit,
            ),
        SizedBox(height: size.height * 0.02),
      ],
    );
  }
}
