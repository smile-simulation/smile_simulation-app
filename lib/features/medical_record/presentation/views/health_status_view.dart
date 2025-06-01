import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/helper_functions/custom_error.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/l10n.dart';
import '../manage/cubits/update_health_status_cubit/update_health_status_cubit.dart';
import '../manage/cubits/update_health_status_cubit/update_health_status_state.dart';

class HealthStatusView extends StatefulWidget {
  const HealthStatusView({super.key});

  static const routeName = 'medical_history';

  @override
  State<HealthStatusView> createState() => _MedicalHistoryViewState();
}

class _MedicalHistoryViewState extends State<HealthStatusView> {
  late bool isEditable;
  late Map<String, dynamic> user;
  late Map<String, bool> diseases;
  late bool hasAllergy;
  late bool hadSurgery;
  late bool isSmoker;
  late String pregnancyStatus;
  late bool hasFamilyHistory;
  late TextEditingController otherChronicDiseasesDescriptionController;
  late TextEditingController drugAllergyController;

  @override
  void initState() {
    super.initState();
    isEditable = userType == "Patient";
    user = CacheHelper().getMap(key: userData)!;
    diseases = {
      'الضغط': user['hasHypertension'] ?? false,
      'السكر': user['hasDiabetes'] ?? false,
      'فيروس A,B,C': user['hasLiverDisease'] ?? false,
      'القلب': user['hasHeartDisease'] ?? false,
      'فقر الدم': user['hasAnemia'] ?? false,
      'غدة درقية': user['hasThyroidDisease'] ?? false,
      'فشل كلوي': user['hasKidneyDisease'] ?? false,
      'أخرى':
          user['otherChronicDiseasesDescription'] != null &&
          user['otherChronicDiseasesDescription'].isNotEmpty,
    };
    otherChronicDiseasesDescriptionController = TextEditingController(
      text: user['otherChronicDiseasesDescription'] ?? '',
    );
    drugAllergyController = TextEditingController(
      text: user['drug_Allergy'] ?? '',
    );
    hasAllergy =
        user['drug_Allergy'] != null && user['drug_Allergy'].isNotEmpty;
    hadSurgery = user['has_Surgical_Currency'] ?? false;
    isSmoker = user['isSmoker'] ?? false;
    pregnancyStatus = user['pregnancyAndBreastfeeding'] ?? 'لا ينطبق';
    hasFamilyHistory = user['familyMedicalHistory'] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context,
        title: S.of(context).healthStatus,
        isBack: true,
      ),
      body: BlocListener<UpdateHealthStatusCubit, UpdateHealthStatusState>(
        listener: (context, state) {
          if (state is UpdateHealthStatusSuccess) {
            customSuccess(context, massage: S.of(context).data_updated_success);
            CacheHelper().saveMap(
              key: userData,
              value: {
                "userName": user['userName'],
                "isSmoker": isSmoker,
                "hasHypertension": diseases['الضغط'] ?? false,
                "hasDiabetes": diseases['السكر'] ?? false,
                "hasHeartDisease": diseases['القلب'] ?? false,
                "hasLiverDisease": diseases['فيروس A,B,C'] ?? false,
                "hasKidneyDisease": diseases['فشل كلوي'] ?? false,
                "hasAnemia": diseases['فقر الدم'] ?? false,
                "hasThyroidDisease": diseases['غدة درقية'] ?? false,
                "has_Surgical_Currency": hadSurgery,
                "familyMedicalHistory": hasFamilyHistory,
                "otherChronicDiseasesDescription":
                    otherChronicDiseasesDescriptionController.text,
                "drug_Allergy":
                    drugAllergyController.text.isNotEmpty
                        ? drugAllergyController.text
                        : null,
                "pregnancyAndBreastfeeding": pregnancyStatus,
              },
            );
          } else if (state is UpdateHealthStatusFailure) {
            customError(context, massage: S.of(context).error_try_again);
          }
        },
        child: CustomBodyScreen(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Text(
                  S.of(context).chronic_diseases_question,
                  style: AppTextStyles.subTitle1(context),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 130,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 0.3,
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
                                onChanged:
                                    isEditable
                                        ? (val) {
                                          setState(() {
                                            diseases[key] = val!;
                                            if (key == 'أخرى' && !val) {
                                              otherChronicDiseasesDescriptionController
                                                  .clear();
                                            }
                                          });
                                        }
                                        : null,
                              ),
                              Text(
                                key == 'الضغط'
                                    ? S.of(context).hypertension
                                    : key == 'السكر'
                                    ? S.of(context).diabetes
                                    : key == 'فيروس A,B,C'
                                    ? S.of(context).hepatitis
                                    : key == 'القلب'
                                    ? S.of(context).heart_disease
                                    : key == 'فقر الدم'
                                    ? S.of(context).anemia
                                    : key == 'غدة درقية'
                                    ? S.of(context).thyroid_disease
                                    : key == 'فشل كلوي'
                                    ? S.of(context).kidney_disease
                                    : key == 'أخرى'
                                    ? S.of(context).other_diseases
                                    : key,
                                style: AppTextStyles.listItem(context),
                              ),
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
                      controller: otherChronicDiseasesDescriptionController,
                      decoration: InputDecoration(
                        hintText: S.of(context).write_here,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      readOnly: !isEditable, // تعطيل التعديل
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  S.of(context).drug_allergy_question,
                  style: AppTextStyles.subTitle1(context),
                ),
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: hasAllergy,
                      activeColor: AppColors.primaryColor,
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  hasAllergy = true;
                                });
                              }
                              : null,
                    ),
                    Text(
                      S.of(context).yes,
                      style: AppTextStyles.bodyText1(context),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: hasAllergy,
                      activeColor: AppColors.primaryColor,
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  hasAllergy = false;
                                });
                              }
                              : null,
                    ),
                    Text(
                      S.of(context).no,
                      style: AppTextStyles.bodyText1(context),
                    ),
                  ],
                ),
                Visibility(
                  visible: hasAllergy,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: TextFormField(
                      controller: drugAllergyController,
                      decoration: InputDecoration(
                        hintText: S.of(context).write_here,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      readOnly: !isEditable, // تعطيل التعديل
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  S.of(context).surgery_question,
                  style: AppTextStyles.subTitle1(context),
                ),
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: hadSurgery,
                      activeColor: AppColors.primaryColor,
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  hadSurgery = true;
                                });
                              }
                              : null,
                    ),
                    Text(
                      S.of(context).yes,
                      style: AppTextStyles.bodyText1(context),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: hadSurgery,
                      activeColor: AppColors.primaryColor,
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  hadSurgery = false;
                                });
                              }
                              : null,
                    ),
                    Text(
                      S.of(context).no,
                      style: AppTextStyles.bodyText1(context),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  S.of(context).smoking_question,
                  style: AppTextStyles.subTitle1(context),
                ),
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: isSmoker,
                      activeColor: AppColors.primaryColor,
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  isSmoker = true;
                                });
                              }
                              : null,
                    ),
                    Text(
                      S.of(context).yes,
                      style: AppTextStyles.bodyText1(context),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: isSmoker,
                      activeColor: AppColors.primaryColor,
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  isSmoker = false;
                                });
                              }
                              : null,
                    ),
                    Text(
                      S.of(context).no,
                      style: AppTextStyles.bodyText1(context),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  S.of(context).pregnancy_question,
                  style: AppTextStyles.subTitle1(context),
                ),
                Row(
                  children: [
                    Radio(
                      value: 'حامل',
                      groupValue: pregnancyStatus,
                      activeColor: AppColors.primaryColor,
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  pregnancyStatus = val.toString();
                                });
                              }
                              : null,
                    ),
                    Text(
                      S.of(context).pregnant,
                      style: AppTextStyles.bodyText1(context),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'مرضع',
                      groupValue: pregnancyStatus,
                      activeColor: AppColors.primaryColor,
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  pregnancyStatus = val.toString();
                                });
                              }
                              : null,
                    ),
                    Text(
                      S.of(context).breastfeeding,
                      style: AppTextStyles.bodyText1(context),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'لاينطبق',
                      groupValue: pregnancyStatus,
                      activeColor: AppColors.primaryColor,
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  pregnancyStatus = val.toString();
                                });
                              }
                              : null,
                    ),
                    Text(
                      S.of(context).not_applicable,
                      style: AppTextStyles.bodyText1(context),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  S.of(context).family_history_question,

                  style: AppTextStyles.subTitle1(context),
                ),
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: hasFamilyHistory,
                      activeColor: AppColors.primaryColor,
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  hasFamilyHistory = true;
                                });
                              }
                              : null,
                    ),
                    Text(
                      S.of(context).yes,
                      style: AppTextStyles.bodyText1(context),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: hasFamilyHistory,
                      activeColor: AppColors.primaryColor,
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  hasFamilyHistory = false;
                                });
                              }
                              : null,
                    ),
                    Text(
                      S.of(context).no,
                      style: AppTextStyles.bodyText1(context),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                if (isEditable)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        isLoading:
                            context.watch<UpdateHealthStatusCubit>().state
                                is UpdateHealthStatusLoading,
                        isMinWidth: true,
                        title: S.of(context).saveEdits,
                        onPressed: () {
                          if (otherChronicDiseasesDescriptionController
                                  .text
                                  .isEmpty &&
                              diseases['أخرى'] == true) {
                            customError(
                              context,
                              massage:
                                  S
                                      .of(context)
                                      .other_diseases_description_error,
                            );
                            return;
                          }
                          if (drugAllergyController.text.isEmpty &&
                              hasAllergy) {
                            customError(
                              context,
                              massage: S.of(context).drug_allergy_error,
                            );
                            return;
                          }
                          context
                              .read<UpdateHealthStatusCubit>()
                              .updateHealthStatus(
                                userName: user['userName'],

                                isSmoker: isSmoker,
                                hasHypertension: diseases['الضغط'] ?? false,
                                hasDiabetes: diseases['السكر'] ?? false,
                                hasHeartDisease: diseases['القلب'] ?? false,
                                hasLiverDisease:
                                    diseases['فيروس A,B,C'] ?? false,
                                hasKidneyDisease: diseases['فشل كلوي'] ?? false,
                                hasAnemia: diseases['فقر الدم'] ?? false,
                                hasThyroidDisease:
                                    diseases['غدة درقية'] ?? false,
                                hasHepatitis: diseases['فيروس A,B,C'] ?? false,

                                otherChronicDiseasesDescription:
                                    otherChronicDiseasesDescriptionController
                                        .text
                                        .trim(),
                                drug_Allergy:
                                    hasAllergy
                                        ? drugAllergyController.text
                                        : "",
                                has_Surgical_Currency: hadSurgery,
                                familyMedicalHistory: hasFamilyHistory,
                                pregnancyAndBreastfeeding: pregnancyStatus,
                              );
                        },
                      ),
                      CustomButton(
                        isMinWidth: true,
                        isSecondary: true,
                        title: S.of(context).cancel,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    otherChronicDiseasesDescriptionController.dispose();
    drugAllergyController.dispose();
    super.dispose();
  }
}
