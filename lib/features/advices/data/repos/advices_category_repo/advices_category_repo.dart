import 'package:dartz/dartz.dart';
import 'package:smile_simulation/core/errors/failure.dart';

import '../../models/advice/advice.dart';

abstract class AdvicesCategoryRepo {
  Future<Either<Failure, List<Advice>>> getAdvicesByCategoryId({
    required int id,
  });
}
