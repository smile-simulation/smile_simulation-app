// update_personal_data_state.dart
import 'package:smile_simulation/features/medical_record/data/models/personal_data_models/persona_data_model.dart';

sealed class UpdatePersonalDataState {}

final class UpdatePersonalDataInitial extends UpdatePersonalDataState {}

final class UpdatePersonalDataLoading extends UpdatePersonalDataState {}

final class UpdatePersonalDataSuccess extends UpdatePersonalDataState {
  final PersonaDataModel dataModel;

  UpdatePersonalDataSuccess(this.dataModel);
}

final class UpdatePersonalDataFailure extends UpdatePersonalDataState {
  final String message;

  UpdatePersonalDataFailure(this.message);
}

sealed class PatientPersonalDataState {}

class PatientPersonalDataInitial extends PatientPersonalDataState {}

class PatientPersonalDataLoading extends PatientPersonalDataState {}

class PatientPersonalDataSuccess extends PatientPersonalDataState {
  final PersonaDataModel data;

  PatientPersonalDataSuccess(this.data);
}

class PatientPersonalDataFailure extends PatientPersonalDataState {
  final String message;

  PatientPersonalDataFailure(this.message);
}