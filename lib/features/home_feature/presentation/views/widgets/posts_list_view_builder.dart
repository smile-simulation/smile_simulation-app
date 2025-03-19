import 'package:flutter/material.dart';
import 'package:smile_simulation/core/services/navigations.dart';

import '../post_view.dart';
import 'posts/custom_post.dart';

class PostsListViewBuilder extends StatelessWidget {
  const PostsListViewBuilder({
    super.key,
    this.isSliver = false,
    this.clickablePostImage = true,
    required this.currentUser,
  });
  final bool isSliver;
  final bool currentUser;
  final bool clickablePostImage;
  @override
  Widget build(BuildContext context) {
    return isSliver
        ? SliverList.separated(
          itemBuilder: (context, index) {
            return CustomPost(
              clickablePostImage: clickablePostImage,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return PostView();
                //     },
                //   ),
                // );
                navigateTo(context, PostView());
              },
              currentUser: currentUser,
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 28);
          },
          itemCount: 10,
        )
        : ListView.separated(
          itemBuilder: (context, index) {
            return CustomPost(
              clickablePostImage: clickablePostImage,
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return PostView();
                //     },
                //   ),
                // );
                navigateTo(context, PostView());
              },
              currentUser: currentUser,
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 28);
          },
          itemCount: 10,
        );
  }
}
