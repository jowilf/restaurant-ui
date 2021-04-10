import 'package:flutter/material.dart';
import 'package:nekxolivro/values/JIcon.dart';
import 'package:nekxolivro/values/Palette.dart';
import 'package:nekxolivro/values/Res.dart';
import 'package:nekxolivro/values/StringRes.dart';
import 'package:nekxolivro/values/Styles.dart';

class FoodDetailPage extends StatefulWidget {
  int id;

  FoodDetailPage(this.id);

  @override
  State createState() => FoodDetailPageState(id);
}

class FoodDetailPageState extends State<FoodDetailPage> {
  int quantity = 1;
  int id;

  FoodDetailPageState(this.id);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(SliverPersistentHeader(
      pinned: true,
      delegate: MyDynamicHeader(id),
    ));
    children.add(SliverList(
      delegate: SliverChildListDelegate([
        Card(
          elevation: 1,
          margin: EdgeInsets.all(0),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Burger",
                        maxLines: 2,
                        style: TextStyle(
                            fontFamily: StringRes.Avenir_Heavy, fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text("3 500 CFA", style: Styles.priceStyle),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                    "Régalez-vous avec notre pizza toujours chaud au granite de pomme"),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ]),
    ));
    children.add(SliverList(
      delegate: SliverChildListDelegate([
        SizedBox(
          height: 20,
        )
      ]),
    ));
    //for (int i = 0; i < 20; i++)
    children.add(SliverList(
      delegate: SliverChildListDelegate([
        Card(
          elevation: 1,
          child: Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    JIcons.minus_circle,
                    color: Palette.colorPrimary,
                  ),
                  onPressed: () {
                    if (quantity > 1)
                      setState(() {
                        quantity -= 1;
                      });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "$quantity",
                    style: Styles.hugeBlueBlackTitle,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    JIcons.plus_circle,
                    color: Palette.colorPrimary,
                  ),
                  onPressed: () {
                    if (quantity < 100)
                      setState(() {
                        quantity += 1;
                      });
                  },
                ),
              ],
            ),
          ),
        )
      ]),
    ));
    /*children.add(SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return RestoFoodView();
      }, childCount: 44),
    ));*/
    return Scaffold(
      backgroundColor: Palette.colorGreyBack,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
              child: CustomScrollView(
            slivers: children,
          )),
          Container(
            decoration: new BoxDecoration(boxShadow: [
              new BoxShadow(
                color: Palette.greyDark,
                blurRadius: 0.5,
              ),
            ]),
            child: Card(
              elevation: 2,
              margin: EdgeInsets.all(0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: double.infinity,
                child: FlatButton(
                    color: Palette.colorPrimary,
                    onPressed: () => null,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        StringRes.ajouter_au_panier,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: StringRes.Avenir_Light,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyDynamicHeader extends SliverPersistentHeaderDelegate {
  double percentage = 1;
  int id;

  MyDynamicHeader(this.id);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: (context, constraints) {
      final double percentage =
          (constraints.maxHeight - minExtent) / (maxExtent - minExtent);
      return Stack(
        children: <Widget>[
          Hero(
            tag: "food$id",
            child: Container(
              height: constraints.maxHeight,
              child: Opacity(
                opacity: percentage > 0.5 ? 1 : 2 * percentage,
                child: Image.asset(
                  Res.login_back,
                  fit: BoxFit.cover,
                  height: constraints.maxHeight,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Opacity(
              opacity: percentage > 0.2 ? 0 : -5 * percentage + 1,
              child: appBar(context)),
          Opacity(
              opacity: percentage < 0.5 ? 0 : 2 * percentage - 1,
              child: expandedAppBar(context)),
        ],
      );
    });
  }

  Widget expandedAppBar(context) => Container(
        width: double.infinity,
        height: minExtent,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        //color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: <Widget>[
              ClipOval(
                child: Material(
                  elevation: 5,
                  color: Palette.colorGrey, // button color
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Res.closeIcon,
                        color: Palette.colorPrimary,
                      ),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget appBar(context) => AppBar(
      centerTitle: false,
      automaticallyImplyLeading: true,
      elevation: 2.0,
      backgroundColor: Colors.white,
      title: Text("Burger"),
      leading: IconButton(
        icon: Icon(
          Res.closeIcon,
          color: Palette.colorPrimary,
        ),
        onPressed: () => Navigator.pop(context),
      ));

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => false;

  @override
  double get maxExtent => 200.0;

  @override
  double get minExtent => 100.0;
}
