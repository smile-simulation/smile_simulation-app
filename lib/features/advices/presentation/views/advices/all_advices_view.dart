import 'package:flutter/material.dart';

import '../../../data/models/advice/advice.dart';
import 'widgets/all_advices_view_body.dart';

class AllAdvicesView extends StatelessWidget {
  const AllAdvicesView({super.key, required this.advices});
  static const routeName = 'allAdvicesView';
  final List<Advice> advices;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AllAdvicesViewBody());
  }
}
