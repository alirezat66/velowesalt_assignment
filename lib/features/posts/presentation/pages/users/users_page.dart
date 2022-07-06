import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velowesalt/core/share_widgets/loading_widget.dart';
import 'package:velowesalt/features/posts/presentation/bloc/users/users_cubit.dart';
import 'package:velowesalt/features/posts/presentation/pages/users/widgets/users_listview.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    context.read<UsersCubit>().getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersLoaded) {
            return UserListView(users: state.users);
          } else if (state is UsersLoadingFailed) {
            return Center(child: Text(state.error));
          } else {
            return const LoadingWidget();
          }
        },
      )),
    );
  }
}
