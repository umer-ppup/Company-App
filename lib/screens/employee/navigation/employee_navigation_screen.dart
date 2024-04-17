import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/screens/employee/navigation/profile/employee_profile_screen.dart';
import 'package:atrule_tech/screens/employee/navigation/home/employee_home_screen.dart';
import 'package:atrule_tech/util/util.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class EmployeeNavigationScreen extends StatefulWidget {
  int selectedIndex;
  EmployeeNavigationScreen({Key key, this.selectedIndex}) : super(key: key);
  @override
  _EmployeeNavigationScreenState createState() => _EmployeeNavigationScreenState();
}

class _EmployeeNavigationScreenState extends State<EmployeeNavigationScreen> {
  DateTime currentBackPressTime;
  var selected;
  //region bottom nav item tap call back function
  _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
      selected = index;
    });
  }//endregion

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      myToast("Press again to exit~!");
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selected = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: ColorResources.whiteColor,
        body: IndexedStack(
          index:selected,
          children: [
            EmployeeHomeScreen(),
            EmployeeProfileScreen()
          ],
        ),
        //region bottom navigation bar
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: StringResources.employeeTab1,
              backgroundColor: ColorResources.smokeWhiteColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: StringResources.employeeTab2,
              backgroundColor: ColorResources.smokeWhiteColor,
            )
          ],
          type: BottomNavigationBarType.fixed,
          iconSize: 24.0,
          elevation: 10.0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: ColorResources.smokeWhiteColor,
          selectedItemColor: ColorResources.atruleGreenColor,
          selectedLabelStyle: myTextStyle(16.0, ColorResources.whiteColor, FontResources.bold),
          unselectedLabelStyle: myTextStyle(16.0, ColorResources.whiteColor, FontResources.bold),
          unselectedItemColor: ColorResources.darkGreyColor,
          currentIndex: selected,
          onTap: (index) {
            _onItemTapped(index);
          },
        ),
        //endregion
      ),
    );
  }
}