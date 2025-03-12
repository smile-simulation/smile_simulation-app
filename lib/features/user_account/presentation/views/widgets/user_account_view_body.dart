import 'package:flutter/material.dart';

import 'user_account_header.dart';
import 'user_account_view_body_content.dart';

class UserAccountViewBody extends StatelessWidget {
  const UserAccountViewBody({super.key, required this.currentUser});
  final bool currentUser;
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            child: UserAccountHeader(currentUser: currentUser),
          ),
        ];
      },
      body: UserAccountViewBodyContent(),
    );
  }
}
