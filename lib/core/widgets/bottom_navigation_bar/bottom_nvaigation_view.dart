import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/features/advices/presentation/views/advices_home/advices_home_view.dart';
import 'package:smile_simulation/features/home_feature/presentation/views/home_veiw.dart';
import 'package:smile_simulation/features/more/presentation/views/more_view.dart';
import 'package:smile_simulation/features/reminders/presentation/views/reminders_view.dart';

import '../../../features/medical_record/presentation/views/medical_record_user_view.dart';
import '../../../features/medical_record/presentation/views/medical_record_view.dart';
import 'custom_bottom_navigation_bar.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({super.key});
  static const String routeName = 'bottomNavigationView';
  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> views = [
    HomeVeiw(),
    AdvicesHomeView(),
    RemindersView(),
    MedicalRecordUserView(),
    MoreView(),
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
