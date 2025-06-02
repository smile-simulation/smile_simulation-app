import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_simulation/features/medical_record/presentation/manage/cubits/update_health_status_cubit/update_health_status_state.dart';
import '../../../../data/repos/health_status_repos/health_status_repo.dart';
import '../../../../data/repos/personal_data_repos/personal_data_repo.dart';

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
