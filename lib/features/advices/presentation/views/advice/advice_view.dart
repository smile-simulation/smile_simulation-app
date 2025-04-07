import 'package:flutter/material.dart';
import 'package:smile_simulation/features/advices/presentation/views/advice/widgets/advice_view_body.dart';

import '../../../data/models/advice/advice.dart';

class AdviceView extends StatelessWidget {
  const AdviceView({super.key, required this.advice});
  static const routeName = 'adviceView';
  final Advice advice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AdviceViewBody(advice: advice));
  }
}
