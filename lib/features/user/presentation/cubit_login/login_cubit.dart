import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../data/data_sources/email.dart';
import '../../data/data_sources/password.dart';
import '../../data/repositories/authentication_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository authenticationRepository;

  LoginCubit(this.authenticationRepository)
      : super(LoginState(
            status: FormzStatus.pure,
            email: Email.pure(),
            password: Password.pure()));

  Future<void> logInWithCredentials() async {
    print("\nLog in with email and password\n");
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await authenticationRepository.login(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      print("\n\nSuccess\n\n");
      
    } catch (_) {
      print("\n\nFailure\n\n");
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final email = Email.dirty(state.email.value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([email, password]),
    ));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    final password = Password.dirty(state.password.value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, password]),
    ));
  }
}
