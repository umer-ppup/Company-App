import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class LeaveHistoryScreen extends StatefulWidget {
  const LeaveHistoryScreen({Key key}) : super(key: key);

  @override
  _LeaveHistoryScreenState createState() => _LeaveHistoryScreenState();
}

class _LeaveHistoryScreenState extends State<LeaveHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.smokeWhiteColor,
        appBar: topBar("Leave History", context),
        body: SafeArea(
          child: AnimationLimiter(
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Container(
                    color: ColorResources.smokeWhiteColor,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 10.0),
                                          color: ColorResources.atruleGreenColor,
                                          child: myTextWidgetWithMaxLine("USED", 16.0, ColorResources.mediumSeaGreenColorLight, FontResources.bold, TextAlign.center, 1))
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 10.0),
                                          color: ColorResources.mediumSeaGreenColorLight,
                                          child: myTextWidgetWithMaxLine("6", 16.0, ColorResources.atruleGreenColor, FontResources.regular, TextAlign.center, 1))
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const VerticalDivider(
                          color: ColorResources.mediumSeaGreenColor,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          width: 1,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 10.0),
                                          color: ColorResources.atruleGreenColor,
                                          child: myTextWidgetWithMaxLine("CASUAL", 16.0, ColorResources.mediumSeaGreenColorLight, FontResources.bold, TextAlign.center, 1))
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 10.0),
                                          color: ColorResources.mediumSeaGreenColorLight,
                                          child: myTextWidgetWithMaxLine("10", 16.0, ColorResources.atruleGreenColor, FontResources.regular, TextAlign.center, 1))
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const VerticalDivider(
                          color: ColorResources.mediumSeaGreenColor,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          width: 1,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 10.0),
                                          color: ColorResources.atruleGreenColor,
                                          child: myTextWidgetWithMaxLine("SICK", 16.0, ColorResources.mediumSeaGreenColorLight, FontResources.bold, TextAlign.center, 1))
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 10.0),
                                          color: ColorResources.mediumSeaGreenColorLight,
                                          child: myTextWidgetWithMaxLine("10", 16.0, ColorResources.atruleGreenColor, FontResources.regular, TextAlign.center, 1))
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: ColorResources.mediumSeaGreenColor,
                  height: 1,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                            itemBuilder: (buildContext, position) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 5.0),
                                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                                decoration: BoxDecoration(
                                  boxShadow: [BoxShadow(
                                    color: ColorResources.darkGreyColor.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(0, 0),
                                  )],
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: ColorResources.whiteColor,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                                child: myTextWidget(position == 0 ? StringResources.leaveTypes.last + " (5 Days)" : StringResources.leaveTypes[0], 16.0, ColorResources.atruleGreenColor, FontResources.bold, TextAlign.left))
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                                margin: EdgeInsets.only(top: 5.0),
                                                child: myTextWidget("Need to go out of town.", 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
                                        ),
                                      ],
                                    ),
                                    Visibility(
                                      visible: position == 0 ? true : false,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 15.0),
                                        child: IntrinsicHeight(
                                          child: Row(
                                            children: [
                                              const VerticalDivider(
                                                color: ColorResources.atruleGreenColor,
                                                thickness: 5,
                                                indent: 0,
                                                endIndent: 0,
                                                width: 5,
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(vertical: 5.0),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                              child: Container(
                                                                  child: myTextWidget("Start Date", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 3.0,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                              child: Container(
                                                                  child: myTextWidget(StringResources.myDateFormat.format(DateTime.now()), 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(vertical: 5.0),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                              child: Container(
                                                                  child: myTextWidget("End Date", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 3.0,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                              child: Container(
                                                                  child: myTextWidget(StringResources.myDateFormat.format(DateTime.now().add(Duration(days: 4))), 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: position != 0 ? true : false,
                                      child: Container(
                                        margin: EdgeInsets.only(top: 15.0),
                                        child: IntrinsicHeight(
                                          child: Row(
                                            children: [
                                              const VerticalDivider(
                                                color: ColorResources.atruleGreenColor,
                                                thickness: 5,
                                                indent: 0,
                                                endIndent: 0,
                                                width: 5,
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(vertical: 5.0),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                              child: Container(
                                                                  child: myTextWidget("Date", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 3.0,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                              child: Container(
                                                                  child: myTextWidget(StringResources.myDateFormat.format(DateTime.now()), 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
                                                          ),
                                                        ],
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
                                  ],
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}