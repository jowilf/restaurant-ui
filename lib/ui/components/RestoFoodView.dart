import 'package:flutter/material.dart';
import 'package:nekxolivro/values/AppRoutes.dart';
import 'package:nekxolivro/values/Res.dart';
import 'package:nekxolivro/values/StringRes.dart';
import 'package:nekxolivro/values/Styles.dart';

class RestoFoodView extends StatelessWidget {
  int id;

  RestoFoodView(this.id);

  @override
  Widget build(BuildContext context) {
    print("food$id")     ;
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, AppRoutes.foodDetail,arguments: id),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Pizza Chaud",
                        style: TextStyle(fontFamily: StringRes.Avenir_Heavy),
                      ),
                      Text("Régalez-vous avec notre pizza toujours chaud"),
                      Text(
                        "4 500 CFA",
                        style: Styles.smallTextGreyBold,
                      ),
                    ],
                  ),
                ),
                Hero(
                  tag: "food$id",
                  child: Card(
                    elevation: 1,
                    //margin: EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset(
                        Res.login_back,
                        height: 70.0,
                        width: 70.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
