import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaveRequestScreen extends StatefulWidget {
  const LeaveRequestScreen({Key key}) : super(key: key);

  @override
  _LeaveRequestScreenState createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  Widget pendingContainer(){
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: 3,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          itemBuilder: (buildContext, position) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
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
    );
  }
  Widget allowedContainer(){
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: 3,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          itemBuilder: (buildContext, position) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
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
                              child: myTextWidget(position == 0 ? StringResources.leaveTypes.last + " (5 Days)" : StringResources.leaveTypes[5], 16.0, ColorResources.atruleGreenColor, FontResources.bold, TextAlign.left))
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: DefaultTabController(
            length: 4,
            child: Scaffold(
              backgroundColor: ColorResources.smokeWhiteColor,
              appBar: AppBar(
                  elevation: 0.0,
                  title: myTextWidget("Leave Requests", 16.0, ColorResources.whiteColor, FontResources.regular, TextAlign.left),
                  titleSpacing: 0,
                  iconTheme: IconThemeData(color: ColorResources.whiteColor),
                  backgroundColor: ColorResources.atruleGreenColor,
                  brightness: Brightness.dark,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                  bottom: TabBar(
                    indicatorColor: ColorResources.mediumSeaGreenColorLight,
                    indicatorWeight: 3.0,
                    isScrollable: true,
                    labelColor: ColorResources.mediumSeaGreenColorLight,
                    unselectedLabelColor: ColorResources.whiteColor,
                    labelStyle: myTextStyle(16.0, ColorResources.mediumSeaGreenColorLight, FontResources.bold),
                    unselectedLabelStyle: myTextStyle(16.0, ColorResources.whiteColor, FontResources.bold),
                    onTap: (index) {},
                    tabs: <Widget>[
                      Tab(
                        text: StringResources.leaveStatus1,
                      ),
                      Tab(
                        text: StringResources.leaveStatus2,
                      ),
                      Tab(
                        text: StringResources.leaveStatus3,
                      ),
                      Tab(
                        text: StringResources.leaveStatus4,
                      ),
                    ],
                  )
              ),
              body: TabBarView(
                children: [
                  pendingContainer(),
                  allowedContainer(),
                  Container(
                    child: Center(
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  child: myTextWidget("No request found.", 16.0, ColorResources.mediumSeaGreenColor, FontResources.bold, TextAlign.center))
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  child: myTextWidget("No request found.", 16.0, ColorResources.mediumSeaGreenColor, FontResources.bold, TextAlign.center))
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