import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:nekxolivro/ui/components/RoundEditText.dart';
import 'package:nekxolivro/values/AppRoutes.dart';
import 'package:nekxolivro/values/Palette.dart';
import 'package:nekxolivro/values/Res.dart';
import 'package:nekxolivro/values/StringRes.dart';
import 'package:nekxolivro/values/Styles.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //FlutterStatusbarcolor.setStatusBarColor(Colors.blue);
    return Scaffold(
      backgroundColor: Palette.whiteBackGround,
      body: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(Res.login_back),
                  Opacity(
                    opacity: 0.3,
                    child: Container(
                      color: Colors.white,
                      height: 235,
                    ),
                  )
                ],
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: double.infinity,
                      decoration: BoxDecoration(color: Colors.white),
                    ),
                    Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                StringRes.connectez_vous,
                                style: Styles.hugeBlueBlackTitle,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Text(
                                StringRes.information_de_connexion,
                                style: Styles.smallTextGreyBold,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 20,
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
                              height: 40,
                            ),

                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                width: double.infinity,
                                child: FlatButton(
                                    color: Palette.colorPrimary,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30),
                                    ),
                                    onPressed: () => null,
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      child: Text(
                                        StringRes.se_connecter,
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
                              color: Colors.transparent,
                              child: InkWell(
                                  onTap: () => Navigator.pushNamed(
                                      context, AppRoutes.forgotPassword),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      StringRes.mot_de_passe_oublie,
                                      style: TextStyle(
                                          color: Palette.colorBlue,
                                          fontSize: 16,
                                          fontFamily: StringRes.Avenir_Heavy,
                                          decoration: TextDecoration.underline),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => Navigator.pushNamed(
                                    context, AppRoutes.register),
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: RichText(
                                    text: TextSpan(
                                        text:
                                            StringRes.vous_navez_pas_de_compte,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Palette.greyText,
                                            fontFamily: StringRes.Avenir_Book),
                                        children: [
                                          TextSpan(
                                            text: StringRes.s_inscrire,
                                            style: TextStyle(
                                                fontFamily:
                                                    StringRes.Avenir_Heavy,
                                                color: Palette.colorPrimary),
                                          )
                                        ]),
                                  ),
                                ),
                              ),
                            )
                            //SizedBox(10)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
