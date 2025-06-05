import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../models/health_status_models/Health_status_model.dart';

abstract class HealthStatusRepo {
  Future<Either<Failure, HealthStatusModel>> updateHealthStatus({
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
  });
}
