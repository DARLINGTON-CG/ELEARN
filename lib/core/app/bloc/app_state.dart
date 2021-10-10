import 'package:e_learn/features/user/data/models/user_model.dart';
import 'package:equatable/equatable.dart';


enum AppStatus {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.user = UserModel.empty,
  });

  const AppState.authenticated(UserModel user)
      : this._(status: AppStatus.authenticated, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  final AppStatus status;
  final UserModel user;

  @override
  List<Object> get props => [status, user];
}
