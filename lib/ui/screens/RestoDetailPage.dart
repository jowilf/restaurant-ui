import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nekxolivro/ui/components/RestoFoodView.dart';
import 'package:nekxolivro/values/JIcon.dart';
import 'package:nekxolivro/values/Palette.dart';
import 'package:nekxolivro/values/Res.dart';
import 'package:nekxolivro/values/Styles.dart';

class RestoDetailPage extends StatefulWidget {
  int id = 0;

  RestoDetailPage(this.id);

  @override
  State createState() => RestoDetailPageState(id);
}

class RestoDetailPageState extends State<RestoDetailPage> {
  int id = 0;

  RestoDetailPageState(this.id);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    List<String> plats = ["Entrées", "Résistant", "Déssert", "Boissons"];
    children.add(SliverPersistentHeader(
      pinned: true,
      delegate: MyDynamicHeader(id),
    ));
    children.add(SliverList(
      delegate: SliverChildListDelegate([
        Container(
          padding: EdgeInsets.all(15),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Mimi's",
                style: TextStyle(
                    color: Palette.colorBlueBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Africain - Pancake - Dessert",
                style: TextStyle(color: Colors.grey.shade600),
              ),
              /*RichText(
                  text: TextSpan(children: [
                WidgetSpan(
                    child: Icon(
                  Icons.info_outline,
                  color: Palette.colorPrimary,
                ))
              ]))*/
            ],
          ),
        )
      ]),
    ));
    int i = 0;
    for (String plat in plats) {
      children.add(SliverList(
        delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              plat,
              style: Styles.mediumBlueBlackTitle,
            ),
          )
        ]),
      ));
      children.add(SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return RestoFoodView(i++);
        }, childCount: 4),
      ));
    }
    return Scaffold(
        backgroundColor: Palette.colorGrey,
        body: CustomScrollView(slivers: children,physics:BouncingScrollPhysics(),));
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
      return Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Hero(
              tag: id,
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
        ),
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
                  color: Colors.white, // button color
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Res.backIcon,
                        color: Palette.colorPrimary,
                      ),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              ),
              Spacer(),
              ClipOval(
                child: Material(
                  elevation: 5,
                  color: Colors.white, // button color
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        FontAwesomeIcons.search,
                        size: 20,
                        color: Palette.colorPrimary,
                      ),
                    ),
                    onTap: () {},
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
      title: Text("Mimi's"),
      actions: <Widget>[
        IconButton(
            onPressed: () => null,
            icon: Icon(
              JIcons.search,
              color: Palette.colorPrimary,
            ))
      ],
      leading: IconButton(
        icon: Icon(
          Res.backIcon,
          color: Palette.colorPrimary,
        ),
        onPressed: () => Navigator.pop(context),
      ));

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => false;

  @override
  double get maxExtent => 200.0;

  @override
  double get minExtent => 80.0;
}
