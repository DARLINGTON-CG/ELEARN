part of 'all_courses_bloc.dart';

abstract class AllCoursesEvent extends Equatable {
  const AllCoursesEvent();

  @override
  List<Object> get props => [];
}

class OnLoadingStarted extends AllCoursesEvent
{

}

class OnLoadingFailure extends AllCoursesEvent
{

}

class OnLoadingSuccess extends AllCoursesEvent
{
    final List<CourseModel> courses;
     OnLoadingSuccess({required this.courses});
}