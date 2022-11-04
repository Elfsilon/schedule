import 'package:flutter/material.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/widgets/dialog/edit_dialog.dart';

class EditIconDialog extends StatefulWidget {
  const EditIconDialog({
    super.key,
    required this.onAction,
    required this.initialValue,
  });

  final IconData initialValue;
  final Function(IconData) onAction;

  @override
  State<EditIconDialog> createState() => _EditIconDialogState();
}

class _EditIconDialogState extends State<EditIconDialog> {
  List<IconData> items = [
    Icons.bug_report_rounded, 
    Icons.text_snippet_rounded, 
    Icons.play_lesson_rounded,
    Icons.home_rounded,
    Icons.attach_money_rounded,
    Icons.phone_rounded,
    Icons.work_rounded,
  ];
  late int _pickedIndex;

  @override
  void initState() {
    _pickedIndex = items.indexOf(widget.initialValue);
    super.initState();
  }

  void onTap(int index) {
    setState(() {
      _pickedIndex = index;
    }); 
  }

  void _close(BuildContext context) {
    Navigator.pop(context);
  }

  void _handleAction(BuildContext context) {
    widget.onAction(items[_pickedIndex]);
    _close(context);
  }

  @override
  Widget build(BuildContext context) {
    return EditDialog(
      label: "Choose icon",
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
        child: GridView.count(
          crossAxisCount: 4,
          children: List.generate(items.length, (index) => GestureDetector(
            onTap: () => onTap(index),
            child: _IconWidget(
              icon: items[index],
              picked: index == _pickedIndex, 
            ),
          )),
        ),
      )
    );
  }
}

class _IconWidget extends StatelessWidget {
  const _IconWidget({
    super.key,
    required this.icon,
    required this.picked,
  });

  final bool picked;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConfig.s16),
      child: Icon(
        icon, 
        size: AppConfig.s32,
        color: picked ? AppColors.merigold.primary : AppColors.fgDark.primary
      ),
    );
  }
}