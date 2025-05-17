import 'package:flutter/material.dart';

import 'comment.dart';

class CommentsListViewBuilder extends StatefulWidget {
  const CommentsListViewBuilder({super.key, this.isSliver = false});
  final bool isSliver;

  @override
  State<CommentsListViewBuilder> createState() =>
      _CommentsListViewBuilderState();
}

class _CommentsListViewBuilderState extends State<CommentsListViewBuilder> {
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !widget.isSliver
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
