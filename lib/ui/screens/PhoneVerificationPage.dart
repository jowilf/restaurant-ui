import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nekxolivro/values/Palette.dart';
import 'package:nekxolivro/values/Res.dart';
import 'package:nekxolivro/values/StringRes.dart';
import 'package:nekxolivro/values/Styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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
          child: Stack(children: <Widget>[
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
                  StringRes.verification_numero,
                  textAlign: TextAlign.center,
                  style: Styles.hugeBlueBlackTitle,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                StringRes.en_attente_otp + "62374698",
                style: Styles.smallTextGreyBold,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        StringRes.changer_le_num,
                        style: TextStyle(
                            color: Palette.colorPrimary,
                            fontSize: 16,
                            fontFamily: StringRes.Avenir_Heavy),
                      ),
                    )),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                child: PinCodeTextField(
                  length: 6,
                  obsecureText: false,
                  animationType: AnimationType.fade,
                  shape: PinCodeFieldShape.box,
                  animationDuration: Duration(milliseconds: 300),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  fieldHeight: 40,
                  activeColor: Palette.colorPrimary,
                  activeFillColor: Palette.colorPrimary,
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  inactiveFillColor: Palette.colorGrey,
                  selectedFillColor: Palette.colorGrey,
                  selectedColor: Palette.colorGrey,
                  dialogContent: StringRes.voulez_vous_utiliser,
                  dialogTitle: "Coller",
                  affirmativeText: "Utiliser",
                  negativeText: "Annuler",
                  enableActiveFill: true,
                  inactiveColor: Palette.colorGrey,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                StringRes.code_recu_sms,
                style: TextStyle(color: Palette.greyText),
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
                      onPressed: () => Navigator.pop(context, true),
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
              SizedBox(
                height: 30,
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => null,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: StringRes.vous_navez_pas_recu_code + "\n",
                          style:
                              TextStyle(fontSize: 14, color: Palette.greyText),
                          children: [
                            TextSpan(
                              text: StringRes.renvoyer_code,
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
        )
      ])),
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
