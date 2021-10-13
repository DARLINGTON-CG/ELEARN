import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../data/data_sources/email.dart';

class ResetState extends Equatable {
  final Email email;
  final FormzStatus status;

  const ResetState({required this.email, required this.status});

  ResetState copyWith({
    Email? email,
    FormzStatus? status,
  }) {
    return ResetState(
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [email, status];
}
