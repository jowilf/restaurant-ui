import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nekxolivro/values/Palette.dart';
import 'package:nekxolivro/values/Res.dart';

import '../../values/Palette.dart';
import '../../values/Palette.dart';
import '../../values/StringRes.dart';
import '../components/JDivider.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteBackGround,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(height: 20),
            item("Mes commades", FontAwesomeIcons.shoppingBag),
            item("Mes informations", FontAwesomeIcons.user),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: JDivider(),
            ),
            SizedBox(height: 10),
            item("Codes promo", FontAwesomeIcons.percentage),
            item("F.A.Q", FontAwesomeIcons.questionCircle),
            item("Notifications",Icons.notifications),
            item("Déconnexion",Icons.exit_to_app),
          ]))
        ],
      ),
      appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: true,
          elevation: 2,
          backgroundColor: Colors.white,
          title: Text(
            "Mon Compte",
            style: TextStyle(
                color: Palette.colorBlueBlack,
                fontFamily: StringRes.Avenir_Heavy),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () => null,
                highlightColor: Palette.colorGrey,
                child: Text(
                  "Aide",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.colorBlue,
                      fontSize: 18),
                ))
          ],
          leading: IconButton(
            icon: Icon(
              Res.backIcon,
              color: Palette.colorBlueBlack,
            ),
            onPressed: () => Navigator.pop(context),
          )),
    );
  }

  Widget item(String text, IconData iconData) => Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => null,
          child: Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  iconData,
                  color: Palette.colorBlack,
                  size: 24,
                ),
                SizedBox(width: 15),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Text(
                    "$text",
                    style:
                        TextStyle(fontSize: 20, color: Palette.colorBlueBlack),
                  ),
                )),
                Icon(
                  Icons.navigate_next,
                  color: Palette.colorBlack,
                ),
              ],
            ),
          ),
        ),
      );
}
