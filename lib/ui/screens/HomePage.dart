import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:nekxolivro/ui/components/FoodView.dart';
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
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
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
                              fontFamily: StringRes.Avenir_Book,
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
                      child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Row(
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
                              color: Colors.transparent,
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
                        SizedBox(
                          height: 10,
                        ),
                        ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (_, index) => FoodView(),
                          separatorBuilder: (_, __) => Divider(height: 2,color: Palette.greyDark,),
                          itemCount: 3,
                        ),
                      ],
                    ),
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
