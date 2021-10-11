import 'package:e_learn/features/user/data/data_sources/email.dart';
import 'package:e_learn/features/user/data/repositories/authentication_repository.dart';
import 'package:e_learn/features/user/presentation/cubit_password_reset/reset_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ResetCubit extends Cubit<ResetState> {
  final AuthenticationRepository authenticationRepository;

  ResetCubit(this.authenticationRepository)
      : super(ResetState(status: FormzStatus.pure, email: Email.pure()));

  Future<void> sendResetRequest() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await authenticationRepository.resetPassword(email: state.email.value);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      print("Success");
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
      print("Failure");
    }
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email]),
    ));
  }
}
