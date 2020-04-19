import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nekxolivro/values/Res.dart';
import 'package:nekxolivro/values/StringRes.dart';
import 'package:nekxolivro/values/Styles.dart';

class FoodHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => null,
      child: Container(
        width: 200,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 1,
              //margin: EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  Res.login_back,
                  height: 150.0,
                  width: 195.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                "Pizza Chaud",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(fontSize: 15, fontFamily: StringRes.Avenir_Heavy),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                "4 500 CFA",
                style: Styles.smallTextGreyBold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
