import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/features/more/data/models/change_password_model/change_password_model.dart';
import 'package:smile_simulation/features/more/presentation/manage/cubits/change_password_cubit/change_password_cubit.dart';
import '../../../../../core/helper_functions/custom_error.dart';
import '../../../../../core/widgets/custom_password_itext_field.dart';
import '../../../../../generated/l10n.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  static const String routeName = "/changePasswordView";

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  int index = 0;
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  ChangePasswordModel changePasswordModel = ChangePasswordModel();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) async {
        if (state is ChangePasswordFailure) {
          await customError(context, massage: state.message);
        }

        if (state is ChangePasswordSuccess) {
          await customSuccess(context, massage: state.message);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: customAppbar(
            context,
            isBack: true,
            title: S.of(context).changePassword,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              isLoading:
                  context.watch<ChangePasswordCubit>().state
                      is ChangePasswordLoading,
              title: S.of(context).save,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  autovalidateMode = AutovalidateMode.disabled;
                  setState(() {
                    context.read<ChangePasswordCubit>().changePassword(
                      currentPassword: currentPasswordController.text,
                      newPassword: newPasswordController.text,
                      confirmNewPassword: confirmPasswordController.text,
                    );
                  });
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: CustomBodyScreen(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      spacing: 16,
                      children: [
                        SizedBox(height: 16),
                        Text(
                         S.of(context).changePasswordPrompt,
                          style: AppTextStyles.bodyText1(
                            context,
                          ).copyWith(color: Color(0xFF4F4F4F)),
                        ),
                        Column(
                          spacing: 16,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomPasswordTextField(
                              controller: currentPasswordController,
                              title: S.of(context).currentPassword,
                              hintText: "*********",
                            ),
                            CustomPasswordTextField(
                              controller: newPasswordController,
                              title: S.of(context).newPassword,
                              hintText: "*********",
                            ),
                            CustomPasswordTextField(
                              controller: confirmPasswordController,
                              title: S.of(context).confirmNewPassword,
                              hintText: "*********",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
