import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/image_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class EmployeeProfileScreen extends StatefulWidget {
  @override
  _EmployeeProfileScreenState createState() => _EmployeeProfileScreenState();
}

class _EmployeeProfileScreenState extends State<EmployeeProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      // appBar: topAppBar("Profile"),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      color: ColorResources.atruleGreenColor,
                      child: Image.asset(
                          ImageResources.profileBack,
                          width: MediaQuery.of(context).size.width,
                          height: 150.0,
                          fit: BoxFit.contain
                      ),
                    ),
                    Positioned.fill(
                        bottom: -55,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 5.0,
                                        color: ColorResources.whiteColor
                                    ),
                                    color: ColorResources.whiteColor
                                ),
                                child: Image.asset("asset/profile.png", fit: BoxFit.fill,),
                              ),
                              Positioned(
                                right: -16.0,
                                bottom: 0.0,
                                child: MaterialButton(
                                  onPressed: () {},
                                  minWidth: 0,
                                  color: ColorResources.atruleGreenColor,
                                  textColor: ColorResources.atruleGreenColor,
                                  child: Icon(
                                    Icons.camera,
                                    size: 24,
                                    color: ColorResources.whiteColor,
                                  ),
                                  padding: EdgeInsets.all(8),
                                  shape: CircleBorder(),
                                ),
                              ),
                            ],
                          ),
                        )
                    )
                  ],
                ),
                SizedBox(
                  height: 65.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            child: myTextWidget(StringResources.employeeName, 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.center))
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            child: myTextWidget(StringResources.employeeDesignation, 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.center))
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(500000000)),
                    color: ColorResources.smokeWhiteColor
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        const VerticalDivider(
                          color: ColorResources.atruleGreenColor,
                          thickness: 10,
                          indent: 0,
                          endIndent: 0,
                          width: 10,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          Icons.email_rounded,
                          size: 24.0,
                          color: ColorResources.atruleGreenColor,
                        ),
                        Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            child: myTextWidget("Email", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            child: myTextWidget("email@email.com", 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                        ),
                        const VerticalDivider(
                          color: ColorResources.atruleGreenColor,
                          thickness: 10,
                          indent: 0,
                          endIndent: 0,
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(500000000)),
                      color: ColorResources.smokeWhiteColor
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        const VerticalDivider(
                          color: ColorResources.atruleGreenColor,
                          thickness: 10,
                          indent: 0,
                          endIndent: 0,
                          width: 10,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          Icons.phone_android_rounded,
                          size: 24.0,
                          color: ColorResources.atruleGreenColor,
                        ),
                        Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            child: myTextWidget("Contact Number", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            child: myTextWidget("+923123456789", 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                        ),
                        const VerticalDivider(
                          color: ColorResources.atruleGreenColor,
                          thickness: 10,
                          indent: 0,
                          endIndent: 0,
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(500000000)),
                      color: ColorResources.smokeWhiteColor
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        const VerticalDivider(
                          color: ColorResources.atruleGreenColor,
                          thickness: 10,
                          indent: 0,
                          endIndent: 0,
                          width: 10,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          Icons.credit_card_rounded,
                          size: 24.0,
                          color: ColorResources.atruleGreenColor,
                        ),
                        Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            child: myTextWidget("CNIC Number", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            child: myTextWidget("12345-1234567-1", 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                        ),
                        const VerticalDivider(
                          color: ColorResources.atruleGreenColor,
                          thickness: 10,
                          indent: 0,
                          endIndent: 0,
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(500000000)),
                      color: ColorResources.smokeWhiteColor
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        const VerticalDivider(
                          color: ColorResources.atruleGreenColor,
                          thickness: 10,
                          indent: 0,
                          endIndent: 0,
                          width: 10,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          Icons.account_balance_rounded,
                          size: 24.0,
                          color: ColorResources.atruleGreenColor,
                        ),
                        Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            child: myTextWidget("Account Number", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            child: myTextWidget("123456789123456", 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                        ),
                        const VerticalDivider(
                          color: ColorResources.atruleGreenColor,
                          thickness: 10,
                          indent: 0,
                          endIndent: 0,
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(500000000)),
                      color: ColorResources.smokeWhiteColor
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        const VerticalDivider(
                          color: ColorResources.atruleGreenColor,
                          thickness: 10,
                          indent: 0,
                          endIndent: 0,
                          width: 10,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          Icons.calendar_today_rounded,
                          size: 24.0,
                          color: ColorResources.atruleGreenColor,
                        ),
                        Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            child: myTextWidget("Date of Joining", 16.0, ColorResources.darkGreyColor, FontResources.bold, TextAlign.left)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                            child: myTextWidget("Month 15, Year", 16.0, ColorResources.darkGreyColor, FontResources.regular, TextAlign.left)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                        ),
                        const VerticalDivider(
                          color: ColorResources.atruleGreenColor,
                          thickness: 10,
                          indent: 0,
                          endIndent: 0,
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
