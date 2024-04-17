import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/image_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/screens/guest/portfolio/graphics_screen.dart';
import 'package:atrule_tech/screens/guest/portfolio/mobile_apps_screen.dart';
import 'package:atrule_tech/screens/guest/portfolio/websites_screen.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key key}) : super(key: key);

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      appBar: topBar("Portfolio", context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Text(
                    'Our Portfolio',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: ColorResources.atruleGreenColor,
                      fontFamily: FontResources.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MobileAppsScreen()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
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
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          ImageResources.mobAppIcon,
                          semanticsLabel: StringResources.mobApp,
                          width: 32.0,
                          height: 32.0,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          child: Text(
                            "Mobile Apps",
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorResources.atruleGreenColor,
                              fontFamily: FontResources.regular,
                            ),
                          ),
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          ImageResources.forwardIcon,
                          semanticsLabel: StringResources.mobApp,
                          width: 24.0,
                          height: 24.0,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => WebsitesScreen()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
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
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          ImageResources.webAppIcon,
                          semanticsLabel: StringResources.mobApp,
                          width: 32.0,
                          height: 32.0,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          child: Text(
                            "Websites",
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorResources.atruleGreenColor,
                              fontFamily: FontResources.regular,
                            ),
                          ),
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          ImageResources.forwardIcon,
                          semanticsLabel: StringResources.mobApp,
                          width: 24.0,
                          height: 24.0,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => GraphicsScreen()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
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
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          ImageResources.graphicIcon,
                          semanticsLabel: StringResources.mobApp,
                          width: 32.0,
                          height: 32.0,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Container(
                          child: Text(
                            "Graphics",
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorResources.atruleGreenColor,
                              fontFamily: FontResources.regular,
                            ),
                          ),
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          ImageResources.forwardIcon,
                          semanticsLabel: StringResources.mobApp,
                          width: 24.0,
                          height: 24.0,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
