import 'package:schedule/schedule/models/lesson.dart';

class UpdateCurrentLessonAction {
  const UpdateCurrentLessonAction(this.lesson);

  final Lesson? lesson;
}