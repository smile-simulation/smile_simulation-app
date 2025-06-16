import '../../../../data/models/medical_record_models/medical_record_model.dart';

abstract class MedicalRecordState {}

class MedicalRecordInitial extends MedicalRecordState {}

class MedicalRecordLoading extends MedicalRecordState {}

class MedicalRecordSuccess extends MedicalRecordState {
  final List<MedicalRecord> records;
  MedicalRecordSuccess(this.records);
}

class MedicalRecordFailure extends MedicalRecordState {
  final String message;
  MedicalRecordFailure(this.message);
}

class DeleteMedicalRecordLoading extends MedicalRecordState {}

class DeleteMedicalRecordSuccess extends MedicalRecordState {
  final String message;
  DeleteMedicalRecordSuccess(this.message);
}

class DeleteMedicalRecordFailure extends MedicalRecordState {
  final String message;
  DeleteMedicalRecordFailure(this.message);
}

