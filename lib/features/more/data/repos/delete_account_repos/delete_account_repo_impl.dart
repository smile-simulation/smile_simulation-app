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
import '../../models/delete_account_model/delete_account_model.dart';
import 'delete_account_repo.dart';

class DeleteAccountRepoImpl extends DeleteAccountRepo {
  DeleteAccountRepoImpl({required this.dioConsumer});

  final DioConsumer dioConsumer;

  @override
  Future<Either<Failure, DeleteAccountModel>> deleteAccount({
    required String email,
  }) async {
    try {
      var response = await dioConsumer.delete(EndPoint.deleteAccount + email);
      return Right(DeleteAccountModel.fromJson(response));
    } on ServerException catch (e) {
      logger.e("Exception in delete account: ${e.errorModel.message}");
      return Left(ServerFailure(e.errorModel.message!));
    } catch (e) {
      logger.e("Exception in delete account: $e");
      return Left(ServerFailure('حدث خطأ غير متوقع '));
    }
  }
}
