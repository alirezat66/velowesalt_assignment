import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/get_posts_use_case.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final GetPostsUseCase usecase;
  PostsCubit(this.usecase) : super(PostsInitial());
  getUserPosts(int userId) async {
    emit(PostsLoading());
    try {
      final posts = await usecase.call(userId);
      emit(PostsLoaded(posts));
    } catch (e) {
      if (e is DioError) {
        emit(PostsLoadingFailed(e.message));
      } else {
        emit(PostsLoadingFailed(e.toString()));
      }
    }
  }
}
