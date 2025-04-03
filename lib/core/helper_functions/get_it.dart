import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/features/advices/data/repos/advices_repo.dart';
import 'package:smile_simulation/features/advices/data/repos/advices_repo_impl.dart';
import '../../features/auth/sign_up/data/repos/sign_up_repo.dart';
import '../../features/auth/sign_up/data/repos/sign_up_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<SignUpRepo>(
    SignUpRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<AdvicesRepo>(
    AdvicesRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
}
