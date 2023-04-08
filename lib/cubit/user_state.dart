part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitialState extends UserState {
  @override
  List<Object> get props => [];
}

class UserStateLoading extends UserState {
  @override
  List<Object?> get props => [];
}

class UserStateLoaded extends UserState {
  List<UserModel> userList;

  UserStateLoaded({required this.userList});

  @override
  List<Object?> get props {
    return [userList];
  }
}

class UserStateError extends UserState {
  String errorMessage;

  UserStateError({required this.errorMessage});

  @override
  List<Object?> get props => [];
}
