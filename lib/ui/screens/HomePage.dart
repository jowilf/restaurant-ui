import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nekxolivro/values/AppRoutes.dart';
import 'package:nekxolivro/values/Palette.dart';
import 'package:nekxolivro/values/StringRes.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.whiteBackGround,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Colors.white),
                height: double.infinity,
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      width: double.infinity,
                      child: Container(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            style: TextStyle(
                              color: Palette.greyText,
                              fontFamily: StringRes.Avenir_Light,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
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
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                      child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Populaire cette semaine",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Palette.colorBlueBlack,
                                    fontFamily: StringRes.Avenir_Heavy),
                              ),
                            ),
                            Material(
                              child: InkWell(
                                onTap: () => Navigator.pushNamed(
                                    context, AppRoutes.login),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 5),
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Voir tout",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Palette.colorBlueBlack,
                                            fontFamily: StringRes.Avenir_Heavy),
                                        children: [
                                          WidgetSpan(
                                              child: Icon(
                                            CupertinoIcons.right_chevron,
                                            size: 15,
                                          ))
                                        ]),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ],
          ),
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
              centerTitle: false,
              automaticallyImplyLeading: true,
              elevation: 0.0,
              backgroundColor: Colors.white,
              title: Text("")),
        ));
  }
}
/*,*/
