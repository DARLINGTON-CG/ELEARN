import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../data/data_sources/email.dart';
import '../../data/data_sources/password.dart';

class LoginState extends Equatable {
  final Email email;
  final Password password;
  final FormzStatus status;

  const LoginState({required this.email,required this.password,required this.status});

  LoginState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [email,password,status];
}
