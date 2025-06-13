import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/user_account/presentation/views/widgets/set_user_image_button.dart';
import 'package:smile_simulation/features/user_account/presentation/views/widgets/user_account_image.dart';

import '../../../../constant.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../generated/l10n.dart';
import '../managers/edit_profile_cubit/edit_profile_cubit.dart';
import '../managers/edit_profile_cubit/edit_profile_state.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);
    static const  routeName = 'edit_profile_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        context, title: "الملف الشخصي", isBack: true,
      ),
      body: EditProfileBodyView(),
    );
  }
}

class EditProfileBodyView extends StatefulWidget {
  const EditProfileBodyView({
    super.key,
  });

  @override
  State<EditProfileBodyView> createState() => _EditProfileBodyViewState();
}

class _EditProfileBodyViewState extends State<EditProfileBodyView> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

    return CustomBodyScreen(child:
    BlocListener<EditProfileCubit,  EditProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      UserAccountImage(userImage: CacheHelper().getMap(
                          key: userData)?["image"]),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: AppColors.whiteColor,
                          ),
                          onPressed: () {},
                          icon: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    CacheHelper().getMap(key: userData)?["fullName"] ?? '',
                    style: AppTextStyles.subTitle1(context),
                  ),

                  Text(
                    CacheHelper().getMap(key: userData)?["email"] ?? '',
                    style: AppTextStyles.caption1(context).copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
                  //
                  // CustomTextField(
                  //   title: S.of(context).full_name,
                  //   readOnly: true,
                  //   controller: fullNameController,
                  //   hintText: user["fullName"],
                  //   keyboardType: TextInputType.text,
                  // ),
                  // const SizedBox(height: 16),
                  // CustomTextField(
                  //   title: S.of(context).phone,
                  //   controller: phoneNumberController,
                  //   hintText: S.of(context).phone_empty,
                  //   keyboardType: TextInputType.phone,
                  //   validator: (value) {
                  //     return validatorOfPhone(context, value);
                  //   },
                  // ),
                  // const SizedBox(height: 16),
                  // CustomTextField(
                  //   title: S.of(context).age,
                  //   controller: ageController,
                  //   hintText: S.of(context).enter_age,
                  //   keyboardType: TextInputType.number,
                  //   validator: (value) {
                  //     return validatorOfAge(context, value);
                  //   },
                  // ),
                  // const SizedBox(height: 16),
                  // GenderSectionFromSignUpView(
                  //   onSelected: (value) {
                  //     setState(() {
                  //       gender = value == 'male' ? 1 : 0;
                  //     });
                  //   },
                  //   initialValue:
                  //   gender == 1
                  //       ? 'male'
                  //       : gender == 0
                  //       ? 'female'
                  //       : null,
                  // ),
                  const SizedBox(height: 58),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        isMinWidth: true,
                        isLoading:
                        context.watch<EditProfileCubit>().state
                        is EditProfileLoading  ,
                        title: S.of(context).saveEdits,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            autovalidateMode = AutovalidateMode.disabled;

                            setState(() {
                              context
                                  .read<EditProfileCubit>()
                                  .editProfile(


                              );
                            });
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
                ]
            ),
          ),
        ),

      )
      ),
    )
    );
  }
}
