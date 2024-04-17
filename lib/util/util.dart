import 'dart:convert';
import 'package:atrule_tech/models/employees_model.dart';
import 'package:atrule_tech/models/attendance_model.dart';
import 'package:atrule_tech/models/graphics_p_model.dart';
import 'package:atrule_tech/models/mobile_p_model.dart';
import 'package:atrule_tech/models/opportunity_model.dart';
import 'package:atrule_tech/models/tech_model.dart';
import 'package:atrule_tech/models/web_p_model.dart';
import 'package:atrule_tech/models/event_model.dart';
import 'package:atrule_tech/models/follow_model.dart';
import 'package:atrule_tech/models/position_model.dart';
import 'package:atrule_tech/models/city_model.dart';
import 'package:atrule_tech/models/service_model.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/screens/guest/guest_home.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/services.dart';
import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';

//region function to store a boolean into shared preferences
addBoolToSF(String key, bool c) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, c);
}
addIntToSF(String key, int c) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt(key, c);
}
//endregion

//region function to read a boolean from shared preferences
Future<bool> getBoolValuesSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool boolValue = false;
  if(prefs.containsKey(key)){
    boolValue = prefs.getBool(key);
  }
  return boolValue;
}

Future<int> getIntValuesSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int intValue = 0;
  if(prefs.containsKey(key)){
    intValue = prefs.getInt(key);
  }
  return intValue;
}
//endregion

//region input focus change function
void fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
//endregion

//region show and hide functions for progress dialog
Future showLoading() async {
  await EasyLoading.show(status: "Please wait...");
}

Future hideLoading() async {
  await EasyLoading.dismiss();
}
//endregion

//region open map with directions code
Future<void> launchURL(String url) async {
  await showLoading();
  if (await canLaunch(url)) {
    await hideLoading();
    await launch(url);
  } else {
    await hideLoading();
    Fluttertoast.showToast(
        msg: "Error: Could not open the link.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorResources.tomatoColor,
        textColor: ColorResources.whiteColor,
        fontSize: 16.0);
  }
}
//endregion

//region open map with directions code
Future<void> launchMAP(String lat, String lon) async {
  String googleUrl = 'https://www.google.com/maps/@$lat,$lon, 16z';
  await showLoading();
  if (await canLaunch(googleUrl)) {
    await hideLoading();
    await launch(googleUrl);
  } else {
    await hideLoading();
    Fluttertoast.showToast(
        msg: "Error: Could not open the MAP.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorResources.tomatoColor,
        textColor: ColorResources.whiteColor,
        fontSize: 16.0);
  }
}
//endregion

//region api call function to fetch json data
Future readJson(String url, String type) async {
  if (StringResources.isOnline) {
    return https.get(Uri.parse(url)).then((https.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }

      if (type == "graphicsPortfolioData") {
        return GraphicsPModel.fromJson(json.decode(response.body));
      } else if (type == "mobileAppsPortfolioData") {
        return MobilePModel.fromJson(json.decode(response.body));
      } else if (type == "webPortfolioData") {
        return WebPModel.fromJson(json.decode(response.body));
      } else if (type == "techData") {
        return TechModel.fromJson(json.decode(response.body));
      } else if (type == "eventData") {
        return EventModel.fromJson(json.decode(response.body));
      } else if (type == "ourOpportunitiesData") {
        return OpportunityModel.fromJson(json.decode(response.body));
      } else if (type == "followUsData") {
        return FollowModel.fromJson(json.decode(response.body));
      } else if (type == "positionsData") {
        return PositionsModel.fromJson(json.decode(response.body));
      } else if (type == "citiesData") {
        return CitiesModel.fromJson(json.decode(response.body));
      } else if (type == "servicesData") {
        return ServicesModel.fromJson(json.decode(response.body));
      }
    });
  } else {
    List dataList;

    final String response = await rootBundle.loadString("asset/data.json");
    var data = await json.decode(response);

    if (type == "graphicsPortfolioData") {
      var result = data["graphicsPortfolioData"] as List;
      dataList = result
          .map<GraphicsPModel>((json) => GraphicsPModel.fromJson(json))
          .toList();
    } else if (type == "mobileAppsPortfolioData") {
      var result = data["mobileAppsPortfolioData"] as List;
      dataList = result
          .map<MobilePModel>((json) => MobilePModel.fromJson(json))
          .toList();
    } else if (type == "webPortfolioData") {
      var result = data["webPortfolioData"] as List;
      dataList =
          result.map<WebPModel>((json) => WebPModel.fromJson(json)).toList();
    } else if (type == "techData") {
      var result = data["techData"] as List;
      dataList =
          result.map<TechModel>((json) => TechModel.fromJson(json)).toList();
    } else if (type == "eventData") {
      var result = data["eventData"] as List;
      dataList =
          result.map<EventModel>((json) => EventModel.fromJson(json)).toList();
    } else if (type == "ourOpportunitiesData") {
      var result = data["ourOpportunitiesData"] as List;
      dataList = result
          .map<OpportunityModel>((json) => OpportunityModel.fromJson(json))
          .toList();
    } else if (type == "followUsData") {
      var result = data["followUsData"] as List;
      dataList = result
          .map<FollowModel>((json) => FollowModel.fromJson(json))
          .toList();
    } else if (type == "positionsData") {
      var result = data["positionsData"] as List;
      dataList = result
          .map<PositionsModel>((json) => PositionsModel.fromJson(json))
          .toList();
    } else if (type == "citiesData") {
      var result = data["citiesData"] as List;
      dataList = result
          .map<CitiesModel>((json) => CitiesModel.fromJson(json))
          .toList();
    } else if (type == "servicesData") {
      var result = data["servicesData"] as List;
      dataList = result
          .map<ServicesModel>((json) => ServicesModel.fromJson(json))
          .toList();
    }

    return dataList;
  }
}
//endregion

