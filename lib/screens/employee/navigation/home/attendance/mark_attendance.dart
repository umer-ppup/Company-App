import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class MarkAttendance extends StatefulWidget {
  int check;
  MarkAttendance({this.check});
  @override
  _MarkAttendanceState createState() => _MarkAttendanceState();
}

class _MarkAttendanceState extends State<MarkAttendance> {
  //region variables

  // int _radioValue = 0;
  // Color colorValue = Colors.green;
  // String text = "P";

  DateTime attendanceDate = DateTime.now();
  TimeOfDay attendanceTime = TimeOfDay.now();
  //endregion

  //region required functions
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: attendanceDate,
        currentDate: DateTime.now(),// Refer step 1
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),

        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.dark(
                primary: ColorResources.atruleGreenColor,
                onPrimary: ColorResources.whiteColor,
                surface: ColorResources.atruleGreenColor,
                onSurface: ColorResources.darkGreyColor,
              ),
              dialogBackgroundColor: ColorResources.whiteColor,
            ),
            child: child,
          );
        }
    );
    if (picked != null && picked != attendanceDate)
      setState(() {
        attendanceDate = picked;
      });
  }
  _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: attendanceTime,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.dark(
              primary: ColorResources.atruleGreenColor,
              onPrimary: ColorResources.whiteColor,
              surface: ColorResources.whiteColor,
              onSurface: ColorResources.darkGreyColor,
            ),
            dialogBackgroundColor: ColorResources.whiteColor,
          ),
          child: child,
        );
      }
    );
    if (picked != null)
      setState(() {
        attendanceTime = picked;
      });
  }

  // _handleRadioValueChange(int value) {
  //   setState(() {
  //     _radioValue = value;
  //
  //     switch (_radioValue) {
  //       case 0:
  //         colorValue = Colors.green;
  //         text = "P";
  //         break;
  //       case 1:
  //         colorValue = Colors.red[400];
  //         text = "A";
  //         break;
  //       case 2:
  //         colorValue = Colors.orange;
  //         text = "L";
  //         break;
  //       case 3:
  //         colorValue = Colors.lightBlue;
  //         text = "H";
  //         break;
  //     }
  //   });
  // }

  //endregion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(widget.check == 1 ? "Today's Check In" : "Today's Check Out", context),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            child: myTextWidget(widget.check == 1 ? "Check In Date" : "Check Out Date", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: (){_selectDate(context);},
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
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
                      child: myTextWidget(attendanceDate == null ? "Select Date" : StringResources.myDateFormat.format(attendanceDate), 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.center)),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            child: myTextWidget(widget.check == 1 ? "Check In Time" : "Check Out Time", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: (){
                    _selectTime(context);
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
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
                      child: myTextWidget(attendanceTime == null ? "Select Time" : attendanceTime.format(context), 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.center)),
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 10.0),
                //   child: IntrinsicHeight(
                //     child: Row(
                //       children: [
                //         Expanded(
                //           child: GestureDetector(
                //             onTap: (){_selectDate(context);},
                //             child: Container(
                //                 padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                //                 clipBehavior: Clip.antiAlias,
                //                 decoration: BoxDecoration(
                //                   boxShadow: [BoxShadow(
                //                     color: ColorResources.darkGreyColor.withOpacity(0.2),
                //                     spreadRadius: 1,
                //                     blurRadius: 3,
                //                     offset: Offset(0, 0),
                //                   )],
                //                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                //                   color: ColorResources.whiteColor,
                //                 ),
                //                 child: myTextWidget(attendanceDate == null ? "Date" : StringResources.myDateFormat.format(attendanceDate), 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.center)),
                //           ),
                //         ),
                //         SizedBox(
                //           width: 10.0,
                //         ),
                //         Expanded(
                //           child: GestureDetector(
                //             onTap: (){
                //               _selectTime(context);
                //             },
                //             child: Container(
                //                 padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                //                 clipBehavior: Clip.antiAlias,
                //                 decoration: BoxDecoration(
                //                   boxShadow: [BoxShadow(
                //                     color: ColorResources.darkGreyColor.withOpacity(0.2),
                //                     spreadRadius: 1,
                //                     blurRadius: 3,
                //                     offset: Offset(0, 0),
                //                   )],
                //                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                //                   color: ColorResources.whiteColor,
                //                 ),
                //                 child: myTextWidget(attendanceTime == null ? "Time" : attendanceTime.format(context), 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.center)),
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10.0,
                // ),
                // Row(
                //   children: [
                //     Expanded(
                //         child: Container(
                //             padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                //             child: myTextWidget("STATUS", 16.0, ColorResources.atruleGreenColor, FontResources.bold, TextAlign.center))
                //     ),
                //   ],
                // ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 10.0),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Container(
                //           padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                //           clipBehavior: Clip.antiAlias,
                //           decoration: BoxDecoration(
                //             boxShadow: [BoxShadow(
                //               color: ColorResources.darkGreyColor.withOpacity(0.2),
                //               spreadRadius: 1,
                //               blurRadius: 3,
                //               offset: Offset(0, 0),
                //             )],
                //             borderRadius: BorderRadius.all(Radius.circular(10.0)),
                //             color: ColorResources.whiteColor,
                //           ),
                //           child: Row(
                //             children: [
                //               Radio(
                //                 activeColor: ColorResources.atruleGreenColor,
                //                 value: 0,
                //                 groupValue: _radioValue,
                //                 onChanged: _handleRadioValueChange,
                //               ),
                //               Expanded(
                //                   child: Container(
                //                       child: myTextWidget("Present", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 10.0,
                //       ),
                //       Expanded(
                //         child: Container(
                //           padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                //           clipBehavior: Clip.antiAlias,
                //           decoration: BoxDecoration(
                //             boxShadow: [BoxShadow(
                //               color: ColorResources.darkGreyColor.withOpacity(0.2),
                //               spreadRadius: 1,
                //               blurRadius: 3,
                //               offset: Offset(0, 0),
                //             )],
                //             borderRadius: BorderRadius.all(Radius.circular(10.0)),
                //             color: ColorResources.whiteColor,
                //           ),
                //           child: Row(
                //             children: [
                //               Radio(
                //                 activeColor: ColorResources.atruleGreenColor,
                //                 value: 1,
                //                 groupValue: _radioValue,
                //                 onChanged: _handleRadioValueChange,
                //               ),
                //               Expanded(
                //                   child: Container(
                //                       child: myTextWidget("Absent", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
                //               )
                //             ],
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 10.0,
                // ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 10.0),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Container(
                //           padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                //           clipBehavior: Clip.antiAlias,
                //           decoration: BoxDecoration(
                //             boxShadow: [BoxShadow(
                //               color: ColorResources.darkGreyColor.withOpacity(0.2),
                //               spreadRadius: 1,
                //               blurRadius: 3,
                //               offset: Offset(0, 0),
                //             )],
                //             borderRadius: BorderRadius.all(Radius.circular(10.0)),
                //             color: ColorResources.whiteColor,
                //           ),
                //           child: Row(
                //             children: [
                //               Radio(
                //                 activeColor: ColorResources.atruleGreenColor,
                //                 value: 2,
                //                 groupValue: _radioValue,
                //                 onChanged: _handleRadioValueChange,
                //               ),
                //               Expanded(
                //                   child: Container(
                //                       child: myTextWidget("Leave", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 10.0,
                //       ),
                //       Expanded(
                //         child: Container(
                //           padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                //           clipBehavior: Clip.antiAlias,
                //           decoration: BoxDecoration(
                //             boxShadow: [BoxShadow(
                //               color: ColorResources.darkGreyColor.withOpacity(0.2),
                //               spreadRadius: 1,
                //               blurRadius: 3,
                //               offset: Offset(0, 0),
                //             )],
                //             borderRadius: BorderRadius.all(Radius.circular(10.0)),
                //             color: ColorResources.whiteColor,
                //           ),
                //           child: Row(
                //             children: [
                //               Radio(
                //                 activeColor: ColorResources.atruleGreenColor,
                //                 value: 3,
                //                 groupValue: _radioValue,
                //                 onChanged: _handleRadioValueChange,
                //               ),
                //               Expanded(
                //                   child: Container(
                //                       child: myTextWidget("Holiday", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
                //               )
                //             ],
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: MyButton(
                          text: widget.check == 1 ? "Check-In" : "Check-Out",
                          textColor: ColorResources.whiteColor,
                          buttonColor: ColorResources.atruleGreenColor,
                          splashColor: ColorResources.mediumSeaGreenColorLight,
                          onPress: (){
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
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