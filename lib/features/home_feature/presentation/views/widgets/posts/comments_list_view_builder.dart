
import 'package:flutter/material.dart';

import 'comment.dart';

class CommentsListViewBuilder extends StatelessWidget {
  const CommentsListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Comment();
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 24);
      },
      itemCount: 16,
    );
  }
}
