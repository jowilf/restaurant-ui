import 'package:flutter/material.dart';
import 'package:nekxolivro/values/Palette.dart';

class JDivider extends StatelessWidget {
  double height;

  JDivider({this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 1,
      child: Container(
        color: Colors.grey.shade300,
      ),
    );
  }
}
