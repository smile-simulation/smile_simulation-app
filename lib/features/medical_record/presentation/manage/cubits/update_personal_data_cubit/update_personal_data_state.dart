import '../../../../data/models/personal_data_models/Persona_data_model.dart';

sealed class UpdatePersonalDataState {}

final class UpdatePersonalDataInitial extends UpdatePersonalDataState {}

final class UpdatePersonalDataLoading extends UpdatePersonalDataState {}

final class UpdatePersonalDataSuccess extends UpdatePersonalDataState {
  final PersonaDataModel dataModel ;

UpdatePersonalDataSuccess(this.dataModel);
}

final class UpdatePersonalDataFailure extends UpdatePersonalDataState {
  final String message;

  UpdatePersonalDataFailure(this.message);
}
