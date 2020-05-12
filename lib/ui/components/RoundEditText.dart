import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nekxolivro/values/Palette.dart';

class RoundEditText extends StatefulWidget {
  String hintText = "", prefixText = "";
  TextInputType inputType = TextInputType.text;
  bool obscureText = false;
  TextEditingController controller = TextEditingController();

  RoundEditText(
      {this.hintText = "",
      this.inputType,
      this.obscureText,
      this.prefixText,
      this.controller});

  @override
  State createState() => RoundEditTextState(
      hintText, prefixText, inputType, obscureText, controller);
}

class RoundEditTextState extends State<RoundEditText> {
  String hintText = "", prefixText = "";
  TextInputType inputType = TextInputType.text;
  bool obscureText = false;
  bool canShowPrefix = false;
  TextEditingController controller = TextEditingController();

  RoundEditTextState(this.hintText, this.prefixText, this.inputType,
      this.obscureText, this.controller);

  @override
  Widget build(BuildContext context) {
    if (controller == null) controller = TextEditingController();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Palette.colorGrey,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: TextField(
        obscureText: this.obscureText == null ? false : this.obscureText,
        keyboardType: inputType,
        controller: controller,
        onChanged: (newValue) =>
            this.setState(() => canShowPrefix = newValue != ""),
        style: TextStyle(fontSize: 16, color: Palette.colorBlack),
        decoration: InputDecoration(
            prefixText:
                (canShowPrefix && prefixText != null) ? prefixText + "  " : "",
            prefixStyle: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Palette.colorSecondary),
            border: InputBorder.none,
            hintText: hintText != null ? hintText : ""),
      ),
    );
  }
}
