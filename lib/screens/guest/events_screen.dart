import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/image_resources.dart';
import 'package:atrule_tech/screens/guest/portfolio/full_screen.dart';
import 'package:atrule_tech/util/util.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:atrule_tech/models/event_model.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key key}) : super(key: key);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      appBar: topBar("Events", context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0.0),
                        bottomLeft: Radius.elliptical(500.0, 100.0),
                        bottomRight: Radius.elliptical(500.0, 100.0),
                        topRight: Radius.circular(0.0),
                      ),
                      color: ColorResources.whiteColor,
                    ),
                    child: Image.asset(
                      ImageResources.desktop_back,
                      width: MediaQuery.of(context).size.width,
                      height: 250.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0.0),
                        bottomLeft: Radius.elliptical(500.0, 100.0),
                        bottomRight: Radius.elliptical(500.0, 100.0),
                        topRight: Radius.circular(0.0),
                      ),
                      color: ColorResources.darkGreyColor.withOpacity(0.5),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Recent Events",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        color: ColorResources.whiteColor,
                        fontFamily: FontResources.bold,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Text(
                  'Our Recent Events',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    color: ColorResources.atruleGreenColor,
                    fontFamily: FontResources.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: FutureBuilder(
                  future: readJson("URL", "eventData"),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          EventModel eventModel = snapshot.data[index];
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: ColorResources.darkGreyColor
                                      .withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: Offset(0, 0),
                                )
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: ColorResources.whiteColor,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200.0,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => FullScreen(
                                            imagePath: eventModel.image,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Image.asset(
                                      eventModel.image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 20.0),
                                  child: Text(
                                    eventModel.date != null
                                        ? eventModel.date
                                        : "",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: ColorResources.atruleGreenColor,
                                      fontFamily: FontResources.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    eventModel.description != null
                                        ? eventModel.description
                                        : "",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: ColorResources.atruleGreenColor,
                                      fontFamily: FontResources.regular,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Icon(
                                          Icons.location_on_outlined,
                                          size: 24.0,
                                          color: ColorResources.dodgerBlue,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      Expanded(
                                        child: Text(
                                          eventModel.locationName != null
                                              ? eventModel.locationName
                                              : "",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: ColorResources.dodgerBlue,
                                            fontFamily: FontResources.regular,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                )
                              ],
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        "${snapshot.error}",
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorResources.atruleGreenColor,
                          fontFamily: FontResources.bold,
                        ),
                      ));
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullScreen(
                          imagePath: ImageResources.eventPic,
                        ),
                      ),
                    );
                  },
                  child: Image.asset(
                    ImageResources.eventPic,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
