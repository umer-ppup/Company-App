import 'dart:async';
import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/image_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/screens/employee/navigation/employee_navigation_screen.dart';
import 'package:atrule_tech/screens/guest/guest_home.dart';
import 'package:atrule_tech/screens/hr/hr_home.dart';
import 'package:atrule_tech/util/util.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //region check login type
  checkLoginType() async {
    int type = await getIntValuesSF(StringResources.loginAs);
    if(type == StringResources.employee){
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (BuildContext context) => EmployeeNavigationScreen(selectedIndex: 0,)));
    }
    else if(type == StringResources.hr){
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (BuildContext context) => HRHomePage()));
    }
  }
  //endregion

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    Timer(Duration(seconds: 5), () {
      //region check login functionality
      getBoolValuesSF(StringResources.isLogin).then((value){
        if(value == false){
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (BuildContext context) => GuestHome()));
        }
        else{
          checkLoginType();
        }
      });
      //endregion
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //region App icon and app name
              Image.asset(
                ImageResources.atruleIcon,
                fit: BoxFit.fill,
                width: 100.0,
                height: 100.0,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: myTextWidget(StringResources.companyName, 16.0, ColorResources.atruleGreenColor, FontResources.bold, TextAlign.center),
                  )
                ],
              ),
              //endregion
            ],
          ),
        ),
      ),
    );
  }
}