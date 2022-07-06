part of 'posts_cubit.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoadingFailed extends PostsState {
  final String error;
  PostsLoadingFailed(this.error);
}

class PostsLoaded extends PostsState {
  final List<Post> posts;
  PostsLoaded(this.posts);
}
