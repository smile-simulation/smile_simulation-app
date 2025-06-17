import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/helper_functions/custom_error.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/l10n.dart';
import '../../data/repos/health_status_repos/health_status_repo_impl.dart';
import '../manage/cubits/update_health_status_cubit/update_health_status_cubit.dart';
import '../manage/cubits/update_health_status_cubit/update_health_status_state.dart';
// ... import statements ...

class HealthStatusView extends StatefulWidget {
  const HealthStatusView({super.key});
  static const routeName = 'medical_history';

  @override
  State<HealthStatusView> createState() => _HealthStatusViewState();
}

class _HealthStatusViewState extends State<HealthStatusView> {
  // --- State variables ---
  Map<String, bool>? diseases;
  late TextEditingController otherChronicDiseasesDescriptionController;
  late TextEditingController drugAllergyController;
  bool? hasAllergy;
  bool? hadSurgery;
  bool? isSmoker;
  String? pregnancyStatus;
  bool? hasFamilyHistory;
  bool dataLoaded = false; // لمعرفة هل تم تحميل الداتا
  bool isEditable = false;

  @override
  void initState() {
    super.initState();
    isEditable = CacheHelper().getMap(key: userData)!['role'] == "Doctor";
    otherChronicDiseasesDescriptionController = TextEditingController();
    drugAllergyController = TextEditingController();
  }

  void initializeFromApi(data) {
    diseases = {
      'الضغط': data.hasHypertension ?? false,
      'السكر': data.hasDiabetes ?? false,
      'فيروس A,B,C': data.hasLiverDisease ?? false,
      'القلب': data.hasHeartDisease ?? false,
      'فقر الدم': data.hasAnemia ?? false,
      'غدة درقية': data.hasThyroidDisease ?? false,
      'فشل كلوي': data.hasKidneyDisease ?? false,
      'أخرى': data.otherChronicDiseasesDescription != null && data.otherChronicDiseasesDescription!.isNotEmpty,
    };
    otherChronicDiseasesDescriptionController.text = data.otherChronicDiseasesDescription ?? '';
    drugAllergyController.text = data.drugAllergy ?? '';
    hasAllergy = data.drugAllergy != null && data.drugAllergy!.isNotEmpty;
    hadSurgery = data.hasSurgicalCurrency ?? false;
    isSmoker = data.isSmoker ?? false;
    pregnancyStatus = data.pregnancyAndBreastfeeding ?? 'لا ينطبق';
    hasFamilyHistory = data.familyMedicalHistory ?? false;
    dataLoaded = true;
  }

  @override
  Widget build(BuildContext context) {
    final userName = userId;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UpdateHealthStatusCubit(
            healthStatusRepo: HealthStatusRepoImpl(
              dioConsumer: DioConsumer(dio: Dio()),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => FetchHealthStatusCubit(
            healthStatusRepo: HealthStatusRepoImpl(
              dioConsumer: DioConsumer(dio: Dio()),
            ),
          )..fetchHealthStatus(userName: userName),
        ),
      ],
      child: Scaffold(
        appBar: customAppbar(
          context,
          title: S.of(context).healthStatus,
          isBack: true,
        ),
        body: BlocConsumer<UpdateHealthStatusCubit, UpdateHealthStatusState>(
          listener: (context, state) {
            if (state is UpdateHealthStatusSuccess) {
              customSuccess(context, massage: S.of(context).data_updated_success);
            } else if (state is UpdateHealthStatusFailure) {
              customError(context, massage: S.of(context).error_try_again);
            }
          },
          builder: (context, updateState) {
            return BlocBuilder<FetchHealthStatusCubit, FetchHealthStatusState>(
              builder: (context, state) {
                if (state is FetchHealthStatusLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FetchHealthStatusFailure) {
                  return Center(child: Text(state.message));
                } else if (state is FetchHealthStatusSuccess) {
                  final data = state.dataModel.data;
                  if (data == null) {
                    return Center(child: Text(S.of(context).error_try_again));
                  }

                  // --- أول مرة بس، هيئ القيم من الAPI ---
                  if (!dataLoaded) {
                    initializeFromApi(data);
                  }

                  // --- UI ---
                  return CustomBodyScreen(
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
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              crossAxisCount: 2,
                              childAspectRatio: 2 / 0.3,
                              children: diseases!.keys.map((key) {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Checkbox(
                                      value: diseases![key],
                                      activeColor: AppColors.primaryColor,
                                      onChanged: isEditable
                                          ? (val) {
                                        setState(() {
                                          diseases![key] = val!;
                                          if (key == 'أخرى' && !val) {
                                            otherChronicDiseasesDescriptionController.clear();
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
                            visible: diseases!["أخرى"] == true,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 24.0),
                              child: TextFormField(
                                controller: otherChronicDiseasesDescriptionController,
                                decoration: InputDecoration(
                                  hintText: S.of(context).write_here,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                                ),
                                readOnly: !isEditable,
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
                                onChanged: isEditable
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
                                onChanged: isEditable
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
                            visible: hasAllergy == true,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 24.0),
                              child: TextFormField(
                                controller: drugAllergyController,
                                decoration: InputDecoration(
                                  hintText: S.of(context).write_here,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                                ),
                                readOnly: !isEditable,
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
                                onChanged: isEditable
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
                                onChanged: isEditable
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
                                onChanged: isEditable
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
                                onChanged: isEditable
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
                                onChanged: isEditable
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
                                onChanged: isEditable
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
                                onChanged: isEditable
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
                                onChanged: isEditable
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
                                onChanged: isEditable
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
                                  isLoading: updateState is UpdateHealthStatusLoading,
                                  isMinWidth: true,
                                  title: S.of(context).saveEdits,
                                  onPressed: () {
                                    if (otherChronicDiseasesDescriptionController.text.isEmpty &&
                                        diseases!['أخرى'] == true) {
                                      customError(context, massage: S.of(context).other_diseases_description_error);
                                      return;
                                    }
                                    if (drugAllergyController.text.isEmpty && hasAllergy == true) {
                                      customError(context, massage: S.of(context).drug_allergy_error);
                                      return;
                                    }
                                    context.read<UpdateHealthStatusCubit>().updateHealthStatus(
                                      userName: userName,
                                      isSmoker: isSmoker ?? false,
                                      hasHypertension: diseases!['الضغط'] ?? false,
                                      hasDiabetes: diseases!['السكر'] ?? false,
                                      hasHeartDisease: diseases!['القلب'] ?? false,
                                      hasLiverDisease: diseases!['فيروس A,B,C'] ?? false,
                                      hasKidneyDisease: diseases!['فشل كلوي'] ?? false,
                                      hasAnemia: diseases!['فقر الدم'] ?? false,
                                      hasThyroidDisease: diseases!['غدة درقية'] ?? false,
                                      hasHepatitis: diseases!['فيروس A,B,C'] ?? false,
                                      otherChronicDiseasesDescription: otherChronicDiseasesDescriptionController.text.trim(),
                                      drug_Allergy: hasAllergy == true ? drugAllergyController.text : "",
                                      has_Surgical_Currency: hadSurgery ?? false,
                                      familyMedicalHistory: hasFamilyHistory ?? false,
                                      pregnancyAndBreastfeeding: pregnancyStatus ?? 'لا ينطبق',
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
                  );
                } else {
                  return const SizedBox();
                }
              },
            );
          },
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