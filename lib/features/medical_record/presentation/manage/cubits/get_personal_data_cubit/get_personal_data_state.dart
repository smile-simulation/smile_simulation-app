import '../../../../data/models/personal_data_models/Persona_data_model.dart';

sealed class GetPersonalDataState {}

final class GetPersonalDataInitial extends GetPersonalDataState {}

final class GetPersonalDataLoading extends GetPersonalDataState {}

final class GetPersonalDataSuccess extends GetPersonalDataState {
  final PersonaDataModel dataModel;

  GetPersonalDataSuccess(this.dataModel);
}

final class GetPersonalDataFailure extends GetPersonalDataState {
  final String message;

  GetPersonalDataFailure(this.message);
}
