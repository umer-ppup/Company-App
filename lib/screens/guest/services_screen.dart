import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/image_resources.dart';
import 'package:atrule_tech/screens/guest/services/desktop_dev_screen.dart';
import 'package:atrule_tech/screens/guest/services/graphic_dev_screen.dart';
import 'package:atrule_tech/screens/guest/services/mobile_dev_screen.dart';
import 'package:atrule_tech/screens/guest/services/seo_dev_screen.dart';
import 'package:atrule_tech/screens/guest/services/web_dev_screen.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key key}) : super(key: key);

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      appBar: topBar("Services", context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              DesktopDevScreen()));
                    },
                    child: Container(
                      color: ColorResources.color0,
                      width: MediaQuery.of(context).size.width * 0.46,
                      height: 420.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20.0),
                            child: myTextWidget('Desktop Application Development',
                                18.0,
                                ColorResources.whiteColor,
                                FontResources.regular,
                                TextAlign.center),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20.0),
                            child: myTextWidget('Desktop Application runs over a desktop operating system like Mac, Linus and Windows.',
                                16.0,
                                ColorResources.whiteColor,
                                FontResources.regular,
                                TextAlign.center),
                          ),
                          Image.asset(
                            ImageResources.desktopDevIcon,
                            fit: BoxFit.fill,
                            width: 100.0,
                            height: 100.0,
                          ),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => WebDevScreen()));
                    },
                    child: Container(
                      color: ColorResources.color1,
                      width: MediaQuery.of(context).size.width * 0.46,
                      height: 420.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20.0),
                            child: myTextWidget('Website Design and Development',
                                18.0,
                                ColorResources.whiteColor,
                                FontResources.regular,
                                TextAlign.center),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20.0),
                            child: myTextWidget('Web Apps are easily accessible over internet with liberty of OS. Atrule provides beautiful & secure websites to its clients.',
                                16.0,
                                ColorResources.whiteColor,
                                FontResources.regular,
                                TextAlign.center),
                          ),
                          Image.asset(
                            ImageResources.webDevIcon,
                            fit: BoxFit.fill,
                            width: 100.0,
                            height: 100.0,
                          ),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              MobileDevScreen()));
                    },
                    child: Container(
                      color: ColorResources.color2,
                      width: MediaQuery.of(context).size.width * 0.46,
                      height: 420.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20.0),
                            child: myTextWidget('Mobile App Development',
                                18.0,
                                ColorResources.whiteColor,
                                FontResources.regular,
                                TextAlign.center),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20.0),
                            child: myTextWidget('Atrule builds magnificent mobile apps for your brand and its requirements for both ISO and Android.',
                                16.0,
                                ColorResources.whiteColor,
                                FontResources.regular,
                                TextAlign.center),
                          ),
                          Image.asset(
                            ImageResources.mobileDevIcon,
                            fit: BoxFit.fill,
                            width: 100.0,
                            height: 100.0,
                          ),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => SeoDevScreen()));
                    },
                    child: Container(
                      color: ColorResources.color3,
                      width: MediaQuery.of(context).size.width * 0.46,
                      height: 420.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20.0),
                            child: myTextWidget('Digital Marketing and SEO',
                                18.0,
                                ColorResources.whiteColor,
                                FontResources.regular,
                                TextAlign.center),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20.0),
                            child: myTextWidget('Atrule can assist you to reach more targeted audience using PPC, SMM & SEO modes that’ll rank up your brand in rank race.',
                                16.0,
                                ColorResources.whiteColor,
                                FontResources.regular,
                                TextAlign.center),
                          ),
                          Image.asset(
                            ImageResources.digitalMarketIcon,
                            fit: BoxFit.fill,
                            width: 100.0,
                            height: 100.0,
                          ),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              GraphicDevScreen()));
                    },
                    child: Container(
                      color: ColorResources.color4,
                      width: MediaQuery.of(context).size.width * 0.46,
                      height: 420.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20.0),
                            child: myTextWidget('Graphic Designing (UI UX)',
                                18.0,
                                ColorResources.whiteColor,
                                FontResources.regular,
                                TextAlign.center),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 20.0),
                            child: myTextWidget('Graphics are the identity of a brand. Charming logo, posters & banners makes your brand different to others.',
                                16.0,
                                ColorResources.whiteColor,
                                FontResources.regular,
                                TextAlign.center),
                          ),
                          Image.asset(
                            ImageResources.graphicDesignIcon,
                            fit: BoxFit.fill,
                            width: 100.0,
                            height: 100.0,
                          ),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: ColorResources.whiteColor,
                    width: MediaQuery.of(context).size.width * 0.46,
                    height: 420.0,
                  )
                ],
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