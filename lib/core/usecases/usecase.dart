abstract class BaseUseCase<T> {
  const BaseUseCase();
}

/* abstract class UseCase<T, P> extends BaseUseCase<T> {
  const UseCase() : super();

  Future<T> call(P params);
} */

// for the situation that we need call without param
abstract class NoParamsUseCase<T> extends BaseUseCase<T> {
  const NoParamsUseCase() : super();

  Future<T> call();
}
