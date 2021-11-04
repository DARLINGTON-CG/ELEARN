import '../models/course_model.dart';

abstract class CourseRepository {
  Stream<List<CourseModel>> getCourses();
}
