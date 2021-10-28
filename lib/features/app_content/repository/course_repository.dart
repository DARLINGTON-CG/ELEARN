import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learn/features/app_content/models/course_model.dart';
import 'package:equatable/equatable.dart';

class CourseRepository extends Equatable {
  // Future<void> getCourseFromFirebase() async {
  //   final courseCollection =
  //       await FirebaseFirestore.instance.collection('course').
  //       withConverter(fromFirestore:(snapshots,_)=> CourseModel.fromJson(snapshots.data()!),
  //                     toFirestore: (course,_) => course.toJson());
        
  //   print(courseCollection);
  // }

  @override
  List<Object?> get props => [];
}
