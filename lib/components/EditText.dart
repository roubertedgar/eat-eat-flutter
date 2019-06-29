import 'package:flutter/material.dart';

class EditText extends StatelessWidget {
  final String labelText;
  final String initialValue;
  final bool isEnabled;
  final EdgeInsets padding;

  EditText(
      {Key key,
        this.initialValue,
        this.labelText = "",
        this.isEnabled = true,
        this.padding = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
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
