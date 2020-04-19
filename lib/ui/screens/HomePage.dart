import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nekxolivro/ui/components/FoodView.dart';
import 'package:nekxolivro/ui/components/HomeAppBar.dart';
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
    //FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return Scaffold(
        backgroundColor: Palette.whiteBackGround,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            HomeAppBar(),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate:
                        SliverChildListDelegate([populaireTitle(context)]),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      if (index.isEven)
                        return Divider(
                          color: Palette.greyDark,
                        );
                      return FoodView(
                        index: index,
                      );
                    }, childCount: 3 * 2 + 1),
                  )
                ],
              ),
            ),
            /*Expanded(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  populaireTitle(context),
                  for (int i = 0; i < 13; i++)
                    FoodView(
                      index: i,
                    ),
                  Divider(),
                ],
              ),
            ),
            */ /*Expanded(
              child: ListView.builder(shrinkWrap: true,scrollDirection:Axis.horizontal,itemBuilder: (context,index)=>FoodHorizontal(),itemCount: 5,),
            )*/
          ],
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

  Widget populaireTitle(context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
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
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, AppRoutes.login),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
      );
}
/*
                    Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[

                        SizedBox(
                          height: 10,
                        ),
                        ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (_, index) => FoodView(),
                            separatorBuilder: (_, __) => Divider(
                                  height: 2,
                                  color: Palette.greyDark,
                                ),
                            itemCount: 4),
                      ],
                    ),
                  ))*/
/* child: CustomScrollView(slivers: <Widget>[
                    SliverStickyHeader(
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          if (index == 0) return populaireTitle(context);
                          if (index.isEven)
                            return Divider(
                              color: Palette.greyDark,
                            );
                          return FoodView(
                            index: index,
                          );
                        }, childCount: 4 * 2),
                      ),
                      header:
                  ]),
                  child: SliverList(
                    delegate: ,
                  ),*/
