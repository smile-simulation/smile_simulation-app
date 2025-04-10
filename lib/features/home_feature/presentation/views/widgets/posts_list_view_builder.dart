import 'package:flutter/material.dart';

import '../../../data/models/post_model.dart';
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
                Navigator.pushNamed(
                  context,
                  PostView.routeName,
                  arguments: PostModel(
                    id: '1',
                    userName: 'محمود مجدي',
                    userImage: 'https://example.com/user.jpg',
                    content: 'هذا هو أول منشور لي!',
                    postDate: 'منذ يومين',
                    likes: 120,
                    commentsCount: 15,
                  ),
                );
              },
              currentUser: currentUser,
              isPostView: false,
              post: PostModel(
                id: '1',
                userName: 'محمود مجدي',
                userImage: 'https://example.com/user.jpg',
                content:
                    'نصيحة للعناية اليومية بالأسنان:\n'
                    'اغسل أسنانك مرتين يوميًا على الأقل باستخدام معجون يحتوي على الفلورايد، ولا تنسَ تنظيف اللسان.',
                postDate: 'منذ يومين',
                likes: 120,
                commentsCount: 15,
              ),
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
                Navigator.pushNamed(
                  context,
                  PostView.routeName,
                  arguments: PostModel(
                    id: '1',
                    userName: 'محمود مجدي',
                    userImage: 'https://example.com/user.jpg',
                    content:
                        'نصيحة للعناية اليومية بالأسنان:\n'
                        'اغسل أسنانك مرتين يوميًا على الأقل باستخدام معجون يحتوي على الفلورايد، ولا تنسَ تنظيف اللسان.',
                    postDate: 'منذ يومين',
                    likes: 120,
                    commentsCount: 15,
                  ),
                );
              },
              currentUser: currentUser,
              isPostView: false,
              post: PostModel(
                id: '1',
                userName: 'محمود مجدي',
                userImage: 'https://example.com/user.jpg',
                content:
                    'نصيحة للعناية اليومية بالأسنان:\n'
                    'اغسل أسنانك مرتين يوميًا على الأقل باستخدام معجون يحتوي على الفلورايد، ولا تنسَ تنظيف اللسان.',
                postDate: 'منذ يومين',
                likes: 120,
                commentsCount: 15,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 28);
          },
          itemCount: 10,
        );
  }
}
