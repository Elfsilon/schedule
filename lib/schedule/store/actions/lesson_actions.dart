import 'package:schedule/schedule/models/lesson.dart';

class CreateLessonAction {
  const CreateLessonAction(this.lesson);

  final Lesson lesson;
}

class UpdateLessonAction {
  const UpdateLessonAction(this.lesson);

  final Lesson lesson;
}

class RemoveLessonAction {
  RemoveLessonAction(this.id);

  final int id;
}