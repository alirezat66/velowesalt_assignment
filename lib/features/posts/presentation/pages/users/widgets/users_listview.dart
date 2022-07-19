import 'package:flutter/material.dart';
import 'package:velowesalt/core/util/route/named_routing.dart';
import 'package:velowesalt/features/posts/data/models/post_argument.dart';
import 'package:velowesalt/features/posts/domain/entities/user_entity.dart';
import 'package:velowesalt/features/posts/presentation/pages/users/widgets/user_item_widget.dart';

class UserListView extends StatelessWidget {
  final List<UserEntity> users;
  const UserListView({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: ListView.separated(
          itemBuilder: (context, index) {
            final user = users[index];
            return UserItemWidget(
                imageThumbnail: user.thumbnailUrl,
                name: user.name,
                postCount: user.userPosts.length,
                userId: user.userId,
                image: user.url,
                onItemClick: () {
                  Navigator.pushNamed(context, NamedRouting.postPage,
                      arguments: PostArgument(
                          userName: user.name,
                          userId: user.userId,
                          bigPicture: user.url,
                          shortPicture: user.thumbnailUrl));
                });
          },
          separatorBuilder: (context, _) {
            return const SizedBox(
              height: 6,
            );
          },
          itemCount: users.length),
    );
  }
}
