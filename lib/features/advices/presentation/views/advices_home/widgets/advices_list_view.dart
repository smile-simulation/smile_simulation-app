import 'package:flutter/material.dart';
import '../../../../data/models/advice/advice.dart';
import '../../widgets/custom_advice.dart';

class AdvicesListView extends StatelessWidget {
  const AdvicesListView({
    super.key,
    required this.advices,
    this.physics,
    this.shrinkWrap,
  });

  final List<Advice> advices;
  final ScrollPhysics? physics;
  final bool? shrinkWrap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: physics ?? NeverScrollableScrollPhysics(),
      shrinkWrap: shrinkWrap ?? true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            top: index == 0 ? 24 : 0,
            bottom: index == advices.length - 1 ? 16 : 0,
          ),
          child: CustomAdvice(advice: advices[index]),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 16),
      itemCount: advices.length,
    );
  }
}
