import 'package:flutter/material.dart';
import 'package:schedule/schedule/models/lesson.dart';
import 'package:schedule/shared/models/app_color.dart';
import 'package:schedule/shared/widgets/dialog/attach_lesson_dialog.dart';
import 'package:schedule/shared/widgets/dialog/edit_color_dialog.dart';
import 'package:schedule/shared/widgets/dialog/edit_icon_dialog.dart';
import 'package:schedule/shared/widgets/dialog/edit_text_dialog.dart';
import 'package:schedule/shared/widgets/dialog/edit_type_dialog.dart';
import 'package:schedule/shared/widgets/dialog/fullscreen_dialog.dart';

void showCustomDialog(BuildContext context, { 
  required String title,
  required String actionName,
  required AppColor color,
  String? description,
  Function()? onAction,
}) {
  showDialog(
    context: context, 
    barrierDismissible: false,
    builder: (context) => FullscreenDialog(
      title: title, 
      actionName: actionName, 
      color: color, 
      description: description,
      onAction: onAction,
    ),
  );
}

void showEditTextDialog(BuildContext context, {
  required String label,
  required String? description,
  required String initialValue, 
  required Function(String?) onAction,
  bool nullable = false,
}) {
  showDialog(
    context: context, 
    barrierDismissible: false,
    builder: (context) {
      return EditTextDialog(
        initialValue: initialValue,
        label: label, 
        description: description,
        nullable: nullable,
        onAction: onAction,
      );
    }, 
  );
}

void showEditTypeDialog(BuildContext context, {
  required LessonType initialValue, 
  required Function(LessonType) onAction,
}) {
  showDialog(
    context: context, 
    barrierDismissible: false,
    builder: (context) {
      return EditTypeDialog(
        initialValue: initialValue,
        onAction: onAction,
      );
    }, 
  );
}

void showEditIconDialog(BuildContext context, {
  required IconData initialValue, 
  required Function(IconData) onAction,
}) {
  showDialog(
    context: context, 
    barrierDismissible: false,
    builder: (context) {
      return EditIconDialog(
        initialValue: initialValue,
        onAction: onAction,
      );
    }, 
  );
}

void showEditColorDialog(BuildContext context, {
  required AppColor initialValue, 
  required Function(AppColor) onAction,
}) {
  showDialog(
    context: context, 
    barrierDismissible: false,
    builder: (context) {
      return EditColorDialog(
        initialValue: initialValue,
        onAction: onAction,
      );
    }, 
  );
}

void showAttachLessonDialog(BuildContext context, {
  required int? initialValue, 
  required Function(int?) onAction,
}) {
  showDialog(
    context: context, 
    barrierDismissible: false,
    builder: (context) {
      return AttachLessonDialog(
        initialValue: initialValue,
        onAction: onAction,
      );
    }, 
  );
}
