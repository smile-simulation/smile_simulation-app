import 'package:dartz/dartz.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/errors/failure.dart';
import 'package:smile_simulation/features/auth/login/data/models/forget_model/forget_model.dart';
import '../../../../../../constant.dart';
import '../../../../../../core/api/api_keys.dart';
import '../../../../../../core/api/dio_consumer.dart';
import '../../../../../../core/api/end_point.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../models/change_password_model/change_password_model.dart';
import 'change_password_repo.dart';

class ChangePasswordRepoImpl extends ChangePasswordRepo {
  ChangePasswordRepoImpl({required this.dioConsumer});

  final DioConsumer dioConsumer;

  @override
  Future<Either<Failure, ChangePasswordModel>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    try {
      var response = await dioConsumer.post(
        EndPoint.changePassword,
        data: {
          "currentPassword": currentPassword,
          "newPassword": newPassword,
          "confirmNewPassword": confirmNewPassword,
        },
      );
      return Right(ChangePasswordModel.fromJson(response));
    } on ServerException catch (e) {
      logger.e("Exception in changePassword: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in changePassword: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع '));
    }
  }
}
