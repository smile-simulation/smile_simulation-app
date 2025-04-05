import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/generated/l10n.dart';

import '../../managers/cubits/advices_cubit/advices_cubit.dart';
import 'advices_section_header.dart';
import 'general_advices_list_view_builder.dart';

class GeneralAdvicesSection extends StatelessWidget {
  const GeneralAdvicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        BlocBuilder<AdvicesCubit, AdvicesState>(
          builder: (context, state) {
            return AdvicesSectionHeader(
              sectionTitle: S.of(context).generalAdvices,
              seeAllOnTap: () {
                if (context.read<AdvicesCubit>().advices.isNotEmpty) {
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppColors.primaryColor,
                      closeIconColor: AppColors.whiteColor,
                      content: Text(
                        S.of(context).noAdvicesExist,
                        style: AppTextStyles.button2(
                          context,
                        ).copyWith(color: AppColors.whiteColor),
                      ),
                    ),
                  );
                }
              },
            );
          },
        ),

        SizedBox(height: 16),
        GeneralAdvicesListViewBuilder(),
      ],
    );
  }
}
