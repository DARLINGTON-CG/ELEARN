import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabCubit extends Cubit<TabCubitState> {
  TabCubit() : super(TabCubitState(0));

  void readTab(int index) {
    emit(state.copyWith(activeIndex: index));
  }

  int currentTab() {
    return state.activeIndex;
  }
}

class TabCubitState extends Equatable {
  final int activeIndex;

  TabCubitState(this.activeIndex);

  TabCubitState copyWith({required int activeIndex}) {
    return TabCubitState(activeIndex);
  }

  @override
  List<Object?> get props => [activeIndex];
}
