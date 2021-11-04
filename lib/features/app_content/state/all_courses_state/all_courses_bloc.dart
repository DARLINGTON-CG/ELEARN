import 'dart:async';

import 'package:e_learn/features/app_content/models/course_model.dart';
import 'package:e_learn/features/app_content/repository/course_repo_abstract.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'all_courses_state.dart';
part 'all_courses_event.dart';

class AllCoursesBloc extends Bloc<AllCoursesEvent, AllCoursesState> {
  final CourseRepository courseRepository;
  StreamSubscription<List<CourseModel>>? _courseSubscription;
  AllCoursesBloc({required this.courseRepository}) : super(AllCoursesLoading());

  @override
  Future<void> close() {
    _courseSubscription?.cancel();
    return super.close();
  }

  @override
  Stream<AllCoursesState> mapEventToState(AllCoursesEvent event) async* {
    if (event is OnLoadingStarted) {
      yield* _onLoadingStarted(event);
    } else if (event is OnLoadingSuccess) {
      yield* _onLoadingSuccess(event);
    }
  }

  Stream<AllCoursesState> _onLoadingStarted(AllCoursesEvent event) async* {
    yield AllCoursesLoading();
    _courseSubscription?.cancel();
    _courseSubscription = courseRepository
        .getCourses()
        .listen((list) => add(OnLoadingSuccess(courses: list)));
  }

  Stream<AllCoursesState> _onLoadingSuccess(OnLoadingSuccess event) async* {
    yield AllCoursesLoaded(courses: event.courses);
  }
}
