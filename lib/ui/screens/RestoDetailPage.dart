import 'package:flutter/material.dart';
import 'package:nekxolivro/values/Palette.dart';
import 'package:nekxolivro/values/Res.dart';
import 'package:nekxolivro/values/StringRes.dart';
import 'package:nekxolivro/values/Styles.dart';

class RestoDetailPage extends StatefulWidget {
  @override
  State createState() => RestoDetailPageState();
}

class RestoDetailPageState extends State<RestoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteBackGround,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[],
        )
      ),
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(""),
        leading: IconButton(
          icon: Icon(
            Res.backIcon,
            color: Palette.colorBlueBlack,
          ),
          onPressed: () => Navigator.pop(context),
        )),
    );
  }
}
