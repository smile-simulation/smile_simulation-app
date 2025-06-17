import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/constant.dart';
import 'package:smile_simulation/core/widgets/custom_auth_appbar.dart';
import 'package:smile_simulation/core/widgets/custom_body_screen.dart';
import 'package:smile_simulation/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/helper_functions/custom_error.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
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
        appBar: customAppbar(context, title: S.of(context).medicalRecord, isBack: true),
        body: CustomBodyScreen(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocConsumer<MedicalRecordCubit, MedicalRecordState>(
              listener: (context, state) {
                if (state is AddMedicalRecordSuccess) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    customSuccess(context, massage: state.response.message);
                    context.read<MedicalRecordCubit>().fetchMedicalRecords(
                      userId,
                    );
                  });
                } else if (state is DeleteMedicalRecordSuccess) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    customSuccess(context, massage: S.of(context).record_deleted_success);
                    context.read<MedicalRecordCubit>().fetchMedicalRecords(
                      userId,
                    );
                  });
                } else if (state is DeleteMedicalRecordFailure ||
                    state is MedicalRecordFailure) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    customError(
                      context,
                      massage:
                          state is DeleteMedicalRecordFailure
                              ? state.message
                              : (state as MedicalRecordFailure).message,
                    );
                  });
                }
                // TODO: implement listener
              },
              builder: (context, state) {
                return BlocBuilder<MedicalRecordCubit, MedicalRecordState>(
                  builder: (context, state) {
                    if (state is MedicalRecordLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      );
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
                                        borderRadius: BorderRadius.circular(
                                          200,
                                        ),
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
                                            : S.of(context).unknown,
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
                                    S.of(context).medicalRecord,
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
                                        'additionalNotes':
                                            record.additionalNotes,
                                        'historyId': record.id,
                                      },
                                    ),
                                  )
                                  .toList(),
                            ],
                          ),
                          Visibility(
                            visible: CacheHelper().getMap(key: userData)!['role'] == "Doctor",
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
                );
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${S.of(context).date}: ',
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

                    const SizedBox(width: 4),

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${S.of(context).doctor}: ',
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
                        ],
                      ),
                    ),
                  ],
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
          existingData: recordData,
          onSave: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => EditMedicalRecordView(recordData: recordData),
              ),
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
    final historyId =
        existingData?['historyId'] as int?; // افتراض أن historyId موجود

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE7F6FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
           S.of(context).medical_procedure,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildCheckbox(S.of(context).cleaning, procedureSelections['تنظيف'] ?? false),
              _buildCheckbox(S.of(context).extraction, procedureSelections['خلع'] ?? false),
              _buildCheckbox(S.of(context).filling, procedureSelections['حشو'] ?? false),
              _buildCheckbox(S.of(context).installation, procedureSelections['تركيب'] ?? false),
              _buildCheckbox(
                S.of(context).root_treatment,
                procedureSelections['علاج_عصب'] ?? false,
              ),
              _buildCheckbox(S.of(context).other, procedureSelections['أخرى'] ?? false),
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
          //   _buildPrescriptionBox(
          //     prescription.split(',')[0],
          //     "مرة يومياً",
          //     "14 يوم",
          //   ),
          // const SizedBox(height: 16),
           Text(S.of(context).files, style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          if (fileUrls.isEmpty)
             Text(S.of(context).none, style: TextStyle(color: Colors.grey)),
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
           Text(
            S.of(context).additional_details_notes,
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
                hintText: S.of(context).additional_details_placeholder,
              ),
              controller: TextEditingController(text: additionalNotes),
              enabled: isEditMode,
            ),
          ),
          const SizedBox(height: 12),
          Visibility(
            visible: CacheHelper().getMap(key: userData)!['role'] == "Doctor",
            child:
                isEditMode
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          isMinWidth: true,
                          title: S.of(context).save_edits,
                          onPressed: onSave ?? () {},
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
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          isMinWidth: true,
                          title: S.of(context).edit_data,
                          onPressed: onSave ?? () {},
                        ),
                        CustomButton(
                          isMinWidth: true,
                          isSecondary: true,
                          title: S.of(context).delete_record,
                          onPressed: () {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.question,
                              animType: AnimType.scale,
                              title: S.of(context).delete_record_confirmation,
                              desc: S.of(context).delete_record_warning,
                              btnOk: CustomButton(
                                isMinWidth: true,
                                title: S.of(context).yes,
                                onPressed: () async {
                                  if (historyId != null) {
                                    context
                                        .read<MedicalRecordCubit>()
                                        .deleteMedicalRecord(
                                          username: userId,
                                          historyId: historyId,
                                        );
                                    Navigator.pop(context);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                       SnackBar(
                                        content: Text(
                                          S.of(context).record_id_not_found,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                              btnCancel: CustomButton(
                                isMinWidth: true,
                                isSecondary: true,
                                title: S.of(context).no,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ).show();
                          },
                        ),
                      ],
                    ),
          ),

          // دالة للتحقق من المدة (7 أيام كمثال)
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
                      child: Text(
                        S.of(context).file_content,
                      ),
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
                              return  Text(
                                S.of(context).image_load_failed,
                              );
                            },
                          ),
                        if (!url.toLowerCase().endsWith('.jpg') &&
                            !url.toLowerCase().endsWith('.jpeg') &&
                            !url.toLowerCase().endsWith('.png'))
                          GestureDetector(
                            onTap: () async {
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                    content: Text(
                                      S.of(context).cannot_open_file,
                                    ),
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

class AddMedicalRecordView extends StatefulWidget {
  static const routeName = 'AddMedicalRecordView';

  const AddMedicalRecordView({super.key});

  @override
  State<AddMedicalRecordView> createState() => _AddMedicalRecordViewState();
}

class _AddMedicalRecordViewState extends State<AddMedicalRecordView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedicalRecordCubit(MedicalRecordRepositoryImpl()),
      child: Scaffold(
        appBar: customAppbar(context, title: S.of(context).add_medical_record, isBack: true),
        body: AddMedicalRecordBodyView(),
      ),
    );
  }
}

