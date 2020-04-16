import 'package:flutter/material.dart';
import 'package:nekxolivro/values/Palette.dart';
import 'package:nekxolivro/values/Res.dart';

class PhoneVerificationPage extends StatefulWidget {
  @override
  State createState() => PhoneVerificationPageState();
}

class PhoneVerificationPageState extends State<PhoneVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteBackGround,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.white),
              height: double.infinity,
            ),
          ],
        ),
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
