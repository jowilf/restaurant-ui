import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nekxolivro/values/Palette.dart';
import 'package:nekxolivro/values/Res.dart';
import 'package:nekxolivro/values/StringRes.dart';

class FoodView extends StatelessWidget {
  int index;

  FoodView({this.index=0});

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
              Card(
                elevation: 3,
                //margin: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    Res.login_back,
                    height: 70.0,
                    width: 70.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    "Mimi's Food $index",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Palette.colorBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 1),
                  Text("Cadjèhoun, Rue 605A",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Palette.greyText,
                      fontSize: 14,
                    )),
                  SizedBox(height: 1),
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
                        TextSpan(text: "  (1k+ avis)")
                      ])),
                  SizedBox(height: 1), Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Palette.colorPrimary
                    ),
                    child: Container(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        "-10%",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: StringRes.Avenir_Light,
                          fontWeight: FontWeight.bold),
                      ),
                    )),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
