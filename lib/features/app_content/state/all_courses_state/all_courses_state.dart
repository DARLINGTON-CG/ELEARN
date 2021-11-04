part of "all_courses_bloc.dart";

abstract class AllCoursesState extends Equatable {
   final List<CourseModel> courses;
  const AllCoursesState({required this.courses});

  @override
  List<Object> get props => [courses];
}

class AllCoursesLoading extends AllCoursesState {
  AllCoursesLoading() : super(courses: []);

}

class AllCoursesLoadingFailure extends AllCoursesState{
  AllCoursesLoadingFailure() : super(courses: []);

}

class AllCoursesLoaded extends AllCoursesState {
  final List<CourseModel> courses;

  AllCoursesLoaded({required this.courses}):super(courses: courses);
}
