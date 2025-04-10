import 'package:dartz/dartz.dart';
import 'package:smile_simulation/features/user_account/data/models/user/user..dart';

import '../../../../../core/errors/failure.dart';

abstract class UserDetailsRepo {
  Future<Either<Failure, User>> getUserDetails({required String token});
}
