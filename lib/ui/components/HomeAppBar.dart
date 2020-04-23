import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nekxolivro/ui/components/JDivider.dart';
import 'package:nekxolivro/utils/dialog_inseat_defeat.dart';
import 'package:nekxolivro/values/JIcon.dart';
import 'package:nekxolivro/values/Palette.dart';
import 'package:nekxolivro/values/StringRes.dart';

class HomeAppBar extends StatefulWidget {
  @override
  State createState() => HomeAppBarState();
}

class HomeAppBarState extends State<HomeAppBar> {
  int aId = -1;
  List<String> adresses = ["Au Bureau", "Chez Blanche", "Au Carrefour"];

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
                onTap: () => _adressDialog(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Lieu de livraison",
                        style: TextStyle(color: Palette.greyText, fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: RichText(
                            text: TextSpan(
                                text: aId == -1
                                    ? "Emplacement actuel"
                                    : adresses[aId],
                                style: TextStyle(
                                    color: Palette.colorBlueBlack,
                                    fontFamily: StringRes.Avenir_Heavy,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                                children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.arrow_drop_down,
                                color: Palette.colorBlueBlack,
                              ))
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
                                JIcons.search,
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

  _adressDialog(context) {
    showDialogWithInsets(
        context: context,
        edgeInsets: EdgeInsets.symmetric(horizontal: 8),
        builder: (context) {
          double dialogRadius = 5.0;
          List<Widget> children = [];
          print("aId $aId");
          children.addAll([
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Text(
                "Sélectionner l'adresse de livraison",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: StringRes.Avenir_Heavy,
                    color: Palette.colorBlueBlack),
              ),
            ),
            JDivider(),
            InkWell(
              onTap: () => setAdresse(-1),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.place,
                      color: Palette.greyText,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                      "Emplacement actuel",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: StringRes.Avenir_Book,
                      ),
                    )),
                    if (aId == -1)
                      Icon(
                        Icons.check_circle,
                        color: Palette.colorSecondary,
                      )
                  ],
                ),
              ),
            ),
            JDivider(),
          ]);
          for (int i = 0; i < min(adresses.length, 2); i++) {
            children.addAll([
              InkWell(
                onTap: () => setAdresse(i),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.flag,
                        color: Palette.greyText,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Text(
                        "${adresses[i]}",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: StringRes.Avenir_Book,
                        ),
                      )),
                      if (aId == i)
                        Icon(
                          Icons.check_circle,
                          color: Palette.colorSecondary,
                        )
                    ],
                  ),
                ),
              ),
              JDivider(),
            ]);
          }

          if (adresses.length > 2)
            children.addAll([
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RichText(
                          textAlign: TextAlign.center,
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
                    ],
                  ),
                ),
              ),
              JDivider()
            ]);
          children.add(InkWell(
            onTap: () => null,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.add,
                    color: Palette.colorPrimary,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                    "Nouvelle adresse de livraison",
                    style: TextStyle(
                      fontSize: 16,
                      color: Palette.colorPrimary,
                      fontFamily: StringRes.Avenir_Book,
                    ),
                  )),
                ],
              ),
            ),
          ));
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(dialogRadius)),
              backgroundColor: Colors.white,
              child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: children,
                  )));
        });
  }

  setAdresse(int idx) {
    setState(() {
      aId = idx;
    });
    Navigator.pop(context);
  }
}
