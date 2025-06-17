import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/features/medical_record/presentation/manage/cubits/update_health_status_cubit/update_health_status_state.dart';
import '../../../../data/models/health_status_models/Health_status_model.dart';
import '../../../../data/repos/health_status_repos/health_status_repo.dart';

class UpdateHealthStatusCubit extends Cubit<UpdateHealthStatusState> {
  UpdateHealthStatusCubit({required this.healthStatusRepo})
    : super(UpdateHealthStatusInitial());

  final HealthStatusRepo healthStatusRepo;

  Future<void> updateHealthStatus({
    required String userName,
    required bool isSmoker,
    required bool hasHypertension,
    required bool hasDiabetes,
    required bool hasHeartDisease,
    required bool hasLiverDisease,
    required bool hasKidneyDisease,
    required bool hasAnemia,
    required bool hasThyroidDisease,
    required bool hasHepatitis,
    required bool has_Surgical_Currency,
    required bool familyMedicalHistory,
    required String otherChronicDiseasesDescription,
    required String drug_Allergy,
    required String pregnancyAndBreastfeeding,
  }) async {
    emit(UpdateHealthStatusLoading());
    final result = await healthStatusRepo.updateHealthStatus(
      userName: userName,
      isSmoker: isSmoker,
      hasHypertension: hasHypertension,
      hasDiabetes: hasDiabetes,
      hasHeartDisease: hasHeartDisease,
      hasLiverDisease: hasLiverDisease,
      hasKidneyDisease: hasKidneyDisease,
      hasAnemia: hasAnemia,
      hasThyroidDisease: hasThyroidDisease,
      hasHepatitis: hasHepatitis,
      has_Surgical_Currency: has_Surgical_Currency,
      familyMedicalHistory: familyMedicalHistory,
      otherChronicDiseasesDescription: otherChronicDiseasesDescription,
      drug_Allergy: drug_Allergy,
      pregnancyAndBreastfeeding: pregnancyAndBreastfeeding,
    );

    result.fold(
      (l) => emit(UpdateHealthStatusFailure(l.errorMessage)),
      (r) => emit(UpdateHealthStatusSuccess(r)),
    );
  }
}

abstract class FetchHealthStatusState {}

class FetchHealthStatusInitial extends FetchHealthStatusState {}

class FetchHealthStatusLoading extends FetchHealthStatusState {}

class FetchHealthStatusSuccess extends FetchHealthStatusState {
  final HealthStatusModel dataModel;
  FetchHealthStatusSuccess(this.dataModel);
}

class FetchHealthStatusFailure extends FetchHealthStatusState {
  final String message;
  FetchHealthStatusFailure(this.message);
}

class FetchHealthStatusCubit extends Cubit<FetchHealthStatusState> {
  FetchHealthStatusCubit({required this.healthStatusRepo})
      : super(FetchHealthStatusInitial());

  final HealthStatusRepo healthStatusRepo;

  Future<void> fetchHealthStatus({required String userName}) async {
    emit(FetchHealthStatusLoading());
    final result = await healthStatusRepo.fetchHealthStatus(userName: userName);
    result.fold(
          (l) => emit(FetchHealthStatusFailure(l.errorMessage)),
          (r) => emit(FetchHealthStatusSuccess(r)),
    );
  }
}