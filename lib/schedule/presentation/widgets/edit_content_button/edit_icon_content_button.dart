import 'package:flutter/material.dart';
import 'package:schedule/schedule/presentation/widgets/edit_content_button/edit_content_button.dart';
import 'package:schedule/shared/constants/config.dart';

class EditIconContentButton extends StatelessWidget {
  const EditIconContentButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return EditContentButton(
      title: "Icon",
      content: "Icon name",
      nullable: false,
      onPressed: onPressed, 
      child: Icon(
        icon, 
        color: AppColors.fgMid.primary
      ),
    );
  }
}