class AddMedicalRecordBodyView extends StatefulWidget {
  const AddMedicalRecordBodyView({super.key});

  @override
  State<AddMedicalRecordBodyView> createState() =>
      _AddMedicalRecordBodyViewState();
}

class _AddMedicalRecordBodyViewState extends State<AddMedicalRecordBodyView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _additionalNotesController =
      TextEditingController();
  final List<File> _files = [];
  Map<String, bool> _procedureSelections = {
    'تنظيف': false,
    'خلع': false,
    'حشو': false,
    'تركيب': false,
    'علاج_عصب': false,
    'أخرى': false,
  };

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );
    if (result != null) {
      setState(() {
        _files.addAll(result.paths.map((path) => File(path!)).toList());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomBodyScreen(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE7F6FA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    S.of(context).medical_procedure,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:
                        _procedureSelections.entries.map((entry) {
                          return CheckboxListTile(
                            title: Text(entry.key),
                            value: entry.value,
                            onChanged: (val) {
                              setState(() {
                                _procedureSelections[entry.key] = val!;
                              });
                            },
                          );
                        }).toList(),
                  ),
                  const SizedBox(height: 16),
                   Text(
                    S.of(context).files,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  if (_files.isEmpty)
                     Text(S.of(context).none, style: TextStyle(color: Colors.grey)),
                  if (_files.isNotEmpty)
                    Wrap(
                      children:
                          _files
                              .map(
                                (file) => Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(file.path.split('/').last),
                                ),
                              )
                              .toList(),
                    ),
                  ElevatedButton(
                    onPressed: _pickFiles,
                    child: Text(
                      S.of(context).choose_files,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                   Text(
                   S.of(context).additional_details_notes,
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
                        hintText: S.of(context).additional_details_placeholder,
                      ),
                      controller: _additionalNotesController,
                      enabled: true,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        isMinWidth: true,
                        title:  S.of(context).save_edits,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final cubit = context.read<MedicalRecordCubit>();
                            cubit.addMedicalRecord(
                              doctorId:
                                  CacheHelper().getMap(
                                    key: userData,
                                  )?['userId'] ??
                                  "",
                              username: userId,
                              prescription: _additionalNotesController.text,
                              procedureSelectionsCleaning:
                                  _procedureSelections['تنظيف']!,
                              procedureSelectionsExtraction:
                                  _procedureSelections['خلع']!,
                              procedureSelectionsFilling:
                                  _procedureSelections['حشو']!,
                              procedureSelectionsInstallation:
                                  _procedureSelections['تركيب']!,
                              procedureSelectionsNerveTreatment:
                                  _procedureSelections['علاج_عصب']!,
                              procedureSelectionsOther:
                                  _procedureSelections['أخرى']!,
                              procedureSelectionsBridgeInstallation:
                                  _procedureSelections['تنظيف']!,
                              // تصحيح هنا
                              procedureSelectionsPhotos:
                                  _procedureSelections['تنظيف']!,
                              // تصحيح هنا
                              procedureSelectionsOtherDescription: "",
                              files: _files,
                              additionalNotes: _additionalNotesController.text,
                            );
                            Navigator.pop(context);
                          }
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EditMedicalRecordView extends StatefulWidget {
  static const routeName = 'EditMedicalRecordView';

  final Map<String, dynamic> recordData;

  const EditMedicalRecordView({super.key, required this.recordData});

  @override
  State<EditMedicalRecordView> createState() => _EditMedicalRecordViewState();
}
class _EditMedicalRecordViewState extends State<EditMedicalRecordView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _additionalNotesController = TextEditingController();
  final List<File> _files = [];
  Map<String, bool> _procedureSelections = {
    'تنظيف': false,
    'خلع': false,
    'حشو': false,
    'تركيب': false,
    'علاج_عصب': false,
    'أخرى': false,
  };

  @override
  void initState() {
    super.initState();
    _additionalNotesController.text = widget.recordData['additionalNotes'] ?? '';
    final existingSelections = widget.recordData['procedureSelections'] ?? {};
    _procedureSelections = {
      'تنظيف': existingSelections['تنظيف'] ?? false,
      'خلع': existingSelections['خلع'] ?? false,
      'حشو': existingSelections['حشو'] ?? false,
      'تركيب': existingSelections['تركيب'] ?? false,
      'علاج_عصب': existingSelections['علاج_عصب'] ?? false,
      'أخرى': existingSelections['أخرى'] ?? false,
    };
  }

  @override
  void dispose() {
    _additionalNotesController.dispose();
    super.dispose();
  }

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result != null) {
      setState(() {
        _files.addAll(result.paths.map((path) => File(path!)).toList());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedicalRecordCubit(MedicalRecordRepositoryImpl()),
      child: Scaffold(
        appBar: customAppbar(context, title: 'تعديل السجل العلاجي', isBack: true),
        body: BlocConsumer<MedicalRecordCubit, MedicalRecordState>(
          listener: (context, state) {
            if (state is EditMedicalRecordSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                final cubit = context.read<MedicalRecordCubit>();
                cubit.fetchMedicalRecords(
                  userId,
                );

                await customSuccess(context, massage: 'تم تعديل السجل الطبي بنجاح');
          // إعادة جلب السجلات
                Navigator.pop(context);
              });
            } else if (state is EditMedicalRecordFailure) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                customError(context, massage: state.message);
              });
            }
          },
          builder: (context, state) {
            return CustomBodyScreen(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7F6FA),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("الإجراء الطبي:", style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: _procedureSelections.entries.map((entry) {
                              return CheckboxListTile(
                                title: Text(entry.key),
                                value: entry.value,
                                onChanged: (val) => setState(() => _procedureSelections[entry.key] = val!),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 16),
                          const Text("الملفات:", style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          if (_files.isEmpty && (widget.recordData['fileUrls'] ?? []).isEmpty)
                            const Text("لا يوجد", style: TextStyle(color: Colors.grey)),
                          if ((widget.recordData['fileUrls'] ?? []).isNotEmpty)
                            Wrap(
                              children: (widget.recordData['fileUrls'] as List?)
                                  ?.map((url) => Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(url.split('/').last),
                              ))
                                  .toList() ?? [],
                            ),
                          if (_files.isNotEmpty)
                            Wrap(
                              children: _files
                                  .map((file) => Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(file.path.split('/').last),
                              ))
                                  .toList(),
                            ),
                          ElevatedButton(
                            onPressed: _pickFiles,
                            child: Text('اختر ملفات'),
                          ),
                          const SizedBox(height: 16),
                          const Text("تفاصيل إضافية / ملاحظات:", style: TextStyle(fontWeight: FontWeight.bold)),
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
                              controller: _additionalNotesController,
                              enabled: true,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                isLoading: state is EditMedicalRecordLoading,
                                isMinWidth: true,
                                title: "حفظ التعديلات",
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    final cubit = context.read<MedicalRecordCubit>();
                                    final id = widget.recordData['historyId'] as int;
                                    cubit.editMedicalRecord(id, {
                                      'prescription': _additionalNotesController.text,
                                      'procedureSelections': _procedureSelections,
                                      'files': _files,
                                      'additionalNotes': _additionalNotesController.text,
                                    });
                                  }
                                },
                              ),
                              CustomButton(
                                isMinWidth: true,
                                isSecondary: true,
                                title: S.of(context).cancel,
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}