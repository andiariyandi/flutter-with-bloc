import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearningapps/pages/register/bloc/register_events.dart';
import 'package:ulearningapps/pages/register/bloc/register_states.dart';

class RegisterBlocs extends Bloc<RegisterEvent, RegisterStates> {
  RegisterBlocs() : super(const RegisterStates()) {
    on<UserNameEvent>(_userNameEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(userName: event.userName));
  }
}
