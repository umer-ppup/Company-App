import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/util/util.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class LeaveApplyScreen extends StatefulWidget {
  const LeaveApplyScreen({Key key}) : super(key: key);

  @override
  _LeaveApplyScreenState createState() => _LeaveApplyScreenState();
}

class _LeaveApplyScreenState extends State<LeaveApplyScreen> {
  String selectedLeaveType;
  TextEditingController commentsTextController;
  DateTime startDate, endDate, selectedDate;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int days;

  selectStartDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: startDate != null ? startDate : DateTime.now(),
        currentDate: DateTime.now(),// Refer step 1
        firstDate: DateTime.now(),
        lastDate: DateTime(3000),
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
    if (picked != null && picked != startDate)
      setState(() {
        startDate = picked;
        if(endDate != null){
          days = endDate.difference(startDate).inDays + 1;
        }
      });
  }
  selectEndDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: endDate != null ? endDate : DateTime.now(),
        currentDate: DateTime.now(),// Refer step 1
        firstDate: DateTime.now(),
        lastDate: DateTime(3000),
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
    if (picked != null && picked != endDate)
      setState(() {
        endDate = picked;
        if(startDate != null){
          days = endDate.difference(startDate).inDays + 1;
        }
      });
  }
  selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate != null ? selectedDate : DateTime.now(),
        currentDate: DateTime.now(),// Refer step 1
        firstDate: DateTime.now(),
        lastDate: DateTime(3000),
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
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){FocusScope.of(context).requestFocus(new FocusNode());},
      child: Scaffold(
          appBar: topBar("Apply For Leave", context),
          backgroundColor: ColorResources.whiteColor,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: myTextWidget("Leave Type", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left)
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    leaveTypeDropdown(),
                    Visibility(
                      visible: selectedLeaveType != null ? (selectedLeaveType == StringResources.leaveTypes.last ? true : false) : false,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                                  child: myTextWidget("Start Date", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: selectedLeaveType != null ? (selectedLeaveType == StringResources.leaveTypes.last ? true : false) : false,
                      child: Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                                onTap: (){selectStartDate(context);},
                                child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.0,
                                            color: ColorResources.darkGreyColor
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        color: ColorResources.whiteColor
                                    ),
                                    child: myTextWidget(startDate == null ? "Select Start Date" : StringResources.myDateFormat.format(startDate), 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.center)),
                              )
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: selectedLeaveType != null ? (selectedLeaveType == StringResources.leaveTypes.last ? true : false) : false,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                                  child: myTextWidget("End Date", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: selectedLeaveType != null ? (selectedLeaveType == StringResources.leaveTypes.last ? true : false) : false,
                      child: Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                                onTap: (){selectEndDate(context);},
                                child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.0,
                                            color: ColorResources.darkGreyColor
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        color: ColorResources.whiteColor
                                    ),
                                    child: myTextWidget(endDate == null ? "Select End Date" : StringResources.myDateFormat.format(endDate), 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.center)),
                              )
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: selectedLeaveType != null ? (selectedLeaveType == StringResources.leaveTypes.last ? (days != null ? true : false) : false) : false,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  margin: EdgeInsets.only(top: 20.0),
                                  child: myTextWidget(days != null ? "Leave: $days ${days == 1 ? "day" : "days"}" : "", 16.0, ColorResources.atruleGreenColor, FontResources.regular, TextAlign.right))
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: selectedLeaveType != null ? (selectedLeaveType != StringResources.leaveTypes.last ? true : false) : false,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                                  child: myTextWidget("Date", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: selectedLeaveType != null ? (selectedLeaveType != StringResources.leaveTypes.last ? true : false) : false,
                      child: Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                                onTap: (){selectDate(context);},
                                child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.0,
                                            color: ColorResources.darkGreyColor
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                        color: ColorResources.whiteColor
                                    ),
                                    child: myTextWidget(selectedDate == null ? "Select Date" : StringResources.myDateFormat.format(selectedDate), 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.center)),
                              )
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
                                child: myTextWidget("Requester Comments", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left))
                        ),
                      ],
                    ),
                    Form(
                        key: formKey,
                        child: commentsFormField()),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                // side: BorderSide(color: Colors.red)
                              )
                          ),
                          backgroundColor: MaterialStateProperty.all(ColorResources.atruleGreenColor),
                          overlayColor: MaterialStateProperty.all(ColorResources.atruleGreenColorLite),
                          animationDuration: Duration(
                              milliseconds: 3,
                              microseconds: 0
                          ),
                        ),
                        onPressed: () {
                          if(formKey.currentState.validate()){
                            formKey.currentState.save();
                          }
                        },
                        child: myTextWidget("Apply", 16.0, ColorResources.whiteColor, FontResources.bold, TextAlign.center),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }

//region Leave Type Dropdown
Container leaveTypeDropdown() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    width: MediaQuery.of(context).size.width,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
        border: Border.all(
            width: 1.0,
            color: ColorResources.darkGreyColor
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: ColorResources.whiteColor
    ),
    child: DropdownButton<String>(
      hint:  myTextWidget("Select Leave Type", 16.0, ColorResources.darkGreyColor,
          FontResources.regular, TextAlign.left),
      value: selectedLeaveType,
      isExpanded: true,
      isDense: false,
      dropdownColor: ColorResources.whiteColor,
      style: myTextStyle(16.0, ColorResources.darkGreyColor, FontResources.regular),
      icon: Icon(Icons.keyboard_arrow_down, size: 24.0, color: ColorResources.darkGreyColor,),
      underline: Container(
        height: 1.0,
        color: ColorResources.whiteColor,
      ),
      onChanged: (String value) {
        setState(() {
          selectedLeaveType = value;
        });
      },
      items: StringResources.leaveTypes?.map((String position) {
        return  DropdownMenuItem<String>(
          value: position,
          child: Container(
            color: ColorResources.whiteColor,
            child: myTextWidget(position, 16.0, ColorResources.darkGreyColor,
                FontResources.regular, TextAlign.left),
          ),
        );
      })?.toList() ?? [],
    ),
  );
}
//endregion

// region Comments Field
  Container commentsFormField() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: TextFormField(
          controller: commentsTextController,
          textInputAction: TextInputAction.newline,
          autofocus: false,
          keyboardType: TextInputType.multiline,
          style: myTextStyle(16.0, ColorResources.darkGreyColor, FontResources.regular),
          maxLines: 5,
          cursorColor: ColorResources.atruleGreenColor,
          decoration: commonDecoration("", "Write your comments here..."),
          validator: (comment) {
            if (comment.isEmpty) {
              return "Please give some reason.";
            } else {
              return null;
            }
          }
      ),
    );
  }
// endregion
}