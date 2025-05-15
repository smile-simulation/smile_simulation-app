import 'package:flutter/material.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';

import '../../../../core/widgets/custom_auth_appbar.dart';
import '../../../auth/sign_up/presentation/view/widgets/gender_section_from_sign_up_view.dart';

class PersonalDataView extends StatefulWidget {
  const PersonalDataView({super.key});

  static const routeName = 'perssonal_data';

  @override
  State<PersonalDataView> createState() => _PersonalDataViewState();
}

class _PersonalDataViewState extends State<PersonalDataView> {
  int gender = 1;
  int marital = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: "البيانات الشخصية", isBack: true),
      body: CustomBodyScreen(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              SizedBox(height: 32),
              CustomTextField(
                title: "الاسم الكامل",
                hintText: "محمد ابراهيم",
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextField(
                title: "الاسم الكامل",
                hintText: "محمد ابراهيم",
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextField(
                title: "الرقم التعريفي",
                hintText: "34251",
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextField(
                title: "رقم الهاتف",
                hintText: "01222222222",
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 16),
              CustomTextField(
                title: "السن",
                hintText: "20 سنة",
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              GenderSectionFromSignUpView(
                onSelected: (value) {
                  if (value == 'male') {
                    gender = 0;
                  } else if (value == 'female') {
                    gender = 1;
                  }
                },
              ),
              GenderSectionFromSignUpView(
                onSelected: (value) {
                  if (value == 'single') {
                    marital = 0;
                  } else if (value == 'married') {
                    marital = 1;
                  }
                },
              ),
              CustomTextField(
                title: "الوظيفة",
                hintText: "طالب",
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    isMinWidth: true,

                    title: "حفظ التعديلات",
                    onPressed: () {},
                  ),
                  CustomButton(
                    isMinWidth: true,
                    isSecondary: true,
                    title: "إلغاء",
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
