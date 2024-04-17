import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/image_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WebDevScreen extends StatefulWidget {
  const WebDevScreen({Key key}) : super(key: key);

  @override
  _WebDevScreenState createState() => _WebDevScreenState();
}

class _WebDevScreenState extends State<WebDevScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      appBar: topBar("Website Design and Development", context),
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
                    child: myTextWidget("Web Development",
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
                child: myTextWidget(StringResources.webDevHeading1,
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
                child: myTextWidget(StringResources.webDevHeading1Detail,
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
                child: myTextWidget(StringResources.webDevHeading2,
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
                child: myTextWidget(StringResources.webDevHeading2Detail1,
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
                child: SvgPicture.asset(
                  ImageResources.Website_Design_Development,
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
                child: myTextWidget(StringResources.webDevHeading2Detail2,
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
                child: myTextWidget(StringResources.webDevHeading3,
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
                child: myTextWidget(StringResources.webDevHeading3Detail1,
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
                child: SvgPicture.asset(
                  ImageResources.CMS_Website_Solution,
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
                child: myTextWidget(StringResources.webDevHeading3Detail2,
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
                child: myTextWidget(StringResources.webDevHeading4,
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
                child: myTextWidget(StringResources.webDevHeading4Detail1,
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
                child: SvgPicture.asset(
                  ImageResources.CRM_ERP_Development,
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
                child: myTextWidget(StringResources.webDevHeading4Detail2,
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
                child: myTextWidget(StringResources.webDevHeading4Detail3,
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
                child: myTextWidget(StringResources.webDevHeading5,
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
                child: myTextWidget(StringResources.webDevHeading5Detail1,
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
                child: myTextWidget(StringResources.webDevHeading6,
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
                child: myTextWidget(StringResources.webDevHeading6Detail1,
                    16.0,
                    ColorResources.atruleGreenColor,
                    FontResources.regular,
                    TextAlign.justify),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: SvgPicture.asset(
                  ImageResources.CUSTOM_CMS_Development,
                  semanticsLabel: StringResources.mobApp,
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                  fit: BoxFit.fill,
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