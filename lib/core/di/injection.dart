// lib/core/di/injection.dart
import 'package:get_it/get_it.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../data/data_source/user_remote_data_source.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import '../../domain/repositories/user_repository.dart';
import '../network/dio_client.dart';
import 'package:deeplinks/presentations/authentication/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Dio
  sl.registerLazySingleton(() => DioClient(baseUrl: "http://localhost:5000/api"));

  // Data sources
  sl.registerLazySingleton(() => UserRemoteDataSource(sl()));

  // Repositories
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

  // Usecases
  sl.registerLazySingleton(() => SignupUseCase(sl()));
  sl.registerLazySingleton(() => LoginUseCase(sl()));

  // AuthBloc
  sl.registerFactory(() => AuthBloc(
        signupUseCase: sl(),
        loginUseCase: sl(),
      ));
}
