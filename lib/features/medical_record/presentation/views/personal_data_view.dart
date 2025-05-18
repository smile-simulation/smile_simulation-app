import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import '../../../../constant.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/helper_functions/custom_error.dart';
import '../../../../core/widgets/custom_auth_appbar.dart';
import '../../../auth/sign_up/presentation/view/widgets/gender_section_from_sign_up_view.dart';
import '../manage/cubits/update_personal_data_cubit/update_personal_data_cubit.dart';
import '../manage/cubits/update_personal_data_cubit/update_personal_data_state.dart';
import 'widgets/marital_section_from_sign_up_view.dart';

class PersonalDataView extends StatelessWidget {
  const PersonalDataView({super.key});

  static const routeName = 'perssonal_data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: "البيانات الشخصية", isBack: true),
      body: const PersonalDataBodyView(),
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
  late Map<String, dynamic> data;

  @override
  void initState() {

    super.initState();
    user = CacheHelper().getMap(key: userData)!;
     data = CacheHelper().getMap(key: personalData)!;

    fullNameController = TextEditingController(text: data['fullName'] ?? '');
    phoneNumberController = TextEditingController(
      text: data['phoneNumber'] ?? '',
    );
    ageController = TextEditingController(text: data['age']?.toString() ?? '');
    jobController = TextEditingController(text: data['job'] ?? '');

    gender =
        data['gender'] == "Male"
            ? 1
            : data['gender'] == "Female"
            ? 0
            : 2;

    marital =
        data['maritalStatus'] == "متزوج"
            ? 1
            : data['maritalStatus'] == "اعزب"
            ? 0
            : 2;


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
        child: BlocListener<UpdatePersonalDataCubit, UpdatePersonalDataState>(
          listener: (context, state) {
            if (state is UpdatePersonalDataSuccess) {
              customSuccess(context, massage: "تم تعديل البيانات بنجاح");

              CacheHelper().saveMap(
                key: personalData,
                value: {
                  "userName": user['userName'],
                  "fullName": user['fullName'],
                  "email": user['email'],
                  "age": int.tryParse(ageController.text) ?? 0,
                  "phoneNumber": phoneNumberController.text,
                  "gender":
                      gender == 2
                          ? ""
                          : gender == 1
                          ? "Male"
                          : "Female",
                  "job": jobController.text,
                  "maritalStatus":
                      marital == 2
                          ? ""
                          : marital == 1
                          ? "متزوج"
                          : "اعزب",
                },
              );
            } else if (state is UpdatePersonalDataFailure) {
              customError(context, massage: "حدث خطاء حاول مره اخره");
            }
          },
          child: ListView(
            children: [
              const SizedBox(height: 24),
              CustomTextField(
                title: "الاسم الكامل",
                controller: fullNameController,
                hintText: "ادخل الاسم الكامل",
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                title: "رقم الهاتف",
                controller: phoneNumberController,
                hintText: "ادخل رقم الهاتف",
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                title: "السن",
                controller: ageController,
                hintText: "ادخل السن",
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              GenderSectionFromSignUpView(
                onSelected: (value) {
                  setState(() {
                    gender = value == 'male' ? 1 : 0;
                  });
                },
                initialValue:
                    gender == 1
                        ? 'male'
                        : gender == 0
                        ? 'female'
                        : null,
              ),
              MaritalSectionFromSignUpView(
                onSelected: (value) {
                  setState(() {
                    marital = value == 'married' ? 1 : 0;
                  });
                },
                initialValue:
                    marital == 1
                        ? 'married'
                        : marital == 0
                        ? 'single'
                        : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                title: "الوظيفة",
                controller: jobController,
                hintText: "ادخل الوظيفة",
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 58),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    isMinWidth: true,
                    isLoading:
                        context.watch<UpdatePersonalDataCubit>().state
                            is UpdatePersonalDataLoading,
                    title: "حفظ التعديلات",
                    onPressed: () {
                      context
                          .read<UpdatePersonalDataCubit>()
                          .updatePersonalData(
                            userName: user['userName'],
                            fullName: user['fullName'],
                            email: user['email'],
                            age: int.tryParse(ageController.text) ?? 0,
                            phoneNumber: phoneNumberController.text,
                            gender:
                                gender == 2
                                    ? ""
                                    : gender == 1
                                    ? "Male"
                                    : "Female",
                            job: jobController.text,
                            maritalStatus:
                                marital == 2
                                    ? ""
                                    : marital == 1
                                    ? "متزوج"
                                    : "اعزب",
                          );
                    },
                  ),
                  CustomButton(
                    isMinWidth: true,
                    isSecondary: true,
                    title: "إلغاء",
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
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
