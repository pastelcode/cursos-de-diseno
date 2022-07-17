import 'package:curso_de_diseno/data/repositories/shared_preferences_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../entities/user.dart';

typedef UserState = User?;

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(null);

  bool get isLoggedIn => state is User ? true : false;
  String? get name => state?.name;

  login({required String name}) {
    SharedPreferencesRepository.setString(key: 'user-name', value: name);
    final user = User(
      name: name,
    );
    emit(user);
  }

  void checkForLoggedInUser() {
    final userName = SharedPreferencesRepository.getString(key: 'user-name');
    if (userName is String) {
      login(name: userName);
    } else {
      emit(null);
    }
  }
}
