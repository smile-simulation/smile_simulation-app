import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:smile_simulation/core/api/dio_consumer.dart';
import 'package:smile_simulation/features/advices/data/repos/advices_category_repo/advices_category_repo.dart';
import 'package:smile_simulation/features/advices/data/repos/advices_category_repo/advices_category_repo_impl.dart';
import 'package:smile_simulation/features/advices/data/repos/advices_repo/advices_repo.dart';
import 'package:smile_simulation/features/advices/data/repos/advices_repo/advices_repo_impl.dart';
import 'package:smile_simulation/features/auth/login/data/repos/login_repo/login_repo.dart';
import 'package:smile_simulation/features/auth/login/data/repos/login_repo/login_repo_impl.dart';
import 'package:smile_simulation/features/home_feature/data/repos/comments_repo/comments_repo.dart';
import 'package:smile_simulation/features/home_feature/data/repos/comments_repo/comments_repo_impl.dart';
import 'package:smile_simulation/features/home_feature/data/repos/posts_repo/posts_repo_implement.dart';
import '../../features/auth/login/data/repos/forget_repos/forget_password_repo.dart';
import '../../features/auth/login/data/repos/forget_repos/forget_password_repo_impl.dart';
import '../../features/auth/sign_up/data/repos/sign_up_repo.dart';
import '../../features/auth/sign_up/data/repos/sign_up_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<LoginRepo>(
    LoginRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<CommentsRepo>(
    CommentsRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<SignUpRepo>(
    SignUpRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<ForgetPasswordRepo>(
    ForgetPasswordRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<AdvicesRepo>(
    AdvicesRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<AdvicesCategoryRepo>(
    AdvicesCategoryRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<PostsRepoImplement>(
    PostsRepoImplement(dioConsumer: getIt<DioConsumer>()),
  );
}
