import 'package:atrule_tech/models/employees_model.dart';
import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/image_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/screens/employee/navigation/home/leave/leave_screen.dart';
import 'package:atrule_tech/util/util.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:atrule_tech/screens/employee/navigation/home/attendance/attendance_screen.dart';

class EmployeeHomeScreen extends StatefulWidget {
  @override
  _EmployeeHomeScreenState createState() => _EmployeeHomeScreenState();
}

class _EmployeeHomeScreenState extends State<EmployeeHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      body: SafeArea(
        child: AnimationLimiter(
          child: Container(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0, top: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                            bottomLeft: Radius.circular(50.0),
                            bottomRight: Radius.circular(50.0)
                        ),
                        color: ColorResources.atruleGreenColor
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(2.0),
                              color: ColorResources.whiteColor,
                              child: Image.asset(
                                ImageResources.atruleIcon,
                                fit: BoxFit.fill,
                                width: 24.0,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                                child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10.0),
                                    child: myTextWidget(StringResources.atruleFullName, 16.0, ColorResources.whiteColor, FontResources.regular, TextAlign.center))
                            ),
                            MaterialButton(
                              onPressed: (){
                                logoutFunction(context);
                              },
                              minWidth: 0,
                              visualDensity: VisualDensity.compact,
                              color: ColorResources.orangeColor,
                              textColor: ColorResources.whiteColor,
                              child: Icon(
                                Icons.logout_rounded,
                                size: 24,
                                color: ColorResources.whiteColor,
                              ),
                              padding: EdgeInsets.all(13.0),
                              shape: CircleBorder(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              width: 70.0,
                              height: 70.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: ColorResources.atruleGreenColorLite,
                                      width: 1.0
                                  ),
                                  boxShadow: [BoxShadow(
                                    color: ColorResources.darkGreyColor.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: Offset(0, 0),
                                  )],
                                  color: ColorResources.whiteColor
                              ),
                              child: Image.asset('asset/profile.png', fit: BoxFit.fill,),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: myTextWidget(StringResources.employeeName, 16.0, ColorResources.whiteColor, FontResources.bold, TextAlign.left)
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: myTextWidget(StringResources.employeeDesignation, 16.0, ColorResources.whiteColor, FontResources.regular, TextAlign.left)
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
                Expanded(
                  child: Container(
                    child: FutureBuilder(
                      future: readJsonData("URL", "employeesData"),
                      builder: (BuildContext bContext, AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          return GridView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 20.0),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: 1/0.8,
                              ),
                              itemCount: snapshot.data.length,
                              itemBuilder: (bContext, position) {
                                EmployeesModel employeesModel = snapshot.data[position];
                                return GestureDetector(
                                  onTap: () {
                                    print(position);
                                    if (position == 0) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  AttendanceScreen()));
                                    }
                                    else if (position == 1) {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  LeaveScreen()));
                                    }
                                  },
                                  child: Container(
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
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 50.0,
                                          height: 50.0,
                                          child: svgIconWidget(employeesModel.image, 50.0, 50.0),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                          child: myTextWidgetMaxLine(employeesModel.title, TextAlign.center, ColorResources.atruleGreenColor, 16.0, FontResources.bold, 1),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        } else if (snapshot.hasError) {
                          return Row(
                            children: [
                              Expanded(
                                  child: myTextWidget("Error: ${snapshot.error}", 16.0, ColorResources.whiteColor, FontResources.regular, TextAlign.left)
                              ),
                            ],
                          );
                        }
                        return CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(ColorResources.atruleGreenColor),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
