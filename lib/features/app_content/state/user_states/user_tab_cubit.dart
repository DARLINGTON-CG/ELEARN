import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserTabCubit extends Cubit<UserTabCubitState> {
  UserTabCubit() : super(UserTabCubitState(0));

  void readTab(int index) {
    emit(state.copyWith(activeIndex: index));
  }

  int currentTab() {
    return state.activeIndex;
  }
}

class UserTabCubitState extends Equatable {
  final int activeIndex;

  UserTabCubitState(this.activeIndex);

  UserTabCubitState copyWith({required int activeIndex}) {
    return UserTabCubitState(activeIndex);
  }

  @override
  List<Object?> get props => [activeIndex];
}
