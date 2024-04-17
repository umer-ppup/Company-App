import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/image_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/screens/guest/contact_us_screen.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SeoDevScreen extends StatefulWidget {
  const SeoDevScreen({Key key}) : super(key: key);

  @override
  _SeoDevScreenState createState() => _SeoDevScreenState();
}

class _SeoDevScreenState extends State<SeoDevScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      appBar: topBar("Digital Marketing and SEO", context),
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
                child: myTextWidget(StringResources.seoHeading,
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
                child: myTextWidget(StringResources.seoHeadingDetail,
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
                  ImageResources.seo,
                  semanticsLabel: StringResources.mobApp,
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: myTextWidget("Our Strategies of SEO:",
                    16.0,
                    ColorResources.atruleGreenColor,
                    FontResources.bold,
                    TextAlign.start),
              ),
              SizedBox(
                height: 10.0,
              ),
              bullet("Website Audit"),
              bullet("Keyword Research"),
              bullet("Link Building"),
              bullet("On Page Seo"),
              bullet("Off Page Seo"),
              bullet("Website Evaluation"),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: myTextWidget(StringResources.ppcHeading,
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
                child: myTextWidget(StringResources.ppcHeadingDetail,
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
                  ImageResources.ppc,
                  semanticsLabel: StringResources.mobApp,
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              bullet("Paid Search"),
              bullet("Advertising"),
              bullet("PPC Remarketing"),
              bullet("Social Advertising"),
              bullet("Display Advertising"),
              bullet("Video Advertising"),
              bullet("Image Advertising"),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: myTextWidget(StringResources.contentMarketingHeading,
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
                child: myTextWidget(StringResources.contentMarketingHeadingDetail1,
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
                child: myTextWidget(StringResources.contentMarketingHeadingDetail2,
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
                child: myTextWidget(StringResources.contentMarketingHeadingDetail3,
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
                  ImageResources.contentMarketing,
                  semanticsLabel: StringResources.mobApp,
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              bullet("Cost savings"),
              bullet("Increased sales"),
              bullet(
                  "Better customers with significantly greater levels of commitment"),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: myTextWidget(StringResources.smmHeading,
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
                child: myTextWidget(StringResources.smmHeadingDetail1,
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
                child: myTextWidget(StringResources.smmHeadingDetail2,
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
                  ImageResources.smm,
                  semanticsLabel: StringResources.mobApp,
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              bullet("Increasing the number of visitors to your website"),
              bullet("Conversions of buildings"),
              bullet("Increasing brand recognition"),
              bullet(
                  "Making a positive brand association and developing a brand identity"),
              bullet(
                  "Improving interaction and conversation with targeted stakeholders"),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: double.infinity,
                child: myTextWidget(StringResources.emailMarketingHeading,
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
                child: myTextWidget(StringResources.emailMarketingHeadingDetail1,
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
                child: myTextWidget(StringResources.emailMarketingHeadingDetail2,
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
                  ImageResources.emailMarketing,
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
                child: myTextWidget(StringResources.emailMarketingHeadingDetail3,
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
                child: myTextWidget("DO YOU WANT TO IMPLEMENT YOUR IDEA?",
                    16.0,
                    ColorResources.dodgerBlue,
                    FontResources.bold,
                    TextAlign.center),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                child: myTextWidget("Do you have any Query? Dont Hesitate to Contact our team.",
                    16.0,
                    ColorResources.dodgerBlue,
                    FontResources.regular,
                    TextAlign.center),
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
                              child: myTextWidget('GETTING STARTED NOW',
                                  16.0,
                                  ColorResources.whiteColor,
                                  FontResources.bold,
                                  TextAlign.center),
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