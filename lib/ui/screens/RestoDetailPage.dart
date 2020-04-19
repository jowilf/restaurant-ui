import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nekxolivro/ui/components/FoodView.dart';
import 'package:nekxolivro/values/Palette.dart';
import 'package:nekxolivro/values/Res.dart';

class RestoDetailPage extends StatefulWidget {
  @override
  State createState() => RestoDetailPageState();
}

class RestoDetailPageState extends State<RestoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.whiteBackGround,
        body: CustomScrollView(slivers: <Widget>[
          /*SliverAppBar(
            title: Text("Mimi's"),
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                Res.login_back,
                fit: BoxFit.cover,
              ),
            ),
          ),*/
          SliverPersistentHeader(
            pinned: true,
            delegate: MyDynamicHeader(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (index > 0 && !index.isEven)
                return Divider(
                  color: Palette.greyDark,
                );
              return FoodView(
                index: index,
              );
            }, childCount: 30 * 2 + 1),
          ),
        ]));
  }
}

class MyDynamicHeader extends SliverPersistentHeaderDelegate {
  int index = 0;
  double percentage = 1;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: (context, constraints) {
      final Color color = Colors.primaries[index];
      final double percentage =
          (constraints.maxHeight - minExtent) / (maxExtent - minExtent);

      if (++index > Colors.primaries.length - 1) index = 0;
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
        ],
      );
    });
  }

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
