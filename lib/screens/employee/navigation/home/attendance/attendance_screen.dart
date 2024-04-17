import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/util/util.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:atrule_tech/models/attendance_model.dart';
import 'mark_attendance.dart';
import 'package:expandable/expandable.dart';

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  List<String> months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  Color setColor(String first) {
    Color color;
    if (first.toUpperCase().startsWith("P")) {
      color = Colors.green;
    } else if (first.toUpperCase().startsWith("A")) {
      color = Colors.red[400];
    } else if (first.toUpperCase().startsWith("L")) {
      color = Colors.orange;
    } else if (first.toUpperCase().startsWith("H")) {
      color = Colors.lightBlue;
    }

    return color;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJsonAttendanceData("URL", "attendanceData");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.smokeWhiteColor,
        body: SafeArea(
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: ColorResources.atruleGreenColor,
              appBar: AppBar(
                  elevation: 0.0,
                  title: myTextWidget("Attendance History", 16.0, ColorResources.whiteColor, FontResources.regular, TextAlign.left),
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
                        text: "2019",
                      ),
                      Tab(
                        text: "2020",
                      ),
                      Tab(
                        text: "2021",
                      )
                    ],
                  )
              ),
              body: Container(
                color: ColorResources.smokeWhiteColor,
                child: TabBarView(
                  children: [
                    Container(
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
                                                    child: myTextWidgetWithMaxLine("P", 16.0, ColorResources.mediumSeaGreenColorLight, FontResources.bold, TextAlign.center, 1))
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
                                                    child: myTextWidgetWithMaxLine("L", 16.0, ColorResources.mediumSeaGreenColorLight, FontResources.bold, TextAlign.center, 1))
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
                                                    child: myTextWidgetWithMaxLine("A", 16.0, ColorResources.mediumSeaGreenColorLight, FontResources.bold, TextAlign.center, 1))
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
                                                    child: myTextWidgetWithMaxLine("H", 16.0, ColorResources.mediumSeaGreenColorLight, FontResources.bold, TextAlign.center, 1))
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
                            child: ExpandableTheme(
                              data: const ExpandableThemeData(
                                iconColor: ColorResources.atruleGreenColor,
                                iconSize: 24.0,
                                useInkWell: true,
                              ),
                              child: ListView.builder(
                                itemCount: months.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 7.5, bottom: 7.5),
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return ExpandableNotifier(
                                    initialExpanded: false,
                                    child: Column(
                                      children: <Widget>[
                                        ScrollOnExpand(
                                          scrollOnExpand: true,
                                          scrollOnCollapse: false,
                                          child: Container(
                                            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 7.5, bottom: 7.5),
                                            margin: EdgeInsets.symmetric(vertical: 10.0),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: ColorResources.atruleGreenColor, width: 0.3),
                                              borderRadius: BorderRadius.circular(5.0),
                                              color: ColorResources.whiteColor,
                                            ),
                                            child: ExpandablePanel(
                                              theme: const ExpandableThemeData(
                                                headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                tapBodyToCollapse: true,
                                                hasIcon: true,
                                                iconSize: 24.0,
                                              ),
                                              header: Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                                      child: myTextWidget(months[index], 16.0, ColorResources.atruleGreenColor, FontResources.bold, TextAlign.left),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              collapsed: Container(
                                                child: IntrinsicHeight(
                                                  child: Container(
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
                                                                            child: myTextWidget("Present", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
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
                                                                            child: myTextWidget("10", 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 5.0,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                        child: Container(
                                                                            child: myTextWidget("Absent", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
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
                                                                            child: myTextWidget("10", 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
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
                                                                            child: myTextWidget("Leave", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
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
                                                                            child: myTextWidget("10", 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 5.0,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                        child: Container(
                                                                            child: myTextWidget("Holiday", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
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
                                                                            child: myTextWidget("10", 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
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
                                              expanded: Container(
                                                child: FutureBuilder(
                                                  future: readJsonAttendanceData("URL", "attendanceData"),
                                                  builder: (BuildContext bContext, AsyncSnapshot<dynamic> snapshot) {
                                                    if (snapshot.hasData) {
                                                      return ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount: snapshot.data.length,
                                                          physics: NeverScrollableScrollPhysics(),
                                                          itemBuilder: (bContext, position) {
                                                            AttendanceHistory attendanceHistory =
                                                            snapshot.data[position];
                                                            return Container(
                                                              clipBehavior: Clip.antiAlias,
                                                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                                              margin: EdgeInsets.symmetric(vertical: 5.0),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                color: ColorResources.smokeWhiteColor,
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                      child: Column(
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              Expanded(
                                                                                  child: myTextWidget(attendanceHistory.date, 16.0, ColorResources.atruleGreenColor, FontResources.bold, TextAlign.left)
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Visibility(
                                                                            visible: attendanceHistory.attendance.toUpperCase().startsWith("P") ? true : false,
                                                                            child: IntrinsicHeight(
                                                                              child: Container(
                                                                                margin: EdgeInsets.only(top: 10.0),
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
                                                                                                        child: myTextWidget("Check-In", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
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
                                                                                                        child: myTextWidget(TimeOfDay.now().format(context), 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
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
                                                                                                        child: myTextWidget("Check-Out", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
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
                                                                                                        child: myTextWidget(TimeOfDay.now().format(context), 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
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
                                                                      )
                                                                  ),
                                                                  Container(
                                                                    padding: EdgeInsets.all(10.0),
                                                                    decoration: BoxDecoration(
                                                                        shape: BoxShape.circle,
                                                                        color: setColor(attendanceHistory.attendance)
                                                                    ),
                                                                    child: myTextWidget(attendanceHistory.attendance.substring(0, 1), 16.0, ColorResources.whiteColor, FontResources.bold, TextAlign.center),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          });
                                                    } else if (snapshot.hasError) {
                                                      return Center(
                                                        child: Text("Error : " + snapshot.error),
                                                      );
                                                    }
                                                    return CircularProgressIndicator();
                                                  },
                                                ),
                                              ),
                                              builder: (_, collapsed, expanded) {
                                                return Expandable(
                                                  collapsed: collapsed,
                                                  expanded: expanded,
                                                  theme: const ExpandableThemeData(crossFadePoint: 0),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                                                    child: myTextWidgetWithMaxLine("P", 16.0, ColorResources.mediumSeaGreenColorLight, FontResources.bold, TextAlign.center, 1))
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
                                                    child: myTextWidgetWithMaxLine("L", 16.0, ColorResources.mediumSeaGreenColorLight, FontResources.bold, TextAlign.center, 1))
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
                                                    child: myTextWidgetWithMaxLine("A", 16.0, ColorResources.mediumSeaGreenColorLight, FontResources.bold, TextAlign.center, 1))
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
                                                    child: myTextWidgetWithMaxLine("H", 16.0, ColorResources.mediumSeaGreenColorLight, FontResources.bold, TextAlign.center, 1))
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
                            child: ExpandableTheme(
                              data: const ExpandableThemeData(
                                iconColor: ColorResources.atruleGreenColor,
                                iconSize: 24.0,
                                useInkWell: true,
                              ),
                              child: ListView.builder(
                                itemCount: months.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 7.5, bottom: 7.5),
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return ExpandableNotifier(
                                    initialExpanded: false,
                                    child: Column(
                                      children: <Widget>[
                                        ScrollOnExpand(
                                          scrollOnExpand: true,
                                          scrollOnCollapse: false,
                                          child: Container(
                                            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 7.5, bottom: 7.5),
                                            margin: EdgeInsets.symmetric(vertical: 10.0),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: ColorResources.atruleGreenColor, width: 0.3),
                                              borderRadius: BorderRadius.circular(5.0),
                                              color: ColorResources.whiteColor,
                                            ),
                                            child: ExpandablePanel(
                                              theme: const ExpandableThemeData(
                                                headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                tapBodyToCollapse: true,
                                                hasIcon: true,
                                                iconSize: 24.0,
                                              ),
                                              header: Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                                      child: myTextWidget(months[index], 16.0, ColorResources.atruleGreenColor, FontResources.bold, TextAlign.left),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              collapsed: Container(
                                                child: IntrinsicHeight(
                                                  child: Container(
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
                                                                            child: myTextWidget("Present", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
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
                                                                            child: myTextWidget("10", 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 5.0,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                        child: Container(
                                                                            child: myTextWidget("Absent", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
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
                                                                            child: myTextWidget("10", 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
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
                                                                            child: myTextWidget("Leave", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
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
                                                                            child: myTextWidget("10", 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 5.0,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                        child: Container(
                                                                            child: myTextWidget("Holiday", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
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
                                                                            child: myTextWidget("10", 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
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
                                              expanded: Container(
                                                child: FutureBuilder(
                                                  future: readJsonAttendanceData("URL", "attendanceData"),
                                                  builder: (BuildContext bContext, AsyncSnapshot<dynamic> snapshot) {
                                                    if (snapshot.hasData) {
                                                      return ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount: snapshot.data.length,
                                                          physics: NeverScrollableScrollPhysics(),
                                                          itemBuilder: (bContext, position) {
                                                            AttendanceHistory attendanceHistory =
                                                            snapshot.data[position];
                                                            return Container(
                                                              clipBehavior: Clip.antiAlias,
                                                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                                              margin: EdgeInsets.symmetric(vertical: 5.0),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                color: ColorResources.smokeWhiteColor,
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                      child: Column(
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              Expanded(
                                                                                  child: myTextWidget(attendanceHistory.date, 16.0, ColorResources.atruleGreenColor, FontResources.bold, TextAlign.left)
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Visibility(
                                                                            visible: attendanceHistory.attendance.toUpperCase().startsWith("P") ? true : false,
                                                                            child: IntrinsicHeight(
                                                                              child: Container(
                                                                                margin: EdgeInsets.only(top: 10.0),
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
                                                                                                        child: myTextWidget("Check-In", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
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
                                                                                                        child: myTextWidget(TimeOfDay.now().format(context), 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
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
                                                                                                        child: myTextWidget("Check-Out", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
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
                                                                                                        child: myTextWidget(TimeOfDay.now().format(context), 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
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
                                                                      )
                                                                  ),
                                                                  Container(
                                                                    padding: EdgeInsets.all(10.0),
                                                                    decoration: BoxDecoration(
                                                                        shape: BoxShape.circle,
                                                                        color: setColor(attendanceHistory.attendance)
                                                                    ),
                                                                    child: myTextWidget(attendanceHistory.attendance.substring(0, 1), 16.0, ColorResources.whiteColor, FontResources.bold, TextAlign.center),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          });
                                                    } else if (snapshot.hasError) {
                                                      return Center(
                                                        child: Text("Error : " + snapshot.error),
                                                      );
                                                    }
                                                    return CircularProgressIndicator();
                                                  },
                                                ),
                                              ),
                                              builder: (_, collapsed, expanded) {
                                                return Expandable(
                                                  collapsed: collapsed,
                                                  expanded: expanded,
                                                  theme: const ExpandableThemeData(crossFadePoint: 0),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                                                    child: myTextWidgetWithMaxLine("P", 16.0, ColorResources.mediumSeaGreenColorLight, FontResources.bold, TextAlign.center, 1))
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
                                                    child: myTextWidgetWithMaxLine("L", 16.0, ColorResources.mediumSeaGreenColorLight, FontResources.bold, TextAlign.center, 1))
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
                                                    child: myTextWidgetWithMaxLine("A", 16.0, ColorResources.mediumSeaGreenColorLight, FontResources.bold, TextAlign.center, 1))
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
                                                    child: myTextWidgetWithMaxLine("H", 16.0, ColorResources.mediumSeaGreenColorLight, FontResources.bold, TextAlign.center, 1))
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
                            child: ExpandableTheme(
                              data: const ExpandableThemeData(
                                iconColor: ColorResources.atruleGreenColor,
                                iconSize: 24.0,
                                useInkWell: true,
                              ),
                              child: ListView.builder(
                                itemCount: months.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 7.5, bottom: 7.5),
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  return ExpandableNotifier(
                                    initialExpanded: false,
                                    child: Column(
                                      children: <Widget>[
                                        ScrollOnExpand(
                                          scrollOnExpand: true,
                                          scrollOnCollapse: false,
                                          child: Container(
                                            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 7.5, bottom: 7.5),
                                            margin: EdgeInsets.symmetric(vertical: 10.0),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: ColorResources.atruleGreenColor, width: 0.3),
                                              borderRadius: BorderRadius.circular(5.0),
                                              color: ColorResources.whiteColor,
                                            ),
                                            child: ExpandablePanel(
                                              theme: const ExpandableThemeData(
                                                headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                tapBodyToCollapse: true,
                                                hasIcon: true,
                                                iconSize: 24.0,
                                              ),
                                              header: Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                                                      child: myTextWidget(months[index], 16.0, ColorResources.atruleGreenColor, FontResources.bold, TextAlign.left),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              collapsed: Container(
                                                child: IntrinsicHeight(
                                                  child: Container(
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
                                                                            child: myTextWidget("Present", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
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
                                                                            child: myTextWidget("10", 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 5.0,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                        child: Container(
                                                                            child: myTextWidget("Absent", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
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
                                                                            child: myTextWidget("10", 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
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
                                                                            child: myTextWidget("Leave", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
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
                                                                            child: myTextWidget("10", 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 5.0,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                        child: Container(
                                                                            child: myTextWidget("Holiday", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
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
                                                                            child: myTextWidget("10", 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
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
                                              expanded: Container(
                                                child: FutureBuilder(
                                                  future: readJsonAttendanceData("URL", "attendanceData"),
                                                  builder: (BuildContext bContext, AsyncSnapshot<dynamic> snapshot) {
                                                    if (snapshot.hasData) {
                                                      return ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount: snapshot.data.length,
                                                          physics: NeverScrollableScrollPhysics(),
                                                          itemBuilder: (bContext, position) {
                                                            AttendanceHistory attendanceHistory =
                                                            snapshot.data[position];
                                                            return Container(
                                                              clipBehavior: Clip.antiAlias,
                                                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                                              margin: EdgeInsets.symmetric(vertical: 5.0),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                color: ColorResources.smokeWhiteColor,
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                      child: Column(
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              Expanded(
                                                                                  child: myTextWidget(attendanceHistory.date, 16.0, ColorResources.atruleGreenColor, FontResources.bold, TextAlign.left)
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Visibility(
                                                                            visible: attendanceHistory.attendance.toUpperCase().startsWith("P") ? true : false,
                                                                            child: IntrinsicHeight(
                                                                              child: Container(
                                                                                margin: EdgeInsets.only(top: 10.0),
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
                                                                                                        child: myTextWidget("Check-In", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
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
                                                                                                        child: myTextWidget(TimeOfDay.now().format(context), 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
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
                                                                                                        child: myTextWidget("Check-Out", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
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
                                                                                                        child: myTextWidget(TimeOfDay.now().format(context), 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left))
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
                                                                      )
                                                                  ),
                                                                  Container(
                                                                    padding: EdgeInsets.all(10.0),
                                                                    decoration: BoxDecoration(
                                                                        shape: BoxShape.circle,
                                                                        color: setColor(attendanceHistory.attendance)
                                                                    ),
                                                                    child: myTextWidget(attendanceHistory.attendance.substring(0, 1), 16.0, ColorResources.whiteColor, FontResources.bold, TextAlign.center),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          });
                                                    } else if (snapshot.hasError) {
                                                      return Center(
                                                        child: Text("Error : " + snapshot.error),
                                                      );
                                                    }
                                                    return CircularProgressIndicator();
                                                  },
                                                ),
                                              ),
                                              builder: (_, collapsed, expanded) {
                                                return Expandable(
                                                  collapsed: collapsed,
                                                  expanded: expanded,
                                                  theme: const ExpandableThemeData(crossFadePoint: 0),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: ColorResources.mediumSeaGreenColorLight,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Row(
            children: [
              Expanded(
                child: MyButton(
                  text: "Check-In",
                  textColor: ColorResources.whiteColor,
                  buttonColor: ColorResources.atruleGreenColor,
                  splashColor: ColorResources.mediumSeaGreenColorLight,
                  onPress: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MarkAttendance(check: 1,)));
                  },
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: MyButton(
                  text: "Check-Out",
                  textColor: ColorResources.whiteColor,
                  buttonColor: ColorResources.atruleGreenColor,
                  splashColor: ColorResources.mediumSeaGreenColorLight,
                  onPress: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MarkAttendance(check: 0,)));
                  },
                ),
              )
            ],
          ),
        )
    );
  }
}