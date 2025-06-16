import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/helper_functions/custom_error.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../generated/assets.dart';
import '../../data/repos/medical_record_repos/medical_record_repo_empl.dart';
import '../manage/cubits/medical_record_cubits/medical_record_cubit.dart';
import '../manage/cubits/medical_record_cubits/medical_record_state.dart';

class MedicalRecordView extends StatelessWidget {
  const MedicalRecordView({super.key});

  static const String routeName = 'MedicalRecordView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              MedicalRecordCubit(MedicalRecordRepositoryImpl())
                ..fetchMedicalRecords(userId),
      child: Scaffold(
        appBar: customAppbar(context, title: 'السجل العلاجي', isBack: true),
        body: CustomBodyScreen(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocBuilder<MedicalRecordCubit, MedicalRecordState>(
              builder: (context, state) {
                if (state is MedicalRecordLoading) {
                  return const Center(child: CircularProgressIndicator(
                    color:  AppColors.primaryColor ,
                  ));
                } else if (state is MedicalRecordFailure) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    customError(context, massage: state.message);
                  });
                  return const SizedBox.shrink();
                } else if (state is MedicalRecordSuccess) {
                  final records = state.records;
                  return Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      ListView(
                        children: [
                          const SizedBox(height: 20),
                          Container(
                            height: 48,
                            padding: const EdgeInsetsDirectional.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.veryLightGreyColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColors.lightGreyColor,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.blue.shade100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(200),
                                    child: Image.asset(
                                      Assets.imagesUser,
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    records.isNotEmpty
                                        ? records[0].patientName
                                        : 'غير معروف',
                                    style: AppTextStyles.subTitle1(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'السجل العلاجي',
                                style: AppTextStyles.headline3(
                                  context,
                                ).copyWith(fontFamily: 'NotoSansSC'),
                              ),
                              const SizedBox(width: 8),
                              const Text('🧑‍⚕️'),
                            ],
                          ),
                          const SizedBox(height: 12),
                          ...records
                              .map(
                                (record) => ExpandableTreatmentCard(
                                  doctorName: record.doctorName,
                                  date: record.date,
                                  recordData: {
                                    'prescription': record.prescription,
                                    'procedureSelections':
                                        record.procedureSelections,
                                    'fileUrls': record.fileUrls,
                                    'additionalNotes': record.additionalNotes,
                                  },
                                ),
                              )
                              .toList(),
                        ],
                      ),
                      Visibility(
                        visible: userType == 'Doctor',
                        child: Positioned(
                          bottom: 20,
                          child: FloatingActionButton(
                            backgroundColor: AppColors.primaryColor,
                            shape: const CircleBorder(),
                            mini: true,
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AddMedicalRecordView.routeName,
                              );
                            },
                            child: const Icon(
                              Icons.add,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandableTreatmentCard extends StatefulWidget {
  final String doctorName;
  final String date;
  final Map<String, dynamic>? recordData;

  const ExpandableTreatmentCard({
    super.key,
    required this.doctorName,
    required this.date,
    this.recordData,
  });

  @override
  State<ExpandableTreatmentCard> createState() =>
      _ExpandableTreatmentCardState();
}

class _ExpandableTreatmentCardState extends State<ExpandableTreatmentCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF66BAD0).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.greyColor),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => isExpanded = !isExpanded),
            borderRadius: BorderRadius.circular(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'الدكتور: ',
                          style: AppTextStyles.subTitle1(context).copyWith(
                            fontFamily: "NotoSansSC",
                            color: AppColors.primaryColor,
                          ),
                        ),
                        TextSpan(
                          text: widget.doctorName,
                          style: AppTextStyles.subTitle1(context).copyWith(
                            fontFamily: "NotoSansSC",
                            color: AppColors.blackColor,
                          ),
                        ),
                        const TextSpan(text: '   '),
                        TextSpan(
                          text: 'التاريخ: ',
                          style: AppTextStyles.subTitle1(context).copyWith(
                            fontFamily: "NotoSansSC",
                            color: AppColors.primaryColor,
                          ),
                        ),
                        TextSpan(
                          text: widget.date,
                          style: AppTextStyles.subTitle1(context).copyWith(
                            fontFamily: "NotoSansSC",
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isExpanded) const SizedBox(height: 12),
          if (isExpanded) _buildExpandedContent(context),
        ],
      ),
    );
  }

  Widget _buildExpandedContent(BuildContext context) {
    final recordData = widget.recordData ?? {};
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: AppColors.greyColor),
        TreatmentDetailsSection(
          isEditMode: userType == 'Doctor',
          existingData: recordData,
          onSave: () {
            Navigator.pushNamed(
              context,
              EditMedicalRecordView.routeName,
              arguments: recordData,
            );
          },
        ),
      ],
    );
  }
}

class TreatmentDetailsSection extends StatelessWidget {
  final bool isEditMode;
  final VoidCallback? onSave;
  final Map<String, dynamic>? existingData;

  const TreatmentDetailsSection({
    super.key,
    this.isEditMode = false,
    this.onSave,
    this.existingData,
  });

