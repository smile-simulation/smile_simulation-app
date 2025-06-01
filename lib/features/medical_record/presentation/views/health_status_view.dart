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
      'أخرى': user['otherChronicDiseasesDescription'] != null,
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
      appBar: customAppbar(context, title: "الحالة الصحية", isBack: true),
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
                                onChanged:
                                    isEditable
                                        ? (val) {
                                          setState(() {
                                            diseases[key] = val!;
                                            if (key == 'أخرى') {
                                              diseases[key] =
                                                  true; // تأكد من تفعيل الخيار "أخرى"
                                            }
                                            if (key != 'أخرى' && val == false) {
                                              otherChronicDiseasesDescriptionController
                                                  .clear();
                                            }
                                          });
                                        }
                                        : null, // تعطيل التفاعل
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
                      controller: otherChronicDiseasesDescriptionController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'اكتبها...',
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      readOnly: !isEditable, // تعطيل التعديل
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
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  hasAllergy = true;
                                });
                              }
                              : null, // تعطيل التفاعل
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
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  hasAllergy = false;
                                });
                              }
                              : null, // تعطيل التفاعل
                    ),
                    const Text("لا"),
                  ],
                ),
                Visibility(
                  visible: hasAllergy,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: TextFormField(
                      controller: drugAllergyController,
                      decoration: const InputDecoration(
                        hintText: 'اكتبها...',
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      readOnly: !isEditable, // تعطيل التعديل
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
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  hadSurgery = true;
                                });
                              }
                              : null, // تعطيل التفاعل
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
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  hadSurgery = false;
                                });
                              }
                              : null, // تعطيل التفاعل
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
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  isSmoker = true;
                                });
                              }
                              : null, // تعطيل التفاعل
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
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  isSmoker = false;
                                });
                              }
                              : null, // تعطيل التفاعل
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
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  pregnancyStatus = val.toString();
                                });
                              }
                              : null, // تعطيل التفاعل
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
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  pregnancyStatus = val.toString();
                                });
                              }
                              : null, // تعطيل التفاعل
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
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  pregnancyStatus = val.toString();
                                });
                              }
                              : null, // تعطيل التفاعل
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
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  hasFamilyHistory = true;
                                });
                              }
                              : null, // تعطيل التفاعل
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
                      onChanged:
                          isEditable
                              ? (val) {
                                setState(() {
                                  hasFamilyHistory = false;
                                });
                              }
                              : null, // تعطيل التفاعل
                    ),
                    const Text("لا"),
                  ],
                ),
                const SizedBox(height: 12),
                if (isEditable)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        isMinWidth: true,
                        title: "حفظ التعديلات",
                        onPressed: () {
                          context
                              .read<UpdateHealthStatusCubit>()
                              .updateHealthStatus(
                                hasHypertension: diseases['الضغط'] ?? false,
                                hasDiabetes: diseases['السكر'] ?? false,
                                hasHeartDisease: diseases['القلب'] ?? false,
                                hasLiverDisease:
                                    diseases['فيروس A,B,C'] ?? false,
                                hasKidneyDisease: diseases['فشل كلوي'] ?? false,
                                hasAnemia: diseases['فقر الدم'] ?? false,
                                hasThyroidDisease:
                                    diseases['غدة درقية'] ?? false,
                                familyMedicalHistory: hasFamilyHistory,
                                otherChronicDiseasesDescription:
                                    otherChronicDiseasesDescriptionController
                                        .text,
                                drug_Allergy:
                                    hasAllergy
                                        ? drugAllergyController.text
                                        : "",
                                isSmoker: isSmoker,
                                pregnancyAndBreastfeeding: pregnancyStatus,
                                userName: user['userName'],
                                has_Surgical_Currency: hadSurgery,
                                hasHepatitis: diseases['فيروس A,B,C'] ?? false,
                              );
                        },
                      ),
                      CustomButton(
                        isMinWidth: true,
                        isSecondary: true,
                        title: "إلغاء",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                const SizedBox(height: 32),
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
