import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velowesalt/core/util/route/named_routing.dart';
import 'package:velowesalt/features/posts/data/models/post_argument.dart';
import 'package:velowesalt/features/posts/presentation/bloc/posts/posts_cubit.dart';
import 'package:velowesalt/features/posts/presentation/bloc/users/users_cubit.dart';
import 'package:velowesalt/features/posts/presentation/pages/posts/posts_page.dart';
import 'package:velowesalt/features/posts/presentation/pages/users/users_page.dart';

import '../../../locator.dart';

class GeneralRouter {
  static Map<String, WidgetBuilder> pages = {
    NamedRouting.userPage: (context) => BlocProvider(
          create: (context) => locator<UsersCubit>(),
          child: const UsersPage(),
        ),
    NamedRouting.postPage: (context) => BlocProvider(
          create: (context) => locator<PostsCubit>(),
          child: PostsPage(
              ModalRoute.of(context)!.settings.arguments as PostArgument),
        )
  };
}
