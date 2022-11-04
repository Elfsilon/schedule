import 'package:flutter/material.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/models/app_color.dart';

enum LessonType { lecture, seminar, lab, online }

class Lesson {
  const Lesson({
    required this.id,
    required this.title,
    required this.color,
    required this.icon,
    this.description,
    this.professor,
    this.auditory,
    this.type = LessonType.lecture,
    this.pinned = false,
  });

  final int id;
  final String title;
  final String? description;
  final String? professor;
  final String? auditory;
  final AppColor color;
  final IconData icon;
  final LessonType type;
  final bool pinned;

  factory Lesson.fromMap(Map<String, dynamic> map) {
    final mapColorName = map["color_name"] as String;
    final color = AppColors.getAppColorByName(mapColorName);

    final mapIconCode = map["icon_code"] as int;
    final icon = IconData(mapIconCode, fontFamily: 'MaterialIcons');

    return Lesson(
      id: map["id"] as int,
      title: map["title"] as String, 
      description: map["description"] as String?, 
      professor: map["professor"] as String?, 
      auditory: map["auditory"] as String?, 
      pinned:  map["pinned"] as bool,
      type: LessonType.values.byName(map["type_name"] as String),    
      icon: icon,
      color: color,
    );
  } 

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "description": description,
    "professor": professor,
    "auditory": auditory,
    "pinned": pinned,
    "color_name": color.name,
    "icon_code": icon.codePoint,
    "type_name": type.name,
  };
}

extension LessonMutable on Lesson {
  Lesson update({
    String? title,
    String? description,
    String? professor,
    String? auditory,
    AppColor? color,
    IconData? icon,
    LessonType? type,
    bool? pinned,
  }) => Lesson(
    id: id, 
    title: title ?? this.title,
    color: color ?? this.color, 
    icon: icon ?? this.icon,
    professor: professor ?? this.professor,
    auditory: auditory ?? this.auditory,
    description: description ?? this.description,
    pinned: pinned ?? this.pinned,
    type: type ?? this.type,
  );
}