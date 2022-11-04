import 'package:schedule/schedule/models/lesson.dart';

class LessonList {
  const LessonList(this.items);

  final List<Lesson> items;

  factory LessonList.fromMap(List<dynamic> map) => LessonList(
    map.map<Lesson>((e) => Lesson.fromMap(e)).toList(),
  );

  List<dynamic> toMap() => items.map((e) => e.toMap()).toList();
}

extension LessonListMutable on LessonList {
  LessonList addItem(Lesson lesson) {
    final updated = [...items, lesson];
    return LessonList(updated);
  }
  
  LessonList removeItem(int id) {
    final updated = items.where((element) => element.id != id).toList();
    return LessonList(updated);
  }

  LessonList updateItem(Lesson lesson) {
    final updated = items.map((e) => e.id == lesson.id ? lesson : e).toList();
    return LessonList(updated);
  }

  Lesson? getItem(int id) {
    try {
      final item = items.firstWhere((element) => element.id == id);
      return item;
    } catch (e) {
      return null;
    }
  }
}