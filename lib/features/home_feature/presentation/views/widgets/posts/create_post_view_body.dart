import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../../../../../constant.dart';
import '../../../../../../core/database/cache/cache_helper.dart';
import '../../../../../../core/widgets/bottom_navigation_bar/bottom_nvaigation_view.dart';
import '../../../../../../generated/assets.dart';
import '../../../cubits/add_post_cubit/add_post_cubit.dart';
import 'add_post_text_field.dart';

class CreatePostViewBody extends StatefulWidget {
  const CreatePostViewBody({super.key});

  @override
  State<CreatePostViewBody> createState() => _CreatePostViewBodyState();
}

class _CreatePostViewBodyState extends State<CreatePostViewBody> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocBuilder<AddPostCubit, AddPostState>(
        builder: (context, state) {
          return CustomBodyScreen(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  CacheHelper().getMap(
                                            key: userData,
                                          )!['image'] !=
                                          null
                                      ? NetworkImage(
                                        CacheHelper().getMap(
                                          key: userData,
                                        )!['image'],
                                      )
                                      : const AssetImage(Assets.imagesUser),
                              radius: 20,
                            ),
                            SizedBox(width: 12),
                            Text(
                              CacheHelper().getMap(
                                    key: userData,
                                  )!['fullName'] ??
                                  '',
                              overflow: TextOverflow.ellipsis,

                              style: AppTextStyles.headline3(context),
                            ),
                          ],
                        ),
                        BlocBuilder<AddPostCubit, AddPostState>(
                          builder: (context, state) {
                            log(state.toString());
                            if (context.read<AddPostCubit>().imageFile !=
                                null) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                ),
                                child: Visibility(
                                  visible:
                                      context.read<AddPostCubit>().imageFile !=
                                      null,
                                  child: Stack(
                                    alignment:
                                        isArabic == 'ar'
                                            ? AlignmentDirectional.topStart
                                            : AlignmentDirectional.topEnd,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.memory(
                                          context
                                              .read<AddPostCubit>()
                                              .imageBytes!,

                                          width: double.infinity,
                                          height: 300,
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          color: AppColors.redColor,
                                        ),
                                        onPressed: () {
                                          context
                                              .read<AddPostCubit>()
                                              .clearImage();
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return SizedBox();
                            }
                          },
                        ),
                        AddPostTextField(
                          controller:
                              context.read<AddPostCubit>().contentController,
                          onPressed: () async {
                            await context.read<AddPostCubit>().pickImage();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: BlocListener<AddPostCubit, AddPostState>(
                        listener: (context, state) {
                          if (state is AddPostSuccess) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              BottomNavigationView.routeName,
                              (_) => false,
                            );
                          }
                        },
                        child: CustomButton(
                          isLoading:
                              context.read<AddPostCubit>().state
                                      is AddPostLoading
                                  ? true
                                  : false,
                          onPressed: () {
                            context.read<AddPostCubit>().addPost(
                              onError: (txt) {
                                MotionToast.error(
                                  description: Text(txt),
                                ).show(context);
                              },
                            );
                          },
                          title: S.of(context).publish,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
