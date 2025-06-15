import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/core/widgets/custom_text_field.dart';
import 'package:smile_simulation/generated/assets.dart';
import '../../../../constant.dart';
import '../../../../core/helper_functions/custom_error.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../data/repos/search_patients_repos/search_patients_repo_impl.dart';
import '../manage/cubits/search_patients_cubits/search_patients_cubit.dart';
import '../manage/cubits/search_patients_cubits/search_patients_state.dart';
import 'medical_record_manage_view.dart';

class SearchPatients extends StatefulWidget {
  const SearchPatients({super.key});

  @override
  State<SearchPatients> createState() => _SearchPatientsState();
}

class _SearchPatientsState extends State<SearchPatients> {
  final formKey = GlobalKey<FormState>();
  late AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PatientCubit(PatientRepositoryImpl()),
      child: Scaffold(
        appBar: customAppbar(context, title: S.of(context).medicalRecord),
        body: CustomBodyScreen(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    BlocBuilder<PatientCubit, PatientState>(
                      builder: (context, state) {
                        if (state is PatientFailure) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            customError(context, massage: state.message);
                          });
                        } else if (state is PatientSuccess) {
                          WidgetsBinding.instance.addPostFrameCallback((
                            _,
                          ) async {
                            await customSuccess(
                              context,
                              massage: state.patient.message,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        const MedicalRecordManageView(),
                              ),
                            );
                          });
                        }
                        return CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return S.of(context).patientIdPlaceholder;
                            }
                          },
                          hintText: S.of(context).patientIdPlaceholder,
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            userId = value!;
                            logger.d(value);
                          },
                          suffixIcon: GestureDetector(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                autovalidateMode = AutovalidateMode.disabled;

                                final cubit = context.read<PatientCubit>();
                                cubit.checkPatient(userId);
                              } else {
                                autovalidateMode = AutovalidateMode.always;
                              }
                            },
                            child: SvgPicture.asset(
                              Assets.imagesSearch,
                              fit: BoxFit.scaleDown,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 140),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 42.0,
                        vertical: 16,
                      ),
                      child: Container(
                        height: 190,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(Assets.imagesSearchPachint),
                      ),
                    ),
                    Text(
                      S.of(context).patientIdHint,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.style20W400(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
