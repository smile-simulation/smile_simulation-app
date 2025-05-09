import 'package:flutter/material.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';

import '../../../../core/widgets/custom_button.dart';

class HealthStatusView extends StatefulWidget {
  const HealthStatusView({super.key});

  static const routeName = 'health_status';

  @override
  State<HealthStatusView> createState() => _HealthStatusViewState();
}

class _HealthStatusViewState extends State<HealthStatusView> {
  // الأمراض المزمنة
  Map<String, bool> diseases = {
    'الضغط': false,
    'السكر': false,
    'فيروس A,B,C': false,
    'القلب': true,
    'الربو': true,
    'غدة درقية': false,
    'فشل كلوي': false,
    'أخرى': false,
  };

  // الحقول الأخرى
  bool hasAllergy = true;
  bool hadSurgery = false;
  bool isSmoker = false;

  String pregnancyStatus = 'لا ينطبق';
  bool hasFamilyHistory = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: "الحالة الصحية", isBack: true),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomBodyScreen(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Text(
                  "هل تعاني من أي أمراض مزمنة؟",
                  style: AppTextStyles.subTitle1(context),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 110,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 0.5,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 8,

                    children:
                        diseases.keys.map((key) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                value: diseases[key],
                                activeColor: AppColors.primaryColor,
                                onChanged: (val) {
                                  setState(() {
                                    diseases[key] = val!;
                                  });
                                },
                              ),
                              Text(key, style: AppTextStyles.caption1(context)),
                            ],
                          );
                        }).toList(),
                  ),
                ),
                Visibility(
                  visible: diseases["أخرى"] == true,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'اكتبها...',
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "هل لديك حساسية تجاه أي أدوية أو مواد طبية؟",
                  style: AppTextStyles.subTitle1(context),
                ),

                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: hasAllergy,
                      activeColor: AppColors.primaryColor,
                      onChanged: (val) {
                        setState(() {
                          hasAllergy = true;
                        });
                      },
                    ),
                    const Text("نعم"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: hasAllergy,
                      activeColor: AppColors.primaryColor,
                      onChanged: (val) {
                        setState(() {
                          hasAllergy = false;
                        });
                      },
                    ),
                    const Text("لا"),
                  ],
                ),
                Visibility(
                  visible: hasAllergy,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'اكتبها...',
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "هل خضعت لأي عمليات جراحية سابقاً؟",
                  style: AppTextStyles.subTitle1(context),
                ),
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: hadSurgery,
                      activeColor: AppColors.primaryColor,
                      onChanged: (val) {
                        setState(() {
                          hadSurgery = true;
                        });
                      },
                    ),
                    const Text("نعم"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: hadSurgery,
                      activeColor: AppColors.primaryColor,
                      onChanged: (val) {
                        setState(() {
                          hadSurgery = false;
                        });
                      },
                    ),
                    const Text("لا"),
                  ],
                ),

                const SizedBox(height: 16),
                Text("هل أنت مدخن؟", style: AppTextStyles.subTitle1(context)),
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: isSmoker,
                      activeColor: AppColors.primaryColor,
                      onChanged: (val) {
                        setState(() {
                          isSmoker = true;
                        });
                      },
                    ),
                    const Text("نعم"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: isSmoker,
                      activeColor: AppColors.primaryColor,
                      onChanged: (val) {
                        setState(() {
                          isSmoker = false;
                        });
                      },
                    ),
                    const Text("لا"),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  "هل هناك حالات حمل أو رضاعة؟",
                  style: AppTextStyles.subTitle1(context),
                ),
                Row(
                  children: [
                    Radio(
                      value: 'حامل',
                      groupValue: pregnancyStatus,
                      activeColor: AppColors.primaryColor,
                      onChanged: (val) {
                        setState(() {
                          pregnancyStatus = val.toString();
                        });
                      },
                    ),
                    const Text("حامل"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'مرضعه',
                      groupValue: pregnancyStatus,
                      activeColor: AppColors.primaryColor,
                      onChanged: (val) {
                        setState(() {
                          pregnancyStatus = val.toString();
                        });
                      },
                    ),
                    const Text("مرضعه"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'لا ينطبق',
                      groupValue: pregnancyStatus,
                      activeColor: AppColors.primaryColor,
                      onChanged: (val) {
                        setState(() {
                          pregnancyStatus = val.toString();
                        });
                      },
                    ),
                    const Text("لا ينطبق"),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  "هل يوجد تاريخ أسري للمرض؟",
                  style: AppTextStyles.subTitle1(context),
                ),
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: hasFamilyHistory,
                      activeColor: AppColors.primaryColor,
                      onChanged: (val) {
                        setState(() {
                          hasFamilyHistory = true;
                        });
                      },
                    ),
                    const Text("نعم"),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: hasFamilyHistory,
                      activeColor: AppColors.primaryColor,
                      onChanged: (val) {
                        setState(() {
                          hasFamilyHistory = false;
                        });
                      },
                    ),
                    const Text("لا"),
                  ],
                ),
                const SizedBox(height: 12),

                Visibility(
                  visible: userType == "doctor",
                  child: Row(
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
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
