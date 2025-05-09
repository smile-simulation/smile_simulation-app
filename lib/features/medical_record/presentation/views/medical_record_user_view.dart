import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/medical_record/presentation/views/personal_data_view.dart';

import '../../../../core/widgets/custom_body_screen.dart';
import '../../../../generated/assets.dart';
import 'health_status_view.dart';
import 'medical_record_view.dart';

class MedicalRecordUserView extends StatelessWidget {
  const MedicalRecordUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: 'السجل الطبي'),
      body: CustomBodyScreen(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    height: 48,
                    padding: EdgeInsetsDirectional.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.veryLightGreyColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.lightGreyColor),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 6,
                          spreadRadius: 1,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.blue.shade100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: Image.asset(
                              Assets.imagesEngMahmoudMagdy,
                              width: 40,
                              height: 40,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'محمد فوزي محمود',
                            style: AppTextStyles.subTitle1(context),
                          ),
                        ),
                        Text(
                          '#34251',
                          style: AppTextStyles.subTitle1(
                            context,
                          ).copyWith(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 85),
                Row(
                  children: [
                    Image.asset(
                      Assets.imagesMedicalRecordImage,

                      height: 180,
                      width: 180,
                      fit: BoxFit.fill,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              PersonalDataView.routeName,
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 75,
                                height: 75,

                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(Assets.imagesEllipse1),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Text(
                                'البيانات الشخصية',
                                style: AppTextStyles.formLabel(context),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 75.0,
                            bottom: 75,
                            right:85,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                HealthStatusView.routeName,
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 75,
                                  height: 75,

                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(Assets.imagesEllipse2),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                 Text(
                                  'الحالة الصحية',
                                  style: AppTextStyles.formLabel(context),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              MedicalRecordView.routeName,
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 75,
                                height: 75,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(Assets.imagesEllipse3),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Text(
                                'السجل العلاجي',
                                style: AppTextStyles.formLabel(context),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
