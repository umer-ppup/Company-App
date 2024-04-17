import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/image_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/screens/guest/contact_us_screen.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GraphicDevScreen extends StatefulWidget {
  const GraphicDevScreen({Key key}) : super(key: key);

  @override
  _GraphicDevScreenState createState() => _GraphicDevScreenState();
}

class _GraphicDevScreenState extends State<GraphicDevScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      appBar: topBar("Graphic Designing (UI UX)", context),
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
                    child: myTextWidget("SEO (Digital Marketing)",
                        28.0,
                        ColorResources.whiteColor,
                        FontResources.bold,
                        TextAlign.center),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: Text(
                  StringResources.uiDesignHeading,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorResources.atruleGreenColor,
                    fontFamily: FontResources.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: SvgPicture.asset(
                  ImageResources.uiDesign,
                  semanticsLabel: StringResources.mobApp,
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                child: Text(
                  StringResources.uiDesignHeadingDetail,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorResources.atruleGreenColor,
                    fontFamily: FontResources.regular,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              bullet("Website design"),
              bullet("User Experience (UX) design"),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: Text(
                  StringResources.webDesignHeading,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorResources.atruleGreenColor,
                    fontFamily: FontResources.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: SvgPicture.asset(
                  ImageResources.webDesign,
                  semanticsLabel: StringResources.mobApp,
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                child: Text(
                  StringResources.webDesignHeadingDetail,
                  textAlign: TextAlign.justify,
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
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: Text(
                  StringResources.uxDesignHeading,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorResources.atruleGreenColor,
                    fontFamily: FontResources.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                child: Text(
                  StringResources.uxDesignHeadingDetail1,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorResources.atruleGreenColor,
                    fontFamily: FontResources.regular,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                child: Text(
                  StringResources.uxDesignHeadingDetail2,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorResources.atruleGreenColor,
                    fontFamily: FontResources.regular,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: SvgPicture.asset(
                  ImageResources.uxDesign,
                  semanticsLabel: StringResources.mobApp,
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                child: Text(
                  StringResources.uxDesignHeadingDetail3,
                  textAlign: TextAlign.justify,
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
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: Text(
                  "DO YOU WANT TO IMPLEMENT YOUR IDEA?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorResources.dodgerBlue,
                    fontFamily: FontResources.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                child: Text(
                  "Do you have any Query? Dont Hesitate to Contact our team.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorResources.dodgerBlue,
                    fontFamily: FontResources.regular,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                width: double.infinity,
                height: 56.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: ColorResources.dodgerBlue,
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    ColorResources.dodgerBlueLight),
                                animationDuration:
                                    Duration(milliseconds: 3, microseconds: 0),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ContactUsScreen()));
                              },
                              child: Text(
                                'GETTING STARTED NOW',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ColorResources.whiteColor,
                                  fontFamily: FontResources.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
