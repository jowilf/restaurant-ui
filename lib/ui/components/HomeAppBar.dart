import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nekxolivro/values/JIcon.dart';
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
                onTap: () => _adressDialog(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Livraison à",
                        style: TextStyle(
                            color: Palette.greyText,
                            fontSize: 16,
                            fontFamily: StringRes.Avenir_Heavy),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: RichText(
                            text: TextSpan(
                                text: "Lieu actuel ",
                                style: TextStyle(
                                    color: Palette.colorBlueBlack,
                                    fontFamily: StringRes.Avenir_Book,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
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
    showModalBottomSheet(
        context: context,
        backgroundColor: Palette.whiteBackGround,
        builder: (context) {
          List<Widget> children = [];
          children.add(SliverList(
            delegate: SliverChildListDelegate([
              Text(
                "Adresse de Livraison",
                style: Styles.mediumBlueBlackTitle,
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => null,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Palette.colorPrimary,
                              fontSize: 16,
                              fontFamily: StringRes.Avenir_Light,
                              fontWeight: FontWeight.bold),
                          children: [
                            WidgetSpan(
                                child: Icon(
                              Icons.add,
                              size: 20,
                              color: Palette.colorPrimary,
                            )),
                            WidgetSpan(
                                child: SizedBox(
                              width: 10,
                            )),
                            TextSpan(text: "Nouvelle adresse de livraison")
                          ]),
                    ),
                  ),
                ),
              ),
            ]),
          ));
          children.add(SliverList(
              delegate: SliverChildBuilderDelegate(
            (builder, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: adresseRadio(index),
              );
            },
            childCount: 10,
          )));
          return Container(
            padding: EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 30),
            child: CustomScrollView(
              slivers: children,
            ),
          );
        });
  }

  Widget adresseRadio(index) => Row(
        children: <Widget>[
          Icon(
            CupertinoIcons.location_solid,
            color: Palette.greyText,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Lieu actuel",
            style: TextStyle(
              fontSize: 16,
              fontFamily: StringRes.Avenir_Light,
            ),
          ),
          Spacer(),
          Radio(value: index, groupValue: 1, onChanged: (val) {})
        ],
      );
}
