import 'package:dartz/dartz.dart';
import 'package:smile_simulation/core/database/cache/cache_helper.dart';
import 'package:smile_simulation/core/errors/failure.dart';
import 'package:smile_simulation/features/auth/login/data/models/forget_model/forget_model.dart';
import '../../../../../../constant.dart';
import '../../../../../../core/api/api_keys.dart';
import '../../../../../../core/api/dio_consumer.dart';
import '../../../../../../core/api/end_point.dart';
import '../../../../../../core/errors/exceptions.dart';
import 'forget_password_repo.dart';

class ForgetPasswordRepoImpl extends ForgetPasswordRepo {
  ForgetPasswordRepoImpl({required this.dioConsumer});

  final DioConsumer dioConsumer;

  @override
  Future<Either<Failure, ForgetModel>> forgetPassword({
    required String email,
  }) async {
    try {
      var response = await dioConsumer.post(
        EndPoint.forgetPassword,
        data: {ApiKeys.email: email},
      );

      CacheHelper.sharedPreferences.setString(
        ApiKeys.token,
        ForgetModel.fromJson(response).data!.token!,
      );
      return Right(ForgetModel.fromJson(response));
    } on ServerException catch (e) {
      logger.e("Exception in ForgetPassword: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in ForgetPassword: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }

  @override
  Future<Either<Failure, ForgetModel>> verifyOTP({
    required String email,
    required String codeOTP,
  }) async {
    try {
      var response = await dioConsumer.post(
        EndPoint.verifyOTP,
        data: {ApiKeys.email: email, ApiKeys.codeOTP: codeOTP},
      );
      return Right(ForgetModel.fromJson(response));
    } on ServerException catch (e) {
      logger.e("Exception in verifyOTP: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in verifyOTP: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع '));
    }
  }

  @override
  Future<Either<Failure, ForgetModel>> resetPassword({
    required String email,
    required String token,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      var response = await dioConsumer.put(
        EndPoint.resetPassword,
        data: {
          ApiKeys.email: email,
          ApiKeys.token: token,
          ApiKeys.newPassword: password,
          ApiKeys.confirmNewPassword: confirmPassword,
        },
      );
      return Right(ForgetModel.fromJson(response));
    } on ServerException catch (e) {
      logger.e("Exception in resetPassword: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in resetPassword: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع '));
    }
  }
}
