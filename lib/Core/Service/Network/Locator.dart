import 'package:FindHackathon/Core/Service/Network/ChatsModel.dart';
import 'package:get_it/get_it.dart';

import 'FirestoreDB.dart';

GetIt getIt = GetIt.instance;

setupLocators() {
  getIt.registerLazySingleton(() => FireStoreDB());

  getIt.registerFactory(() => ChatsModel());
}
