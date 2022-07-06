import 'package:get_it/get_it.dart';
import 'package:velowesalt/core/network/dio_client.dart';
import 'package:velowesalt/features/posts/data/datasources/user_remote_data_source.dart';
import 'package:velowesalt/features/posts/data/repositories/user_repository_impl.dart';
import 'package:velowesalt/features/posts/domain/repositories/user_repository.dart';
import 'package:velowesalt/features/posts/domain/usecases/get_posts_use_case.dart';
import 'package:velowesalt/features/posts/domain/usecases/get_users_use_case.dart';
import 'package:velowesalt/features/posts/presentation/bloc/posts/posts_cubit.dart';
import 'package:velowesalt/features/posts/presentation/bloc/users/users_cubit.dart';

import 'features/posts/data/datasources/post_remote_data_source.dart';

final locator = GetIt.instance;

class ServiceLocator {
  static Future<void> init() async {
    locator.registerSingleton<DioClient>(DioClient());
    locator.registerSingleton<UserRemoteDataSource>(
        UserRemoteDataSourceImpl(locator<DioClient>()));
    locator.registerSingleton<PostRemoteDataSource>(
        PostRemoteDataSourceImpl(locator<DioClient>()));
    locator.registerSingleton<UserRepository>(UserRepositoryImpl(
        userDataSource: locator<UserRemoteDataSource>(),
        postRemoteDataSource: locator<PostRemoteDataSource>()));
    locator.registerSingleton<GetUsersUseCase>(
        GetUsersUseCase(locator<UserRepository>()));
    locator.registerSingleton<GetPostsUseCase>(
        GetPostsUseCase(locator<UserRepository>()));
    locator.registerFactory(() => UsersCubit(locator<GetUsersUseCase>()));
    locator.registerFactory(() => PostsCubit(locator<GetPostsUseCase>()));
  }
}
