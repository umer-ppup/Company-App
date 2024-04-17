import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/util/util.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';

class HRHomePage extends StatefulWidget {
  @override
  _HRHomePageState createState() => _HRHomePageState();
}

class _HRHomePageState extends State<HRHomePage> {
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
                            Expanded(
                                child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10.0),
                                    child: myTextWidget(StringResources.atruleFullName, 16.0, ColorResources.whiteColor, FontResources.bold, TextAlign.center))
                            ),
                            MaterialButton(
                              onPressed: (){
                                logoutFunction(context);
                              },
                              minWidth: 0,
                              visualDensity: VisualDensity.compact,
                              color: ColorResources.whiteColor,
                              textColor: ColorResources.atruleGreenColor,
                              child: Icon(
                                Icons.logout_rounded,
                                size: 24,
                                color: ColorResources.atruleGreenColor,
                              ),
                              padding: EdgeInsets.all(10.0),
                              shape: CircleBorder(),
                            ),
                          ],
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
                                          child: myTextWidget("Bilal Zafar", 16.0, ColorResources.whiteColor, FontResources.bold, TextAlign.left)
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: myTextWidget("HR Manager", 16.0, ColorResources.whiteColor, FontResources.regular, TextAlign.left)
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
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 20,
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0, top: 10.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: ColorResources.atruleGreenColor,
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: RaisedButton(
                          onPressed: null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SvgPicture.asset("asset/phone_call.svg",
                                  width: 50, color: ColorResources.whiteColor),
                              Text(
                                'Attendance',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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