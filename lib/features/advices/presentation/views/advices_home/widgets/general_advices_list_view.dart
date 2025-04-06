import 'package:flutter/material.dart';
import '../../../../data/models/advice/advice.dart';
import '../../widgets/custom_advice.dart';

class GeneralAdvicesListView extends StatelessWidget {
  const GeneralAdvicesListView({super.key, required this.advices});
  final List<Advice> advices;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CustomAdvice(advice: advices[index]);
      },
      separatorBuilder: (context, index) => SizedBox(height: 16),
      itemCount: advices.length,
    );
  }
}
