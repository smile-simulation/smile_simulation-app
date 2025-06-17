// personal_data_view.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/helper_functions/custom_error.dart';
import 'package:smile_simulation/core/helper_functions/validator.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/generated/l10n.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/view/widgets/gender_section_from_sign_up_view.dart';
import 'package:smile_simulation/features/medical_record/data/repos/personal_data_repos/personal_data_repo.dart';
import 'package:smile_simulation/features/medical_record/data/repos/personal_data_repos/personal_data_repo_impl.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/constant.dart';
import '../../data/models/personal_data_models/persona_data_model.dart'; // Unified import
import '../manage/cubits/update_personal_data_cubit/update_personal_data_cubit.dart';
import '../manage/cubits/update_personal_data_cubit/update_personal_data_state.dart';
import 'widgets/marital_section_from_sign_up_view.dart';


class PersonalDataView extends StatelessWidget {
  const PersonalDataView({super.key});

  static const routeName = 'personal_data';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PatientPersonalDataCubit(PersonalDataRepoImpl(dioConsumer: DioConsumer(dio: Dio())))
            ..fetchPatientPersonalData(userId),
        ),
        BlocProvider(
          create: (context) => UpdatePersonalDataCubit(personalDataRepo: PersonalDataRepoImpl(dioConsumer: DioConsumer(dio: Dio()))),
        ),
      ],
      child: Scaffold(
        appBar: customAppbar(
          context,
          title: S.of(context).personal_info,
          isBack: true,
        ),
        body: const PersonalDataBodyView(),
      ),
    );
  }
}

class PersonalDataBodyView extends StatefulWidget {
  const PersonalDataBodyView({super.key});

  @override
  State<PersonalDataBodyView> createState() => _PersonalDataBodyViewState();
}

class _PersonalDataBodyViewState extends State<PersonalDataBodyView> {
  late TextEditingController fullNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController ageController;
  late TextEditingController jobController;

  int gender = 2;
  int marital = 2;

  late Map<String, dynamic> user;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    user = CacheHelper().getMap(key: userData) ?? {};

    fullNameController = TextEditingController(text: user['fullName'] ?? '');
    phoneNumberController = TextEditingController(text: user['phoneNumber'] ?? '');
    ageController = TextEditingController(text: user['age']?.toString() ?? '');
    jobController = TextEditingController(text: user['job'] ?? '');

    gender = user['gender'] == "Male" ? 1 : user['gender'] == "Female" ? 0 : 2;
    marital = user['maritalStatus'] == "متزوج" ? 1 : user['maritalStatus'] == "اعزب" ? 0 : 2;

    final state = context.read<PatientPersonalDataCubit>().state;
    if (state is PatientPersonalDataSuccess) {
      _updateControllersFromData(state.data); // No casting needed if types match
    }
  }

  void _updateControllersFromData(PersonaDataModel data) {
    if (data.data != null) {
      fullNameController.text = data.data!.fullName ?? '';
      phoneNumberController.text = data.data!.phoneNumber ?? '';
      ageController.text = data.data!.age?.toString() ?? '';
      jobController.text = data.data!.job ?? '';
      gender = data.data!.gender == "Male" ? 1 : data.data!.gender == "Female" ? 0 : 2;
      marital = data.data!.maritalStatus == "متزوج" ? 1 : data.data!.maritalStatus == "اعزب" ? 0 : 2;
    }
  }

  @override
  void dispose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    ageController.dispose();
    jobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBodyScreen(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocConsumer<PatientPersonalDataCubit, PatientPersonalDataState>(
          listener: (context, state) {
            if (state is PatientPersonalDataSuccess) {
              _updateControllersFromData(state.data); // No casting needed

            } else if (state is PatientPersonalDataFailure) {
              customError(context, massage: S.of(context).error_try_again);
            }
          },
          builder: (context, state) {
            if (state is PatientPersonalDataLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return BlocConsumer<UpdatePersonalDataCubit, UpdatePersonalDataState>(
              listener: (context, updateState) async {
                if (updateState is UpdatePersonalDataSuccess) {
                await  customSuccess(context, massage: S.of(context).data_updated_success);
                  Navigator.pop(context);
                } else if (updateState is UpdatePersonalDataFailure) {
                  customError(context, massage: updateState.message);
                }
              },
              builder: (context, updateState) {
                return Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: ListView(
                    children: [
                      const SizedBox(height: 24),
                      CustomTextField(
                        title: S.of(context).full_name,
                        readOnly: true,
                        controller: fullNameController,
                        hintText: user["fullName"],
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        title: S.of(context).phone,
                        controller: phoneNumberController,
                        hintText: S.of(context).phone_empty,
                        keyboardType: TextInputType.phone,
                        validator: (value) => validatorOfPhone(context, value),
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        title: S.of(context).age,
                        controller: ageController,
                        hintText: S.of(context).enter_age,
                        keyboardType: TextInputType.number,
                        validator: (value) => validatorOfAge(context, value),
                      ),
                      const SizedBox(height: 16),
                      GenderSectionFromSignUpView(
                        onSelected: (value) {
                          setState(() {
                            gender = value == 'male' ? 1 : 0;
                          });
                        },
                        initialValue: gender == 1 ? 'male' : gender == 0 ? 'female' : null,
                      ),
                      MaritalSectionFromSignUpView(
                        onSelected: (value) {
                          setState(() {
                            marital = value == 'married' ? 1 : 0;
                          });
                        },
                        initialValue: marital == 1 ? 'married' : marital == 0 ? 'single' : null,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        title: S.of(context).job_title,
                        controller: jobController,
                        hintText: S.of(context).enter_job,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 58),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            isMinWidth: true,
                            isLoading: updateState is UpdatePersonalDataLoading,
                            title: S.of(context).saveEdits,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                autovalidateMode = AutovalidateMode.disabled;
                                final cubit = context.read<UpdatePersonalDataCubit>();
                                cubit.updatePersonalData(
                                  userName: user['userName'] ?? '',
                                  fullName: fullNameController.text,
                                  email: user['email'] ?? '',
                                  age: int.tryParse(ageController.text) ?? 0,
                                  phoneNumber: phoneNumberController.text,
                                  gender: gender == 2 ? "" : gender == 1 ? "Male" : "Female",
                                  job: jobController.text,
                                  maritalStatus: marital == 2 ? "" : marital == 1 ? "متزوج" : "اعزب",
                                );
                              } else {
                                autovalidateMode = AutovalidateMode.always;
                                setState(() {});
                              }
                            },
                          ),
                          CustomButton(
                            isMinWidth: true,
                            isSecondary: true,
                            title: S.of(context).cancel,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}