  @override
  Widget build(BuildContext context) {
    final procedureSelections = existingData?['procedureSelections'] ?? {};
    final fileUrls = existingData?['fileUrls'] ?? [];
    final prescription = existingData?['prescription'] ?? '';
    final additionalNotes = existingData?['additionalNotes'] ?? '';

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE7F6FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "الإجراء الطبي:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildCheckbox("تنظيف", procedureSelections['تنظيف'] ?? false),
              _buildCheckbox("خلع", procedureSelections['خلع'] ?? false),
              _buildCheckbox("حشو", procedureSelections['حشو'] ?? false),
              _buildCheckbox("تركيب", procedureSelections['تركيب'] ?? false),
              _buildCheckbox(
                "علاج عصب",
                procedureSelections['علاج_عصب'] ?? false,
              ),
              _buildCheckbox("أخرى", procedureSelections['أخرى'] ?? false),
              _buildCheckbox(
                "[----]",
                procedureSelections['otherDescription'] != null,
              ),
            ],
          ),
          const SizedBox(height: 16),
          // const Text("الروشتة:", style: TextStyle(fontWeight: FontWeight.bold)),
          // const SizedBox(height: 8),
          // if (prescription.isNotEmpty)
          //   _buildPrescriptionBox(prescription.split(',')[0], "مرة يومياً", "14 يوم"),
          // const SizedBox(height: 16),
          const Text("الملفات:", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          if (fileUrls.isEmpty)
            const Text("لا يوجد", style: TextStyle(color: Colors.grey)),
          if (fileUrls.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  fileUrls
                      .map(
                        (url) => _buildDownloadableFile(url, context: context),
                      )
                      .toList()
                      .cast<Widget>(),
            ),
          const SizedBox(height: 16),
          const Text(
            "تفاصيل إضافية / ملاحظات:",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              maxLines: 3,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "التفاصيل الإضافية...",
              ),
              controller: TextEditingController(text: additionalNotes),
              enabled: isEditMode,
            ),
          ),
          const SizedBox(height: 12),
          Visibility(
            visible: userType == "Doctor",
            child:
                isEditMode
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          isMinWidth: true,
                          title: "حفظ التعديلات",
                          onPressed: onSave ?? () {},
                        ),
                        CustomButton(
                          isMinWidth: true,
                          isSecondary: true,
                          title: S.of(context).cancel,
                          onPressed: () {},
                        ),
                      ],
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          isMinWidth: true,
                          title: "تعديل البيانات",
                          onPressed: onSave ?? () {},
                        ),
                        CustomButton(
                          isMinWidth: true,
                          isSecondary: true,
                          title: "حذف السجل",
                          onPressed: () {},
                        ),
                      ],
                    ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckbox(String label, bool isChecked) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: null,
          activeColor: const Color(0xFF6DC4DA),
        ),
        Text(label),
      ],
    );
  }

  Widget _buildPrescriptionBox(String name, String dosage, String duration) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text.rich(
        TextSpan(
          style: const TextStyle(fontSize: 14),
          children: [
            const TextSpan(text: "الدواء: "),
            TextSpan(
              text: "$name  ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const TextSpan(text: "الجرعة: "),
            TextSpan(
              text: "$dosage  ",
              style: TextStyle(color: Colors.blue[800]),
            ),
            const TextSpan(text: "مدة العلاج: "),
            TextSpan(text: duration, style: TextStyle(color: Colors.blue[800])),
          ],
        ),
      ),
    );
  }

  Widget _buildDownloadableFile(String url, {required BuildContext context}) {
    final fileName = url.split('/').last;
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                backgroundColor: AppColors.whiteColor,
                titlePadding: const EdgeInsets.all(0),
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('محتوى الملف:'),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      color: AppColors.redColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                content: SizedBox(
                  width: double.maxFinite,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // عرض الصورة إذا كان الرابط يشير إلى صورة
                        if (url.toLowerCase().endsWith('.jpg') ||
                            url.toLowerCase().endsWith('.jpeg') ||
                            url.toLowerCase().endsWith('.png'))
                          Image.network(
                            url,
                            fit: BoxFit.contain,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: const CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Text('فشل في تحميل الصورة');
                            },
                          ),
                        // إذا كان ملفًا آخر (مثل PDF أو غيره)، عرض رابط للفتح
                        if (!url.toLowerCase().endsWith('.jpg') &&
                            !url.toLowerCase().endsWith('.jpeg') &&
                            !url.toLowerCase().endsWith('.png'))
                          GestureDetector(
                            onTap: () async {
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('لا يمكن فتح الملف'),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              'فتح الملف: $url',
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),

                      ],
                    ),
                  ),
                ),
              ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Text(
          fileName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,

          style: const TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}

class AddMedicalRecordView extends StatelessWidget {
  static const routeName = 'AddMedicalRecordView';

  const AddMedicalRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: 'إضافة سجل علاجي', isBack: true),
      body: CustomBodyScreen(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: TreatmentDetailsSection(
              isEditMode: true,
              onSave: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class EditMedicalRecordView extends StatelessWidget {
  static const routeName = 'EditMedicalRecordView';

  final Map<String, dynamic> recordData;

  const EditMedicalRecordView({super.key, required this.recordData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: 'تعديل السجل العلاجي', isBack: true),
      body: CustomBodyScreen(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: TreatmentDetailsSection(
              isEditMode: true,
              existingData: recordData,
              onSave: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
