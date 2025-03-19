import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/widgets/home_view_body.dart';

import 'widgets/bottom_navigation_bar/custom_bottom_navigation_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
static const String routeName = 'home';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> views = [
    HomeViewBody(),
    Center(child: Text("النصائح")),
    Center(child: Text("التذكيرات")),
    Center(child: Text("السجل الطبي")),
    Center(child: Text("المزيد")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primaryColor,
      body: views[_selectedIndex],
    );
  }
}
