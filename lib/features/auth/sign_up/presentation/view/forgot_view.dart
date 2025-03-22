import 'package:flutter/material.dart';
import 'package:smile_simulation/core/utils/app_colors.dart';
import 'package:smile_simulation/core/utils/app_text_styles.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_button.dart';
import 'package:smile_simulation/core/widgets/custom_password_itext_field.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import 'package:smile_simulation/features/auth/login/presentation/view/login_view.dart';
import 'package:smile_simulation/features/auth/sign_up/presentation/view/widgets/pin_code_input.dart';

class ForgetView extends StatefulWidget {
  const ForgetView({super.key});

  static const String routeName = "/forgot";

  @override
  State<ForgetView> createState() => _ForgotViewState();
}

class _ForgotViewState extends State<ForgetView> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAuthAppbar(
        context,
        isBack: true,
        title:
            index == 0
                ? 'هل نسيت كلمة المرور؟'
                : index == 1
                ? 'رمز التحقق'
                : 'إعادة تعيين كلمة المرور',
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: AppColors.whiteColor,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("تذكر كلمة المرور؟", style: AppTextStyles.caption1(context)),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginView.routeName);
                },
                child: Text(
                  "  تسجيل الدخول",
                  style: AppTextStyles.caption1(
                    context,
                  ).copyWith(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: CustomBodyScreen(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.whiteColor,
            child: Column(
              spacing: 16,
              children: [
                SizedBox(height: 16),
                Text(
                  index == 0
                      ? "الرجاء إدخال البريد الإلكتروني المسجل به حسابك."
                      : index == 1
                      ? "من فضلك أدخل رمز التحقق المكون من 6 أرقام المرسل إليك."
                      : "الرجاء إدخال كلمة المرور الجديدة المكونة من 8 حروف وأرقام.",
                  style: AppTextStyles.headline2(
                    context,
                  ).copyWith(color: Color(0xFF4F4F4F)),
                ),
                SizedBox(
                  height: 250,
                  child: Column(
                    spacing: 16,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        index == 0
                            ? [
                              CustomTextField(
                                title: "البريد الإلكتروني",
                                hintText: "example@gmail.com",
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ]
                            : index == 1
                            ? [
                              PinInputStyles.buildPinInput(
                                onCompleted: (pin) {
                                  //  print("User entered PIN: $pin");
                                },
                              ),
                            ]
                            : [
                              CustomPasswordTextField(
                                title: "كلمة المرور",
                                hintText: "*********",
                              ),
                              CustomPasswordTextField(
                                title: "تأكيد كلمة المرور",
                                hintText: "*********",
                              ),
                            ],
                  ),
                ),

                CustomButton(
                  title:
                      index != 0 || index != 1
                          ? "إعادة تعيين كلمة المرور"
                          : "تأكيد",
                  onPressed: () {
                    setState(() {
                      index++;
                    });
                  },
                ),
                Expanded(child: SizedBox(height: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
