import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nekxolivro/ui/components/FoodHorizontal.dart';
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
                    delegate: SliverChildListDelegate([
                      sectionTitle(
                          context, "Populaire cette semaine", AppRoutes.login)
                    ]),
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
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      sectionTitle(
                          context, "Tendances du moment", AppRoutes.login)
                    ]),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return FoodHorizontal();
                          }),
                    ),
                  )
                ],
              ),
            ),
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

  Widget sectionTitle(context, leftText, routeName) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                leftText,
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
                onTap: () => Navigator.pushNamed(context, routeName),
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
