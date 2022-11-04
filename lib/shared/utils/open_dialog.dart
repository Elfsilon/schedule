import 'package:flutter/material.dart';
import 'package:schedule/shared/utils/show_snackbar.dart';

typedef DialogFn<T> = Function(BuildContext, T);

void openDialog<T>(BuildContext context, T? value, DialogFn<T> dialogFn) {
    if (value == null) {
      return showCustomSnackBar(context, "InternalError");
    }
    dialogFn(context, value);
  }
