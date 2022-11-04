import 'package:flutter/material.dart';
import 'package:schedule/schedule/presentation/widgets/edit_content_button/edit_content_button.dart';
import 'package:schedule/shared/constants/config.dart';
import 'package:schedule/shared/models/app_color.dart';

class EditColorContentButton extends StatelessWidget {
  const EditColorContentButton({
    super.key,
    required this.color,
    required this.onPressed,
  });

  final AppColor color;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return EditContentButton(
      title: "Color",
      content: color.name,
      nullable: false,
      onPressed: onPressed, 
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: color.primary,
          borderRadius: AppConfig.borderRadius50
        ),
      ),
    );    
  }
}