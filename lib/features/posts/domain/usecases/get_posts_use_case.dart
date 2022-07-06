import 'package:velowesalt/features/posts/domain/entities/user_entity.dart';
import 'package:velowesalt/features/posts/domain/repositories/user_repository.dart';

import '../../../../core/usecases/usecase.dart';

class GetPostsUseCase implements UseCase<List<Post>, int> {
  final UserRepository repository;
  GetPostsUseCase(this.repository);

  @override
  Future<List<Post>> call(int userId) async {
    return await repository.getAUserPost(userId);
  }
}
