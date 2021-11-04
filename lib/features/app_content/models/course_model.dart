import 'package:equatable/equatable.dart';

class CourseModel extends Equatable {
  final String courseName;
  final String courseUrl;
  final String courseContent;

  CourseModel({required this.courseName, required this.courseUrl,required this.courseContent});

  factory CourseModel.fromJson(Map<String, dynamic> response) {
    return CourseModel(
        courseName: response['course_header']['course_name'], courseUrl: response['course_header']['course_url'],courseContent: response["course_content"]
        
        );
  }

//Todo work on this model when sending data
  Map<String, Object?> toJson() {
    return {
      'course_name': courseName,
      'course_url': courseUrl,
      'course_content': courseContent
    };
  }

  @override
  List<Object?> get props => [];
}
