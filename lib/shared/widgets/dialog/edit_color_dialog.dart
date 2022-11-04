import 'package:flutter/material.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/models/app_color.dart';
import 'package:schedule/shared/widgets/dialog/edit_dialog.dart';

class EditColorDialog extends StatefulWidget {
  const EditColorDialog({
    super.key,
    required this.onAction,
    required this.initialValue,
  });

  final AppColor initialValue;
  final Function(AppColor) onAction;

  @override
  State<EditColorDialog> createState() => _EditColorDialogState();
}

class _EditColorDialogState extends State<EditColorDialog> {
  List<AppColor> items = [
    AppColors.greenTea,
    AppColors.green,
    AppColors.azure,
    AppColors.lapis,
    AppColors.amethyst,
    AppColors.hotPink,
    AppColors.crimsone,
    AppColors.roseRed,
    AppColors.flameOrange,
    AppColors.merigold,
    AppColors.bumblebee,
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
      label: "Choose color",
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
            child: Center(
              child: Container(
                // width: 30,
                // height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // border: Border.all(color: ),
                  color: index == _pickedIndex ? items[index].muted : Colors.transparent,
                ),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: items[index].primary,
                    borderRadius: AppConfig.borderRadius50,
                  ),
                ),
              ),
            ),
          )),
        ),
      )      
    );
  }
}