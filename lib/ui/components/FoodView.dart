import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nekxolivro/values/Palette.dart';
import 'package:nekxolivro/values/Res.dart';
import 'package:nekxolivro/values/StringRes.dart';

class FoodView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => null,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  Res.login_back,
                  height: 70.0,
                  width: 70.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Kellys Cafe and Espresso",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Palette.colorBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("882 Swift Courts Apt. 918",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Palette.greyText,
                        fontSize: 14,
                      )),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Palette.greyText,
                              fontSize: 13,
                              fontFamily: StringRes.Avenir_Light),
                          children: [
                        WidgetSpan(
                            child: Container(
                          padding: EdgeInsets.all(2),
                          child: Icon(
                            Icons.star,
                            color: Palette.colorSecondary,
                            size: 12,
                          ),
                        )),
                        TextSpan(
                            text: "4.8",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Palette.colorBlack)),
                        TextSpan(text: "  (233 avis)")
                      ]))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
