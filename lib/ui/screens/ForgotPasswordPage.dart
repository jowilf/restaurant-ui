import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nekxolivro/ui/components/RoundEditText.dart';
import 'package:nekxolivro/values/AppRoutes.dart';
import 'package:nekxolivro/values/Palette.dart';
import 'package:nekxolivro/values/Res.dart';
import 'package:nekxolivro/values/StringRes.dart';
import 'package:nekxolivro/values/Styles.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  State createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      StringRes.mot_de_passe_oublie_short_text,
                      style: Styles.mediumBlueBlackTitle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RoundEditText(
                    hintText: StringRes.phone,
                    prefixText: StringRes.phone_code,
                    inputType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 20,
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
                          onPressed: () async {
                            final result = await Navigator.pushNamed(
                                context, AppRoutes.phoneVerification);
                            print(result);
                            if (result == true)
                              Navigator.pushNamed(
                                  context, AppRoutes.resetPassword);
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              StringRes.confirmer,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: StringRes.Avenir_Light,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                  ),
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
}
