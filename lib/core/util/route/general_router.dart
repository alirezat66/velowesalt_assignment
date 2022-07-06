import 'dart:js';

import 'package:flutter/widgets.dart';
import 'package:velowesalt/core/util/route/named_routing.dart';
import 'package:velowesalt/features/posts/presentation/pages/users/users_page.dart';

class GeneralRouter {
  static Map<String, WidgetBuilder> pages = {
    NamedRouting.userPage: (context) => const UsersPage()
  };
}
