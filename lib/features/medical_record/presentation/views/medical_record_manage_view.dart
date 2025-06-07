import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/features/medical_record/presentation/views/personal_data_view.dart';
import '../../../../constant.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/helper_functions/custom_error.dart';
import '../../../../core/widgets/custom_body_screen.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import 'health_status_view.dart';

class MedicalRecordManageView extends StatelessWidget {
  const MedicalRecordManageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        title: S.of(context).medicalRecord,
        isBack: CacheHelper().getMap(key: userData)!['role'] == "Doctor",
      ),
      body: MedicalRecordManageBodyView(),
    );
  }
}

class MedicalRecordManageBodyView extends StatelessWidget {
  const MedicalRecordManageBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBodyScreen(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Visibility(
                    visible:
                        CacheHelper().getMap(key: userData)!['role'] !=
                        "Doctor",
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
                              child:
                                  CacheHelper().getMap(
                                            key: userData,
                                          )!["image"] ==
                                          null
                                      ? Image.asset(
                                        Assets.imagesUser,
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.cover,
                                      )
                                      : Image.network(
                                        CacheHelper().getMap(
                                          key: userData,
                                        )!["image"],
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.cover,
                                      ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              CacheHelper().getMap(key: userData)!["fullName"],
                              style: AppTextStyles.subTitle1(context),
                            ),
                          ),
                          Text(
                            CacheHelper().getMap(key: userData)!['userName'],
                            style: AppTextStyles.subTitle1(
                              context,
                            ).copyWith(color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 85),
                Row(
                  children: [
                    Transform.scale(
                      scaleX:
                          CacheHelper.sharedPreferences.getString('language') ==
                                  'ar'
                              ? 1
                              : -1,
                      scaleY: 1,
                      child: Image.asset(
                        Assets.imagesMedicalRecordImage,

                        height: 180,
                        width: 180,
                        fit: BoxFit.fill,
                      ),
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
                                S.of(context).personalData,
                                style: AppTextStyles.formLabel(context),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 75.0,
                            bottom: 75,
                            right:
                                CacheHelper.sharedPreferences.getString(
                                          'language',
                                        ) ==
                                        "ar"
                                    ? 85
                                    : 0,
                            left:
                                CacheHelper.sharedPreferences.getString(
                                          'language',
                                        ) ==
                                        "ar"
                                    ? 0
                                    : 85,
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
                                  S.of(context).healthStatus,
                                  style: AppTextStyles.formLabel(context),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            comingSoon(context);
                            // Navigator.pushNamed(
                            //   context,
                            //   MedicalRecordView.routeName,
                            // );
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
                                S.of(context).treatmentHistory,
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
