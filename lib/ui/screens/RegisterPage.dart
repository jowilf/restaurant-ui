import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nekxolivro/ui/components/RoundEditText.dart';
import 'package:nekxolivro/values/Palette.dart';
import 'package:nekxolivro/values/Res.dart';
import 'package:nekxolivro/values/StringRes.dart';
import 'package:nekxolivro/values/Styles.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegisterPage extends StatefulWidget {
  @override
  State createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
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
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      StringRes.inscrivez_vous,
                      style: Styles.hugeBlueBlackTitle,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RoundEditText(hintText: StringRes.nom),
                  SizedBox(
                    height: 10,
                  ),
                  RoundEditText(
                    hintText: StringRes.phone,
                    prefixText: StringRes.phone_code,
                    inputType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RoundEditText(
                    hintText: StringRes.mot_de_passe,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: FlatButton(
                          color: Palette.colorPrimary,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30),
                          ),
                          onPressed: () => register(context),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              StringRes.s_inscrire,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: StringRes.Avenir_Light,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Material(
                    child: GestureDetector(
                      onTap: () => print('taped'),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: StringRes.text_avant_conditions,
                              style: TextStyle(
                                  fontSize: 14, color: Palette.greyText),
                              children: [
                                TextSpan(
                                  text: StringRes.termes_et_conditions,
                                  style: TextStyle(
                                      fontFamily: StringRes.Avenir_Heavy,
                                      color: Palette.colorPrimary),
                                )
                              ]),
                        ),
                      ),
                    ),
                  )
                ],
              ),
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

  void register(BuildContext context) {
    Alert(
        context: context,
        title: "Nous allons vérifier votre numero",
        content: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "Êtes vous sur que le numero",
                style: TextStyle(fontSize: 15, color: Palette.greyText),
                children: [
                  TextSpan(
                      text: " 62374698 ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: "est correct, ou voulez-vous le changer")
                ])),
        buttons: [
          DialogButton(
            color: Palette.colorPrimary,
            child: Text(
              "Continuer",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
          )
        ]).show();
  }
}
