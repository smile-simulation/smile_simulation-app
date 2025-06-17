import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/helper_functions/format_date_time_ago.dart';
import 'package:smile_simulation/core/helper_functions/show_modal_bottom_sheet.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/features/home_feature/data/models/post_model.dart';
import 'package:smile_simulation/features/home_feature/data/repos/posts_repo/posts_repo_implement.dart';
import 'package:smile_simulation/features/home_feature/presentation/cubits/posts_cubit/posts_cubit.dart';
import 'package:smile_simulation/features/user_account/presentation/views/widgets/more_actions_admin_bottom_sheet.dart';

import '../../../../../../generated/assets.dart';
import '../../../../../user_account/presentation/views/user_account_view.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    super.key,
    required this.currentUser,
    this.clickablePostImage = true,
    required this.post,
  });

  final PostModel post;
  final bool currentUser;
  final bool clickablePostImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          currentUser
              ? CircleAvatar(
                backgroundImage:
                    post.publisherImage != null
                        ? CachedNetworkImageProvider(post.publisherImage!)
                        : AssetImage(Assets.imagesUser),
                radius: 20,
              )
              : InkWell(
                onTap: () {
                  if (clickablePostImage) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return UserAccountView(
                            currentUser: false,
                            userId: post.publisherId!,
                            userName: post.publisherName!,
                            userImage: post.publisherImage,
                          );
                        },
                      ),
                    );
                  }
                },
                child: CircleAvatar(
                  backgroundImage:
                      post.publisherImage != null
                          ? CachedNetworkImageProvider(post.publisherImage!)
                          : AssetImage(Assets.imagesUser),
                  radius: 20,
                ),
              ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.publisherName ?? "لا يوجد اسم ناشر",
                style: AppTextStyles.headline3(
                  context,
                ).copyWith(color: AppColors.primaryColor),
              ),
              Text(
                formatDateTimeAgo(rawDate: post.createdAt.toString()),
                style: AppTextStyles.caption2(context),
              ),
            ],
          ),
          Spacer(),
          ((CacheHelper().getMap(key: userData)!["email"] ==
                      "7oooooda2017@gmail.com") ||
                  (currentUser ||
                      post.publisherId ==
                          CacheHelper().getMap(key: userData)!["userId"]))
              ? IconButton(
                onPressed: () {
                  customShowModalBottomSheet(
                    context: context,
                    builder: (p0) {
                      final double height =
                          MediaQuery.of(context).size.height * 0.22;
                      return BlocProvider(
                        create: (context) {
                          return PostsCubit(
                            PostsRepoImplement(
                              dioConsumer: DioConsumer(dio: Dio()),
                            ),
                          );
                        },
                        child: MoreActionsAdminBottomShet(
                          height: height,
                          post: post,
                          update:
                              (CacheHelper().getMap(key: userData)!["email"] !=
                                  "7oooooda2017@gmail.com"),
                        ),
                      );
                    },
                  );
                },

                icon: Icon(
                  Icons.more_horiz_outlined,
                  color: AppColors.greyColor,
                  size: 28,
                ),
              )
              : SizedBox(),

          (post.publisherRole == "Doctor")
              ? SvgPicture.asset(Assets.imagesDoctorIcon, width: 16)
              : SvgPicture.asset(Assets.imagesUserIcon, width: 16),
        ],
      ),
    );
  }
}
