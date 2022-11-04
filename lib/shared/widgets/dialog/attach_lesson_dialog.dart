import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:schedule/schedule/models/lesson.dart';
import 'package:schedule/schedule/presentation/widgets/lesson_widget.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/models/app_state.dart';
import 'package:schedule/shared/widgets/dialog/edit_dialog.dart';

class AttachLessonDialog extends StatefulWidget {
  const AttachLessonDialog({
    super.key,
    required this.onAction,
    required this.initialValue,
  });

  final int? initialValue;
  final Function(int?) onAction;

  @override
  State<AttachLessonDialog> createState() => _AttachLessonDialogState();
}

class _AttachLessonDialogState extends State<AttachLessonDialog> {
  late int? _selectedId;

  @override
  void initState() {
    _selectedId = widget.initialValue;
    super.initState();
  }

  void onSelectedChanged(int? id) {
    setState(() {
      _selectedId = id;
    }); 
  }

  void _close(BuildContext context) {
    Navigator.pop(context);
  }

  void _handleAction(BuildContext context) {
    widget.onAction(_selectedId);
    _close(context);
  }

  @override
  Widget build(BuildContext context) {
    return EditDialog(
      label: "Attach lesson",
      description: "Some description", 
      onAction: () => _handleAction(context), 
      onClose: () => _close(context), 
      child: Container(
        width: double.infinity,
        height: 260,
        decoration: BoxDecoration(
          color: AppColors.bgDark.primary,
          borderRadius: AppConfig.borderRadius12,
        ),
        child: StoreConnector<AppState, List<Lesson>>(
          converter: (store) => store.state.lessons.items,
          builder: (context, lessons) {
            return ListView.separated(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => index == 0 ? onSelectedChanged(null) : onSelectedChanged(lessons[index - 1].id),
                child: _ListItem(
                  data: index == 0 ? null : lessons[index - 1],
                  selected: index == 0 
                    ? _selectedId == null
                    : lessons[index - 1].id == _selectedId, 
                ),
              ), 
              separatorBuilder: (context, index) => AppConfig.divider, 
              itemCount: lessons.length + 1,
            );
          }, 
        ),
      )
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    super.key,
    required this.data,
    required this.selected,
  });

  final bool selected;
  final Lesson? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: AppConfig.s4),
      decoration: BoxDecoration(
        color: selected ? AppColors.fgDark.primary : Colors.transparent,
      ),
      child: data == null 
        ? SizedBox(
          height: 60,
          child: Center(
            child: Text("Empty", style: Theme.of(context).textTheme.bodySmall),
          ), 
        ) 
        : LessonWidget(data: data!),
    );
  }
}