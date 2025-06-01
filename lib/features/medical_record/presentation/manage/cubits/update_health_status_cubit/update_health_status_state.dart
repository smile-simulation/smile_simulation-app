import '../../../../data/models/health_status_models/Health_status_model.dart';

sealed class UpdateHealthStatusState {}

final class UpdateHealthStatusInitial extends UpdateHealthStatusState {}

final class UpdateHealthStatusLoading extends UpdateHealthStatusState {}

final class UpdateHealthStatusSuccess extends UpdateHealthStatusState {
  final HealthStatusModel dataModel;

  UpdateHealthStatusSuccess(this.dataModel);
}

final class UpdateHealthStatusFailure extends UpdateHealthStatusState {
  final String message;

  UpdateHealthStatusFailure(this.message);
}
