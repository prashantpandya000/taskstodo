import 'services/auth_service.dart';
import 'services/firestore_service.dart';
import 'package:get_it/get_it.dart';
import 'services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());

  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => FirestoreService());
}
