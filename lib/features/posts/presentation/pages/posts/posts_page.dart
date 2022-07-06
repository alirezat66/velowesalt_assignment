import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velowesalt/core/share_widgets/loading_widget.dart';
import 'package:velowesalt/features/posts/data/models/post_argument.dart';
import 'package:velowesalt/features/posts/presentation/bloc/posts/posts_cubit.dart';
import 'package:velowesalt/features/posts/presentation/pages/posts/widget/posts_listview.dart';

class PostsPage extends StatefulWidget {
  final PostArgument argument;
  const PostsPage(this.argument, {Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    context.read<PostsCubit>().getUserPosts(widget.argument.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: ((context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200,
              floating: false,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              )),
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Hero(
                    tag: widget.argument.userId,
                    child: Text(
                      "${widget.argument.userName}'s Posts",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  background: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    child: Hero(
                      tag: widget.argument.bigPicture,
                      child: Image.network(
                        widget.argument.bigPicture,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
            ),
          ];
        }),
        body: BlocBuilder<PostsCubit, PostsState>(
          builder: (context, state) {
            if (state is PostsLoaded) {
              return PostsListView(posts: state.posts);
            } else if (state is PostsLoadingFailed) {
              return Center(
                child: Text(state.error),
              );
            } else {
              return const LoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
