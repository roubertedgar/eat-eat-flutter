import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  final String labelText;
  final String initialValue;
  final bool isEnabled;
  final EdgeInsets padding;
  final FocusNode focusNode;
  final bool autoFocus;

  EditText({Key key,
    @required this.labelText,
    this.initialValue,
    this.isEnabled = true,
    this.focusNode,
    this.autoFocus = false,
    this.padding = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        autofocus: autoFocus,
        focusNode: focusNode,
        enabled: isEnabled,
        initialValue: initialValue,
        decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(3.0)))),
      ),
    );
  }
}
