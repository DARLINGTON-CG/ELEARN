import 'dart:ffi';

import 'package:equatable/equatable.dart';

class CourseModel extends Equatable {
  final Map<String, dynamic> courseHeader;
  final Array courseContent;
  CourseModel({required this.courseHeader, required this.courseContent});

  factory CourseModel.fromJson(Map<String, dynamic> response) {
    return CourseModel(
        courseHeader: response['course_header'],
        courseContent: response['course_content']);
  }

  @override
  List<Object?> get props => [];
}
