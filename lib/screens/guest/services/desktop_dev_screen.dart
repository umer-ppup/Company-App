import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/image_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class DesktopDevScreen extends StatefulWidget {
  const DesktopDevScreen({Key key}) : super(key: key);

  @override
  _DesktopDevScreenState createState() => _DesktopDevScreenState();
}

class _DesktopDevScreenState extends State<DesktopDevScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      appBar: topBar("Desktop Application Development", context),
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
                    child: myTextWidget("Desktop Development",
                        28.0,
                        ColorResources.whiteColor,
                        FontResources.regular,
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
                child: myTextWidget(StringResources.desktopDevHeading1,
                    16.0,
                    ColorResources.atruleGreenColor,
                    FontResources.bold,
                    TextAlign.center),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                child: myTextWidget(StringResources.desktopDevHeading1Detail,
                    16.0,
                    ColorResources.atruleGreenColor,
                    FontResources.regular,
                    TextAlign.justify),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: myTextWidget(StringResources.desktopDevHeading2,
                    16.0,
                    ColorResources.atruleGreenColor,
                    FontResources.bold,
                    TextAlign.center),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                child: myTextWidget(StringResources.p1,
                    16.0,
                    ColorResources.atruleGreenColor,
                    FontResources.regular,
                    TextAlign.justify),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                child: myTextWidget(StringResources.p2,
                    16.0,
                    ColorResources.atruleGreenColor,
                    FontResources.regular,
                    TextAlign.justify),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                child: myTextWidget(StringResources.p3,
                    16.0,
                    ColorResources.atruleGreenColor,
                    FontResources.regular,
                    TextAlign.justify),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Image.asset(
                  ImageResources.apNet1,
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                child: myTextWidget(StringResources.p4,
                    16.0,
                    ColorResources.atruleGreenColor,
                    FontResources.regular,
                    TextAlign.justify),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                child: myTextWidget(StringResources.p5,
                    16.0,
                    ColorResources.atruleGreenColor,
                    FontResources.regular,
                    TextAlign.justify),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Image.asset(
                  ImageResources.apNet2,
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
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