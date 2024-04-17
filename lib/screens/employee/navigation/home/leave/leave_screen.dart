import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/image_resources.dart';
import 'package:atrule_tech/screens/employee/navigation/home/leave/leave_apply_screen.dart';
import 'package:atrule_tech/screens/employee/navigation/home/leave/leave_history_screen.dart';
import 'package:atrule_tech/screens/employee/navigation/home/leave/leave_request_screen.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({Key key}) : super(key: key);

  @override
  _LeaveScreenState createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.smokeWhiteColor,
      appBar: topBar("Leave Information", context),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => LeaveHistoryScreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                        color: ColorResources.darkGreyColor.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 0),
                      )],
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: ColorResources.whiteColor,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.history_rounded,
                          color: ColorResources.atruleGreenColor,
                          size: 24.0,
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              child: myTextWidget("Leave History", 16.0, ColorResources.atruleGreenColor, FontResources.regular, TextAlign.left)
                          ),
                        ),
                        SvgPicture.asset(
                          ImageResources.forwardIcon,
                          semanticsLabel: "Forward Icon",
                          width: 24.0,
                          height: 24.0,
                          color: ColorResources.atruleGreenColor,
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
                        builder: (BuildContext context) => LeaveRequestScreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                        color: ColorResources.darkGreyColor.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 0),
                      )],
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: ColorResources.whiteColor,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.note_rounded,
                          color: ColorResources.atruleGreenColor,
                          size: 24.0,
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              child: myTextWidget("Leave Requests", 16.0, ColorResources.atruleGreenColor, FontResources.regular, TextAlign.left)
                          ),
                        ),
                        SvgPicture.asset(
                          ImageResources.forwardIcon,
                          semanticsLabel: "Forward Icon",
                          width: 24.0,
                          height: 24.0,
                          color: ColorResources.atruleGreenColor,
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
                        builder: (BuildContext context) => LeaveApplyScreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                        color: ColorResources.darkGreyColor.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 0),
                      )],
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: ColorResources.whiteColor,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.note_add_rounded,
                          color: ColorResources.atruleGreenColor,
                          size: 24.0,
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              child: myTextWidget("Apply For Leave", 16.0, ColorResources.atruleGreenColor, FontResources.regular, TextAlign.left)
                          ),
                        ),
                        SvgPicture.asset(
                          ImageResources.forwardIcon,
                          semanticsLabel: "Forward Icon",
                          width: 24.0,
                          height: 24.0,
                          color: ColorResources.atruleGreenColor,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}