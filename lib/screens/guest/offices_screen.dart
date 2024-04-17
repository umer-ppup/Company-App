import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/util/util.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OfficesScreen extends StatefulWidget {
  const OfficesScreen({Key key}) : super(key: key);

  @override
  _OfficesScreenState createState() => _OfficesScreenState();
}

class _OfficesScreenState extends State<OfficesScreen> {
  CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(30.191111, 71.441111), zoom: 15.0);
  GoogleMapController _controller;

  CameraPosition _cameraPositionLahore =
      CameraPosition(target: LatLng(31.477225, 74.278879), zoom: 15.0);
  GoogleMapController _controllerLahore;

  bool multanMap = true;
  bool lahoreMap = true;

  Set<Marker> _markers = {
    Marker(
        markerId: MarkerId('<MARKER_ID>'),
        position: LatLng(30.191111, 71.441111))
  };

  Set<Marker> _markersLahore = {
    Marker(
        markerId: MarkerId('<MARKER_ID>'),
        position: LatLng(31.477225, 74.278879))
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      appBar: topBar("Offices", context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  // border: Border.all(
                  //     color: ColorResources.atruleGreenColor,
                  //     width: 1.0
                  // ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorResources.darkGreyColor.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 0),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: ColorResources.whiteColor,
                ),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        color: ColorResources.atruleGreenColor,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              color: ColorResources.atruleGreenColor,
                              child: Text(
                                StringResources.multanOffice,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: ColorResources.whiteColor,
                                  fontFamily: FontResources.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Container(
                              width: double.infinity,
                              height: 1.0,
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              color: ColorResources.whiteColor,
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              color: ColorResources.atruleGreenColor,
                              child: Text(
                                StringResources.multanAddress,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ColorResources.whiteColor,
                                  fontFamily: FontResources.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              color: ColorResources.atruleGreenColor,
                              child: Text(
                                StringResources.multanEmail,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ColorResources.whiteColor,
                                  fontFamily: FontResources.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 300.0,
                        child: Stack(
                          children: [
                            GoogleMap(
                              initialCameraPosition: CameraPosition(
                                  target: LatLng(30.191111, 71.441111),
                                  zoom: 15.0),
                              mapType: MapType.normal,
                              myLocationEnabled: false,
                              mapToolbarEnabled: false,
                              zoomControlsEnabled: true,
                              compassEnabled: true,
                              markers: _markers,
                              onMapCreated: (GoogleMapController controller) {
                                _controller = (controller);
                                _controller.animateCamera(
                                    CameraUpdate.newCameraPosition(
                                        _cameraPosition));

                                setState(() {
                                  multanMap = false;
                                });
                              },
                            ),
                            Visibility(
                              visible: multanMap,
                              child: Center(
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      ColorResources.atruleGreenColor),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10.0,
                              top: 10.0,
                              child: GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorResources.atruleGreenColor,
                                  ),
                                  child: Icon(
                                    Icons.map_outlined,
                                    color: ColorResources.whiteColor,
                                    size: 32.0,
                                    semanticLabel: 'Link.',
                                  ),
                                ),
                                onTap: () {
                                  launchMAP("30.191111", "71.441111");
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  // border: Border.all(
                  //     color: ColorResources.atruleGreenColor,
                  //     width: 1.0
                  // ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorResources.darkGreyColor.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 0),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: ColorResources.whiteColor,
                ),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        color: ColorResources.atruleGreenColor,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              color: ColorResources.atruleGreenColor,
                              child: Text(
                                StringResources.lahoreOffice,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: ColorResources.whiteColor,
                                  fontFamily: FontResources.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Container(
                              width: double.infinity,
                              height: 1.0,
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              color: ColorResources.whiteColor,
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              color: ColorResources.atruleGreenColor,
                              child: Text(
                                StringResources.lahoreAddress,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ColorResources.whiteColor,
                                  fontFamily: FontResources.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              color: ColorResources.atruleGreenColor,
                              child: Text(
                                StringResources.lahoreEmail,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ColorResources.whiteColor,
                                  fontFamily: FontResources.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 300.0,
                        child: Stack(
                          children: [
                            GoogleMap(
                              initialCameraPosition: CameraPosition(
                                  target: LatLng(0, 0), zoom: 15.0),
                              mapType: MapType.normal,
                              myLocationEnabled: false,
                              mapToolbarEnabled: false,
                              zoomControlsEnabled: true,
                              compassEnabled: true,
                              markers: _markersLahore,
                              onMapCreated: (GoogleMapController controller) {
                                _controllerLahore = (controller);
                                _controllerLahore.animateCamera(
                                    CameraUpdate.newCameraPosition(
                                        _cameraPositionLahore));

                                setState(() {
                                  lahoreMap = false;
                                });
                              },
                            ),
                            Visibility(
                              visible: lahoreMap,
                              child: Center(
                                child: CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      ColorResources.atruleGreenColor),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10.0,
                              top: 10.0,
                              child: GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorResources.atruleGreenColor,
                                  ),
                                  child: Icon(
                                    Icons.map_outlined,
                                    color: ColorResources.whiteColor,
                                    size: 32.0,
                                    semanticLabel: 'Link.',
                                  ),
                                ),
                                onTap: () {
                                  launchMAP("31.477225", "74.278879");
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
