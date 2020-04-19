import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nekxolivro/values/Palette.dart';
import 'package:nekxolivro/values/StringRes.dart';
import 'package:nekxolivro/values/Styles.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: InkWell(
                    onTap: ()=>null,
                    child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Livré à",
                        style: TextStyle(color: Palette.greyText, fontSize: 16,fontFamily: StringRes.Avenir_Heavy),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: RichText(
                            text: TextSpan(
                                text: "Chez Moi ",
                                style: Styles.mediumBlueBlackTitle,
                                children: [
                              WidgetSpan(
                                  child: RotatedBox(
                                      quarterTurns: 1,
                                      child: Icon(
                                        CupertinoIcons.right_chevron,
                                        color: Palette.colorPrimary,
                                      )))
                            ])),
                      )
                    ],
                ),
              ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 5, right: 10),
                child: ClipOval(
                  child: Material(
                    color: Palette.colorGrey, // button color
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.person,
                          color: Palette.colorPrimary,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Material(
                    color: Palette.colorGrey,
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            style: TextStyle(
                              color: Palette.greyText,
                              fontFamily: StringRes.Avenir_Book,
                              fontSize: 16,
                            ),
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.search,
                                size: 17,
                                color: Palette.greyText,
                              )),
                              TextSpan(text: " "),
                              TextSpan(text: StringRes.search_home)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 0, right: 10),
                child: Material(
                  color: Colors.transparent, // button color
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.filter_list,
                        color: Palette.colorPrimary,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
