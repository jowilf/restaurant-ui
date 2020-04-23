import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nekxolivro/values/Palette.dart';

class LocationPickerPage extends StatefulWidget {
  @override
  State createState() => LocationPickerPageState();
}

class LocationPickerPageState extends State<LocationPickerPage> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteBackGround,
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: _kGooglePlex,
      ),
      /*body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                "Détails de l'adresse de livraison",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16, color: Palette.greyText),
              ),
            ),
            JDivider(),
            InkWell(
              onTap: () => null,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.flag,
                        color: Palette.greyText,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                      "Rue Moutefard",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: StringRes.Avenir_Book,
                      ),
                    )),
                    Icon(
                      Icons.chevron_right,
                      color: Palette.greyText,
                    )
                  ],
                ),
              ),
            ),
            JDivider(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      Icons.home,
                      color: Palette.greyText,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Palette.greyText),
                      hintText: "Etages, Appartement (Facultatif)",
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: StringRes.Avenir_Book,
                    ),
                  ))
                ],
              ),
            ),
            JDivider(),
            Row(
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () => null,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        "Terminer",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Palette.colorPrimary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),*/
    );
  }
}
