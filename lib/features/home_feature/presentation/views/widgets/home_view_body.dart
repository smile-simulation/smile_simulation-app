import 'package:flutter/material.dart';
import 'custom_flexible_app_bar.dart';
import 'home_view_body_content.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [CustomFlexibleAppBar()];
      },
      body: HomeViewBodyContent(scrollController: _scrollController,),
    );
  }

}