//region function to fetch json data
Future readJsonData(String url, String type) async {
  if (StringResources.isOnline) {
    return https.get(Uri.parse(url)).then((https.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }

      if (type == "employeesData") {
        return EmployeesModel.fromJson(json.decode(response.body));
      }
    });
  } else {
    List dataList;

    final String response =
        await rootBundle.loadString("asset/employees_data.json");
    var data = await json.decode(response);

    if (type == "employeesData") {
      var result = data["employeesData"] as List;
      dataList = result
          .map<EmployeesModel>((json) => EmployeesModel.fromJson(json))
          .toList();
    }

    return dataList;
  }
}
//endregion

Future readJsonAttendanceData(String url, String type) async {
  if (StringResources.isOnline) {
    return https.get(Uri.parse(url)).then((https.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }

      return EmployeesModel.fromJson(json.decode(response.body));
    });
  } else {
    List<AttendanceModel> attendanceModelList = [];
    List<AttendanceHistory> attendanceList = [];

    final String response =
        await rootBundle.loadString("asset/employees_data.json");
    var data = await json.decode(response)["attendanceData"];

    List<AttendanceModel> result = data
        .map<AttendanceModel>((json) => AttendanceModel.fromJson(json))
        .toList();

    attendanceModelList
        .addAll(result.where((element) => element.empId == "emp_01"));

    attendanceModelList.forEach((element) {
      for (int i = 0; i < element.attendanceHistory.length; i++) {
        attendanceList.add(element.attendanceHistory[i]);
        print("attendance = ${attendanceList[i].attendance}");
      }
    });

    return attendanceList;
  }
}

//region my toast function
myToast(String text){
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: ColorResources.atruleGreenColor,
      textColor: ColorResources.whiteColor,
      fontSize: 16.0
  );
}
//endregion

//region Logout Function
logoutFunction(BuildContext context) async {
  await showLoading();
  await addBoolToSF(StringResources.isLogin, false);
  await addIntToSF(StringResources.loginAs, 0);
  Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (BuildContext context) => GuestHome()));
  await hideLoading();
}
//endregion

//region Input Decoration for input fields
InputDecoration commonDecoration(String label, String hint){
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
        width: 1.0,
        color: ColorResources.darkGreyColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
        width: 1.0,
        color: ColorResources.tomatoColor,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
        width: 1.0,
        color: ColorResources.tomatoColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
        width: 1.0,
        color: ColorResources.darkGreyColor,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
        width: 1.0,
        color: ColorResources.lightGreyColor,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(
        width: 1.0,
        color: ColorResources.darkGreyColor,
      ),
    ),
    labelText: label,
    labelStyle: myTextStyle(16.0, ColorResources.darkGreyColor, FontResources.regular),
    alignLabelWithHint: true,
    hintText: hint,
    hintStyle: myTextStyle(16.0, ColorResources.lightGreyColor, FontResources.regular),
    floatingLabelBehavior: FloatingLabelBehavior.always,
  );
}
//endregion