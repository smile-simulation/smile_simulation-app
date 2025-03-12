import 'package:flutter/material.dart';

import '../post_view.dart';
import 'posts/custom_post.dart';

class PostsListViewBuilder extends StatelessWidget {
  const PostsListViewBuilder({super.key, this.isSliver = false});
  final bool isSliver;
  final bool currentUser = true;
  @override
  Widget build(BuildContext context) {
    return isSliver
        ? SliverList.separated(
          itemBuilder: (context, index) {
            return CustomPost(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PostView();
                    },
                  ),
                );
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PostView();
                    },
                  ),
                );
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
