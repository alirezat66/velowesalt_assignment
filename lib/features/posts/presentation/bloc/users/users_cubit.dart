import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:velowesalt/features/posts/domain/entities/user_entity.dart';

import '../../../domain/usecases/get_users_use_case.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final GetUsersUseCase useCase;
  UsersCubit(this.useCase) : super(UsersInitial());
  void getUsers() async {
    emit(UsersLoading());
    try {
      final users = await useCase.call();
      emit(UsersLoaded(users));
    } catch (e) {
      if (e is DioError) {
        UsersLoadingFailed(e.message);
      } else {
        UsersLoadingFailed(e.toString());
      }
    }
  }
}
