import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_learn/features/user/data/models/user_model.dart';
import 'package:e_learn/features/user/data/repositories/authentication_repository.dart';

import 'app_event.dart';
import 'app_state.dart';



class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(
         AppState.unauthenticated(),
        ) {
   <AppUserChanged>()=>_onUserChanged;
   <AppLogoutRequested>()=>(_onLogoutRequested);
    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(AppUserChanged(user)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<UserModel> _userSubscription;

  void _onUserChanged(AppUserChanged event, AppState emit) {
    event.user.isNotEmpty
        ? AppState.authenticated(event.user)
        : const AppState.unauthenticated();
  }

  void _onLogoutRequested(AppLogoutRequested event, AppState emit) {
    unawaited(_authenticationRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  } 

  @override
  Stream<AppState> mapEventToState(AppEvent event) {
    throw UnimplementedError();
  }
}
