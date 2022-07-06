import 'package:velowesalt/features/posts/domain/entities/user_entity.dart';
import 'package:velowesalt/features/posts/domain/repositories/user_repository.dart';

import '../../../../core/usecases/usecase.dart';

class GetUsersUseCase implements NoParamsUseCase<List<UserEntity>> {
  final UserRepository repository;
  GetUsersUseCase(this.repository);
  @override
  Future<List<UserEntity>> call() async {
    return await repository.getUsers();
  }
}
