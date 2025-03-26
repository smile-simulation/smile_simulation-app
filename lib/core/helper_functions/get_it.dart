import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  // getIt.registerSingleton<FireStoreService>(FireStoreService());
  // getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
  //   getIt<FirebaseAuthService>(),
  //   getIt<FireStoreService>(),
  // ));
  // getIt.registerSingleton<ProductRepo>(ProductRepoImpl(
  //   databaseService: getIt<FireStoreService>(),
  // ));
}
