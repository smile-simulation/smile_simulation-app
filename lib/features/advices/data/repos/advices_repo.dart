import 'package:dartz/dartz.dart';
import 'package:smile_simulation/core/errors/failure.dart';
import 'package:smile_simulation/features/advices/data/models/advice/advice.dart';

abstract class AdvicesRepo {
  Future<Either<Failure, List<Advice>>> getGeneralAdvices();
}
