import 'package:flutter/cupertino.dart';
import 'package:nekxolivro/values/Palette.dart';

class Styles {
  static const hugeBlueBlackTitle = TextStyle(
      color: Palette.colorBlueBlack, fontFamily: "Avenir-Heavy", fontSize: 30);
 static const mediumBlueBlackTitle = TextStyle(
      color: Palette.colorBlueBlack, fontFamily: "Avenir-Heavy", fontSize: 20);
  static const smallTextGrey = TextStyle(color: Palette.greyText, fontSize: 15);
  static const smallTextGreyBold = TextStyle(color: Palette.greyText, fontSize: 15,fontWeight: FontWeight.bold);
  static const priceStyle = TextStyle(color: Palette.colorBlue, fontSize: 16,fontWeight: FontWeight.bold);
}
