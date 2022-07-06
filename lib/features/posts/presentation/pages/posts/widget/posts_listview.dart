import 'package:flutter/material.dart';
import 'package:velowesalt/features/posts/presentation/pages/posts/widget/post_item.dart';

import '../../../../domain/entities/user_entity.dart';

class PostsListView extends StatelessWidget {
  final List<Post> posts;
  const PostsListView({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
          itemBuilder: (_, index) {
            return PostItemWidget(
                title: posts[index].title, body: posts[index].body);
          },
          separatorBuilder: (_, __) {
            return const SizedBox(
              height: 8,
            );
          },
          itemCount: posts.length),
    );
  }
}
