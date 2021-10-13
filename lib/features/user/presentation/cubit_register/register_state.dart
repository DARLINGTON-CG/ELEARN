import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../data/data_sources/confirmed_password.dart';
import '../../data/data_sources/email.dart';
import '../../data/data_sources/password.dart';

enum ConfirmPasswordValidationError { invalid }

class RegisterState extends Equatable {
  const RegisterState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.status = FormzStatus.pure,
  });

  final Email email;
  final Password password;
  final ConfirmedPassword confirmedPassword;
  final FormzStatus status;

  @override
  List<Object> get props => [email, password, confirmedPassword, status];

  RegisterState copyWith({
    Email? email,
    Password? password,
    ConfirmedPassword? confirmedPassword,
    FormzStatus? status,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      status: status ?? this.status,
    );
  }
}
