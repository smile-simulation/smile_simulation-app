import 'package:dartz/dartz.dart';
import 'package:smile_simulation/core/errors/failure.dart';
import 'package:smile_simulation/features/advices/data/models/advice/advice.dart';
import 'package:smile_simulation/features/advices/data/models/advices_category/advices_category.dart';

abstract class AdvicesRepo {
  Future<Either<Failure, List<Advice>>> getGeneralAdvices();
  Future<Either<Failure, List<AdvicesCategory>>> getAllAdvicesCategories();
}
