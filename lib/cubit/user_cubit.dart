import 'package:bloc/bloc.dart';
import 'package:bloc_app/models/user_model.dart';
import 'package:bloc_app/service/api_service.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  List<UserModel> userList = [];
  APIService apiService;

  UserCubit({required this.apiService}) : super(UserInitialState());

  void getAllUserList() async {
    try {
      emit(UserStateLoading());
      userList = await apiService.getData();
      emit(UserStateLoaded(userList: userList));
    } catch (e) {
      emit(UserStateError(errorMessage: e.toString()));
    }
  }
}
