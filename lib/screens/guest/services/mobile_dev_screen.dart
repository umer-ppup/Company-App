import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/image_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MobileDevScreen extends StatefulWidget {
  const MobileDevScreen({Key key}) : super(key: key);

  @override
  _MobileDevScreenState createState() => _MobileDevScreenState();
}

class _MobileDevScreenState extends State<MobileDevScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      appBar: topBar("Mobile App Development", context),
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
                    child: myTextWidget("Mobile Development",
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
                child: myTextWidget(StringResources.mobileDevHeading1,
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
                child: myTextWidget(StringResources.mobileDevHeading1Detail,
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
                child: myTextWidget(StringResources.mobileDevHeading2,
                    16.0,
                    ColorResources.atruleGreenColor,
                    FontResources.bold,
                    TextAlign.center),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: SvgPicture.asset(
                  ImageResources.mobile_dev_1,
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
                child: myTextWidget(StringResources.mobileDevHeading2Detail,
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
                child: myTextWidget(StringResources.mobileDevHeading3,
                    16.0,
                    ColorResources.atruleGreenColor,
                    FontResources.bold,
                    TextAlign.center),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: SvgPicture.asset(
                  ImageResources.mobile_dev_2,
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
                child: myTextWidget(StringResources.mobileDevHeading3Detail,
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
                child: myTextWidget(StringResources.mobileDevHeading4,
                    16.0,
                    ColorResources.atruleGreenColor,
                    FontResources.bold,
                    TextAlign.center),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: SvgPicture.asset(
                  ImageResources.mobile_dev_3,
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
                child: myTextWidget(StringResources.mobileDevHeading4Detail,
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
                child: myTextWidget(StringResources.mobileDevHeading5,
                    16.0,
                    ColorResources.atruleGreenColor,
                    FontResources.bold,
                    TextAlign.center),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: SvgPicture.asset(
                  ImageResources.mobile_dev_4,
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
                child: myTextWidget(StringResources.mobileDevHeading5Detail,
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
                child: myTextWidget(StringResources.mobileDevHeading6,
                    16.0,
                    ColorResources.atruleGreenColor,
                    FontResources.bold,
                    TextAlign.center),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: SvgPicture.asset(
                  ImageResources.mobile_dev_5,
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
                child: myTextWidget(StringResources.mobileDevHeading6Detail,
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
                child: myTextWidget(StringResources.mobileDevHeading7,
                    16.0,
                    ColorResources.atruleGreenColor,
                    FontResources.bold,
                    TextAlign.center),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: SvgPicture.asset(
                  ImageResources.mobile_dev_6,
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
                child: myTextWidget(StringResources.mobileDevHeading7Detail,
                    16.0,
                    ColorResources.atruleGreenColor,
                    FontResources.regular,
                    TextAlign.justify),
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