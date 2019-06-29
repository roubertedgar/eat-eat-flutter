import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  final String labelText;
  final String initialValue;
  final bool isEnabled;
  final EdgeInsets padding;
  final FocusNode focusNode;
  final bool autoFocus;
  final TextEditingController controller;

  EditText(
      {Key key,
      @required this.labelText,
      this.initialValue,
      this.isEnabled = true,
      this.autoFocus = false,
      this.focusNode,
      this.controller,
      this.padding = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        initialValue: initialValue,
        enabled: isEnabled,
        autofocus: autoFocus,
        focusNode: focusNode,
        controller: controller,
        decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(3.0)))),
      ),
    );
  }
}
