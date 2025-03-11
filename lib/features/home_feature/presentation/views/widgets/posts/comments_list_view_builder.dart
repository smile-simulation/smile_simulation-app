import 'package:flutter/material.dart';

import 'comment.dart';

class CommentsListViewBuilder extends StatelessWidget {
  const CommentsListViewBuilder({super.key, this.isSliver = false});
  final bool isSliver;
  @override
  Widget build(BuildContext context) {
    return !isSliver
        ? ListView.separated(
          itemBuilder: (context, index) {
            return Comment(
              userName: 'محمود مجدي',
              comment: 'أحسنت، شكراً لك!',
              date: '3 ساعات',
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 24);
          },
          itemCount: 16,
        )
        : SliverList.separated(
          itemBuilder: (context, index) {
            return Comment(
              userName: 'محمود مجدي',
              comment: 'أحسنت، شكراً لك!',
              date: '3 ساعات',
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 24);
          },
          itemCount: 16,
        );
  }
}
