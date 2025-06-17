import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/helper_functions/validator.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import 'package:smile_simulation/generated/l10n.dart';
import '../../../../core/helper_functions/custom_error.dart';
import '../../../auth/sign_up/presentation/view/widgets/gender_section_from_sign_up_view.dart';
import '../../../auth/sign_up/presentation/view/widgets/input_section_from_sign_up_from_doctor_subsidiary.dart';
import '../managers/edit_profile_cubit/edit_profile_cubit.dart';
import '../managers/edit_profile_cubit/edit_profile_state.dart';
import 'widgets/user_account_image.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);
  static const routeName = 'edit_profile_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: "الملف الشخصي", isBack: true),
      body: const EditProfileBodyView(),
    );
  }
}

class EditProfileBodyView extends StatefulWidget {
  const EditProfileBodyView({super.key});

  @override
  State<EditProfileBodyView> createState() => _EditProfileBodyViewState();
}

class _EditProfileBodyViewState extends State<EditProfileBodyView> {
  late TextEditingController nameController;

  late TextEditingController ageController;

  late TextEditingController birthDayController;
  late DateTime? dateOfBirt;
  late TextEditingController addressController;

  late TextEditingController qualificationController;

  late TextEditingController specializationController;

  late TextEditingController experienceController;
  late String role;
  int gender = 2;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    final user = CacheHelper().getMap(key: userData) ?? {};

   ageController = TextEditingController(text: user['age']?.toString());
    nameController = TextEditingController(text: user['fullName']);
    addressController = TextEditingController(text: user['address']);
    birthDayController = TextEditingController(text: user['birthDay']);
    role = user["role"];
    log(user['birthDay'].toString());
    dateOfBirt = DateTime.tryParse(birthDayController.text);
    qualificationController = TextEditingController(
      text: user['qualification'],
    );
    specializationController = TextEditingController(
      text: user['specialization'],
    );
    experienceController = TextEditingController(text: user['experience']);

    gender =
        user['gender'] == "Male"
            ? 1
            : user['gender'] == "Female"
            ? 0
            : 2;
  }

  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: dateOfBirt ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        dateOfBirt = pickedDate;
        birthDayController.text = DateFormat('DD-MM-YYYY').format(pickedDate);
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    birthDayController.dispose();
    addressController.dispose();
    qualificationController.dispose();
    specializationController.dispose();
    experienceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBodyScreen(
      child: BlocListener<EditProfileCubit, EditProfileState>(
        listener: (context, state) async {
          if (state is EditProfileSuccess) {
            await customSuccess(
              context,
              massage: S.of(context).data_updated_success,
            ).whenComplete(() {
              Navigator.pop(context);
              // Navigator.pop(context);
            });
            Map<String, dynamic> map = CacheHelper().getMap(key: userData)!;
            map["fullName"] = nameController.text.trim();
            map["address"] = addressController.text;
            map["age"] = int.tryParse(ageController.text) ?? 0;
            map["gender"] =
                gender == 2
                    ? ""
                    : gender == 1
                    ? "Male"
                    : "Female";
            map["qualification"] = qualificationController.text;
            map["specialization"] = specializationController.text;
            map["experience"] = experienceController.text;

            CacheHelper().saveMap(key: userData, value: map);
            // CacheHelper().saveMap(
            //   key: userData,
            //   value: {
            //     "fullName": nameController.text.trim(),
            //     "birthDay": birthDayController.text,
            //     "address": addressController.text,
            //     "age": int.tryParse(ageController.text) ?? 0,
            //     "gender":
            //         gender == 2
            //             ? ""
            //             : gender == 1
            //             ? "Male"
            //             : "Female",
            //   },
            // );
          } else if (state is EditProfileFailure) {
            customError(context, massage: S.of(context).error_try_again);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    UserAccountImage(
                      userImage: CacheHelper().getMap(key: userData)?["image"],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  nameController.text,
                  style: AppTextStyles.subTitle1(context),
                ),
                const SizedBox(height: 8),
                Text(
                  CacheHelper().getMap(key: userData)?["email"] ?? '',
                  style: AppTextStyles.caption1(
                    context,
                  ).copyWith(color: AppColors.greyColor),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  title: S.of(context).full_name,
                  controller: nameController,
                  hintText: "S.of(context).enter_full_name",
                  keyboardType: TextInputType.text,
                  validator: (value) => validatorOfName(context, value),
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  title: S.of(context).age,
                  controller: ageController,
                  hintText: S.of(context).enter_age,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return validatorOfAge(context, value);
                  },
                ),
                const SizedBox(height: 16),
                // CustomTextField(
                //   title: "S.of(context).birth_day",
                //   controller: birthDayController,
                //   hintText: "S.of(context).enter_birth_day",
                //   keyboardType: TextInputType.datetime,
                //   validator:
                //       (value) =>
                //           value!.isEmpty
                //               ? "S.of(context).required_field "
                //               : null,
                // ),
                // CustomButton(
                //   title: "date",
                //   onPressed: () async {
                //     dateOfBirt =
                //         await showDatePicker(
                //           context: context,
                //           firstDate: DateTime(2023),
                //           lastDate: DateTime(2025, 12, 31),
                //         ) ??
                //         DateTime.now();
                //   },
                // ),
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.grey[700]),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: _pickDate,
                      child: Text(
                        dateOfBirt != null
                            ? DateFormat('yyyy-MM-dd').format(dateOfBirt!)
                            : 'Select Birth Date',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  title: S.of(context).address,
                  controller: addressController,
                  hintText: "S.of(context).enter_address",
                  keyboardType: TextInputType.text,
                  validator:
                      (value) =>
                          value!.isEmpty
                              ? "S.of(context).required_field"
                              : null,
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
                const SizedBox(height: 16),

                // Visibility(
                //   visible:
                //       CacheHelper().getMap(key: userData)?["role"] == "Doctor",
                //   child: InputSectionFromSignUpFromDoctorSubsidiary(
                //     qualificationController: qualificationController,
                //     specializationController: specializationController,
                //     experienceController: experienceController,
                //     context: context,
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomButton(
                        isMinWidth: true,
                        isLoading:
                            context.watch<EditProfileCubit>().state
                                is EditProfileLoading,
                        title: S.of(context).saveEdits,

                        onPressed: () {
                          autovalidateMode = AutovalidateMode.disabled;
                          final cubit = context.read<EditProfileCubit>();
                          cubit.editProfile(
                            fullName: nameController.text,
                            age: "",
                            qualification: qualificationController.text,
                            experience: experienceController.text,
                            address: addressController.text,
                            gender:
                                gender == 2
                                    ? ""
                                    : gender == 1
                                    ? "Male"
                                    : "Female",
                            // 0 أو 1
                            specialization: specializationController.text,
                            birthDay: dateOfBirt!,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomButton(
                        isMinWidth: true,
                        isSecondary: true,
                        title: S.of(context).cancel,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
