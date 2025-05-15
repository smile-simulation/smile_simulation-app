import 'package:flutter/material.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/features/search_feature/presentation/views/widgets/custom_search_box.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../generated/assets.dart';

class MedicalRecordView extends StatelessWidget {
  const MedicalRecordView({super.key});

  static const String routeName = 'MedicalRecordView';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: customAppbar(context, title: 'السجل العلاجي', isBack: true),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomSearchBox(),
            ),
            Expanded(
              child: CustomBodyScreen(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      ListView(
                        children: [
                          const SizedBox(height: 20),

                          Container(
                            height: 48,
                            padding: EdgeInsetsDirectional.all(4),
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
                                    'محمد فوزي محمود',
                                    style: AppTextStyles.subTitle1(context),
                                  ),
                                ),
                                Text(
                                  '#34251',
                                  style: AppTextStyles.subTitle1(
                                    context,
                                  ).copyWith(color: AppColors.primaryColor),
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
                              SizedBox(width: 8),
                              Text('🧑‍⚕️'),
                            ],
                          ),
                          const SizedBox(height: 12),
                          ExpandableTreatmentCard(
                            doctorName: 'محمود علي محمد',
                            date: '19/1/2025',
                          ),
                          ExpandableTreatmentCard(
                            doctorName: 'محمود علي محمد',
                            date: '12/5/2024',
                          ),
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
                              Navigator.pushNamed(context, AddMedicalRecordView.routeName);
                            },
                            child: Icon(Icons.add, color: AppColors.whiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandableTreatmentCard extends StatefulWidget {
  final String doctorName;
  final String date;

  const ExpandableTreatmentCard({
    super.key,
    required this.doctorName,
    required this.date,
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
          if (isExpanded) _buildExpandedContent(),
        ],
      ),
    );
  }

  Widget _buildExpandedContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: AppColors.greyColor),
        TreatmentDetailsSection(),
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
              _buildCheckbox("تنظيف", true),
              _buildCheckbox("خلع", false),
              _buildCheckbox("حشو", false),
              _buildCheckbox("تركيب", false),
              _buildCheckbox("علاج عصب", false),
              _buildCheckbox("أخرى", false),
              _buildCheckbox("[----]", false),
            ],
          ),
          const SizedBox(height: 16),
          const Text("الروشتة:", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _buildPrescriptionBox("Medicine1", "مرة يومياً", "14 يوم"),
          const SizedBox(height: 4),
          _buildPrescriptionBox("Medicine2", "مرتين يومياً", "أسبوع واحد"),
          const SizedBox(height: 16),
          const Text("الملفات:", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFF6DC4DA),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.image, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Column(
                children: [
                  _buildDownloadFile("1_ملف"),
                  const SizedBox(height: 12),
                  _buildDownloadFile("2_ملف"),
                ],
              ),
            ],
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
            child: const TextField(
              maxLines: 3,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "التفاصيل الإضافية...",
              ),
            ),
          ),
          const SizedBox(height: 12),
          Visibility(
            visible: userType == "Doctor",
            child:   isEditMode ?Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  isMinWidth: true,

                  title: "حفظ التعديلات",
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      EditMedicalRecordView.routeName,
                      arguments: existingData,
                    );
                  },
                ),
                CustomButton(
                  isMinWidth: true,
                  isSecondary: true,
                  title: "إلغاء",
                  onPressed: () {},
                ),
              ],
            ): Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  isMinWidth: true,

                  title: "تعديل البيانات",
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      EditMedicalRecordView.routeName,
                      arguments: existingData,
                    );
                  },
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
          onChanged: (_) {},
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

  Widget _buildDownloadFile(String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label),
        const SizedBox(width: 4),
        const Icon(Icons.download, size: 18, color: Colors.grey),
      ],
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
                // تنفيذ الحفظ هنا
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
                // تنفيذ التحديث هنا
              },
            ),
          ),
        ),
      ),
    );
  }
}
