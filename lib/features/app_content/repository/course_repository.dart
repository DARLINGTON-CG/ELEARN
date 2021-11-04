import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/course_model.dart';

import 'course_repo_abstract.dart';

class FirebaseCourseRepository implements CourseRepository {
  final _courseCollection = FirebaseFirestore.instance.collection("course");

  @override
 Stream<List<CourseModel>> getCourses()  {
    return _courseCollection
        .snapshots()
        .map((querysnaps) => querysnaps.docs.map((doc) {
              final docData = doc.data();
              return CourseModel.fromJson(docData);
            }).toList());
  }
}
