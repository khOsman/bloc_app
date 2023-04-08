import 'package:bloc_app/cubit/user_cubit.dart';
import 'package:bloc_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserCubit>().getAllUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserStateLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.cyanAccent,
              ),
            );
          } else if (state is UserStateError) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is UserStateLoaded) {
            return ListView.builder(
              itemCount: state.userList.length,
              itemBuilder: (context, index) {
                UserModel userModel = state.userList[index];
                return ListTile(
                  leading: CircleAvatar(
                    foregroundImage: NetworkImage(
                        'https://xsgames.co/randomusers/assets/avatars/${index%2==0?'male':'female'}/$index.jpg'),
                  ),
                  title: Text(userModel.name.toString()),
                );
              },
            );
          } else {
            return SizedBox(
              child: Center(child: Text('Something went wrong')),
            );
          }
        },
      ),
    );
  }
}
