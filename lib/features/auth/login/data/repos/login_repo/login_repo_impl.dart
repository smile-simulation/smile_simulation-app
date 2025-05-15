import 'package:dartz/dartz.dart';
import 'package:smile_simulation/features/auth/login/data/models/login_model/Login_model.dart';
import '../../../../../../constant.dart';
import '../../../../../../core/api/api_keys.dart';
import '../../../../../../core/api/dio_consumer.dart';
import '../../../../../../core/api/end_point.dart';
import '../../../../../../core/database/cache/cache_helper.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/errors/failure.dart';
import 'login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  LoginRepoImpl({required this.dioConsumer});

  final DioConsumer dioConsumer;

  @override
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await dioConsumer.post(
        EndPoint.login,
        data: {ApiKeys.email: email, ApiKeys.password: password},
      );
      CacheHelper().saveMap(key:userData , value: response["data"] );
      return Right(LoginModel.fromJson(response));
    } on ServerException catch (e) {
      logger.e("Exception in Login: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in Login: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع في التسجيل'));
    }
  }
}
