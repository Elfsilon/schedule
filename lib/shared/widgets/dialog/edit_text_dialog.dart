import 'package:flutter/material.dart';
import 'package:schedule/shared/widgets/dialog/edit_dialog.dart';

class EditTextDialog extends StatefulWidget {
  const EditTextDialog({
    super.key,
    required this.label,
    required this.onAction,
    required this.initialValue,
    this.description,
    this.nullable = false,
  });

  final String label;
  final String? description;
  final String initialValue;
  final bool nullable;
  final Function(String?) onAction;

  @override
  State<EditTextDialog> createState() => _EditTextDialogState();
}

class _EditTextDialogState extends State<EditTextDialog> {
  late TextEditingController _controller;
  String? _error;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? _validate(String text) {
    if (text.isEmpty && !widget.nullable) return 'Can\'t be empty';
    return null;
  }

  void onTextChanged(String value) {
    setState(() {
      _error = _validate(value);
    });    
  }

  void _close(BuildContext context) {
    Navigator.pop(context);
  }

  void _handleAction(BuildContext context) {
    widget.onAction(_controller.text);
    _close(context);
  }

  @override
  Widget build(BuildContext context) {
    return EditDialog(
      label: widget.label, 
      description: widget.description,
      onAction: _error == null ? () => _handleAction(context) : null, 
      onClose: () => _close(context), 
      child: TextField(
        controller: _controller,
        onChanged: onTextChanged,
        decoration: InputDecoration(
          errorText: _error,
        ),
      ),
    );
  }
}