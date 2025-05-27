import 'package:dartz/dartz.dart';
import '../../../../../../core/errors/failure.dart';
import '../../models/change_password_model/change_password_model.dart';
import '../../models/delete_account_model/delete_account_model.dart';


abstract class DeleteAccountRepo {

  Future<Either<Failure, DeleteAccountModel>> deleteAccount({
    required String email,
  });
}
