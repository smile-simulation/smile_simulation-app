import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';

import '../../../../constant.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_body_screen.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../generated/assets.dart';
import 'medical_record_manage_view.dart';

class SearchPatients extends StatelessWidget {
  const SearchPatients({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: "السجل الطبي"),
      body: CustomBodyScreen(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: 'ادخل الرقم التعريفي الخاص بالمريض',
                  keyboardType: TextInputType.text,
                  onSaved: (value) {
                    userId = value!;
                    logger.d(value);
                  },
                  suffixIcon: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const MedicalRecordManageView();
                          },
                        ),
                      );
                    },
                    child: SvgPicture.asset(
                      Assets.imagesSearch,
                      fit: BoxFit.scaleDown,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 140),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Image.asset(Assets.imagesSearchPachint),
                ),
                Text(
                  'قم بإدخال الرقم التعريفي الخاص بالمريض لعرض السجل الطبي الكامل الخاص به.',
                  style: AppTextStyles.style20W400(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
