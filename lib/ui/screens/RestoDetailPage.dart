import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nekxolivro/ui/components/RestoFoodView.dart';
import 'package:nekxolivro/values/Palette.dart';
import 'package:nekxolivro/values/Res.dart';
import 'package:nekxolivro/values/Styles.dart';

class RestoDetailPage extends StatefulWidget {
  @override
  State createState() => RestoDetailPageState();
}

class RestoDetailPageState extends State<RestoDetailPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    List<String> plats = ["Entrées", "Résistant", "Déssert", "Boissons"];
    children.add(SliverPersistentHeader(
      pinned: true,
      delegate: MyDynamicHeader(),
    ));
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
          return RestoFoodView();
        }, childCount: 4),
      ));
    }
    return Scaffold(
        backgroundColor: Palette.colorGrey,
        body: CustomScrollView(slivers: children));
  }
}

class MyDynamicHeader extends SliverPersistentHeaderDelegate {
  double percentage = 1;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: (context, constraints) {
      final double percentage =
          (constraints.maxHeight - minExtent) / (maxExtent - minExtent);
      return Stack(
        children: <Widget>[
          Container(
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
                  color: Colors.white, // button color
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Res.backIcon,
                        size: 26,
                        color: Palette.colorPrimary,
                      ),
                    ),
                    onTap: () {},
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
                      child: SvgPicture.asset(
                        Res.search_icon,
                        color: Palette.colorPrimary,
                        width: 24,
                        height: 24,
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
              Icons.search,
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
