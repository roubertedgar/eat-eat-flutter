import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight fontWeight;
  final EdgeInsets padding;

  TextView(this.text,
      {this.textSize: 14.00,
      this.fontWeight: FontWeight.normal,
      this.padding: EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: this.padding,
      child: Text(
        this.text,
        style: TextStyle(fontSize: this.textSize, fontWeight: this.fontWeight),
      ),
    );
  }
}
