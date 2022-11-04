import 'package:flutter/material.dart';
import 'package:schedule/schedule/models/lesson.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/widgets/dialog/edit_dialog.dart';
import 'package:schedule/shared/extensions/string_extensions.dart';

class EditTypeDialog extends StatefulWidget {
  const EditTypeDialog({
    super.key,
    required this.onAction,
    required this.initialValue,
  });

  final LessonType initialValue;
  final Function(LessonType) onAction;

  @override
  State<EditTypeDialog> createState() => _EditTypeDialogState();
}

class _EditTypeDialogState extends State<EditTypeDialog> {
  List<LessonType> types = [LessonType.lab, LessonType.lecture, LessonType.online, LessonType.seminar];
  late int _pickedTypeIndex;

  @override
  void initState() {
    _pickedTypeIndex = types.indexOf(widget.initialValue);
    super.initState();
  }

  void onTypeChanged(int index) {
    setState(() {
      _pickedTypeIndex = index;
    }); 
  }

  void _close(BuildContext context) {
    Navigator.pop(context);
  }

  void _handleAction(BuildContext context) {
    widget.onAction(types[_pickedTypeIndex]);
    _close(context);
  }

  @override
  Widget build(BuildContext context) {
    return EditDialog(
      label: "Choose type",
      description: "Some description", 
      onAction: () => _handleAction(context), 
      onClose: () => _close(context), 
      child: Container(
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          color: AppColors.bgDark.primary,
          borderRadius: AppConfig.borderRadius12,
        ),
        child: ListView.separated(
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => onTypeChanged(index),
            child: _ListItem(
              name: types[index].name,
              picked: index == _pickedTypeIndex, 
            ),
          ), 
          separatorBuilder: (context, index) => AppConfig.divider, 
          itemCount: types.length,
        ),
      )
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    super.key,
    required this.name,
    required this.picked,
  });

  final bool picked;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppConfig.s12, vertical: AppConfig.s16),
      decoration: BoxDecoration(
        color: picked ? AppColors.fgDark.primary : Colors.transparent,
      ),
      child: Text(name.capitalize()),
    );
  }
}