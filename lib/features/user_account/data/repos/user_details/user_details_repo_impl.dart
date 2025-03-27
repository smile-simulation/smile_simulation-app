import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/core/error/failures.dart';
import 'package:smile_simulation/features/user_account/data/models/user/user..dart';
import 'package:smile_simulation/features/user_account/data/repos/user_details/user_details_repo.dart';

class UserDetailsRepoImpl implements UserDetailsRepo {
  final DioConsumer dioConsumer;

  UserDetailsRepoImpl({required this.dioConsumer});
  @override
  Future<Either<Failure, User>> getUserDetails({required String token}) async {
    // dioConsumer.get(path);
    Response response = await Dio().get(
      "http://smilesimulation.runasp.net/api/User/GetUserDetils",
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
    print(response.data);
    
    // TODO: implement getUserDetails
    throw UnimplementedError();
  }
}
