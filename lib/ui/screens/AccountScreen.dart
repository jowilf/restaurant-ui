import 'package:flutter/material.dart';
import 'package:nekxolivro/values/Palette.dart';
import 'package:nekxolivro/values/Res.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.colorGreyBack,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(height: 20),
            Material(
              elevation: 1,
              color: Colors.white,
              child: InkWell(
                onTap: ()=>null,
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.local_offer,
                        color: Palette.greyDark,
                      ),
                      SizedBox(width: 10,),
                      Expanded(child: Text("Mes commandes",style: TextStyle(fontSize: 20),)),Icon(
                        Icons.navigate_next,
                        color: Palette.greyDark,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]))
        ],
      ),
      appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: true,
          elevation: 2,
          backgroundColor: Colors.white,
          title: Text(
            "Compte",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Palette.colorBlueBlack),
          ),
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
