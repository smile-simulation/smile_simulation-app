import 'package:dartz/dartz.dart';
import 'package:smile_simulation/features/user_account/data/models/user/user..dart';

import '../../../../../core/errors/failure.dart';
import '../../../../home_feature/data/models/post_model.dart';

abstract class UserDetailsRepo {
  Future<Either<Failure, User>> getUserDetails({required String token});
  Future<Either<Failure, List<PostModel>>> getPosts({required String userId});
  Future<Either<Failure, String>> removePost({required int postId});
}
