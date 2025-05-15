import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/services/pick_image_surevice.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/home_feature/presentation/cubits/add_post_cubit/add_post_cubit.dart';
import 'package:smile_simulation/generated/l10n.dart';

class AddPostTextField extends StatefulWidget {
  const AddPostTextField({super.key});

  @override
  State<AddPostTextField> createState() => _AddPostTextFieldState();
}

class _AddPostTextFieldState extends State<AddPostTextField> {
  @override
  Widget build(BuildContext context) {
    AddPostCubit cubit = context.read<AddPostCubit>();
    return BlocBuilder<AddPostCubit, AddPostState>(
      builder: (context, state) {
        return TextField(
          controller: cubit.contentController,
          maxLines: null,
          minLines: 1,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () async {
                await cubit.pickImage();
              },
              icon: Icon(Icons.image, color: AppColors.primaryColor),
            ),
            hintText: S.of(context).postContent,
            hintStyle: AppTextStyles.headline2(
              context,
            ).copyWith(color: AppColors.greyColor),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2.0,
              ), // Border color when focused
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white.withValues()),
            ),
          ),
        );
      },
    );
  }
}
