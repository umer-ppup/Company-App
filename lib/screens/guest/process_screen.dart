import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/image_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProcessScreen extends StatefulWidget {
  const ProcessScreen({Key key}) : super(key: key);

  @override
  _ProcessScreenState createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      appBar: topBar("Process", context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Our Process',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: ColorResources.atruleGreenColor,
                      fontFamily: FontResources.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'This is how we deliver high quality software to our clients.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorResources.atruleGreenColor,
                      fontFamily: FontResources.regular,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35.0, right: 10.0),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorResources.atruleGreenColor, width: 0.5),
                        borderRadius: BorderRadius.circular(2000.0),
                        color: ColorResources.whiteColor,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Text(
                              'Analyse',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: ColorResources.atruleGreenColor,
                                fontFamily: FontResources.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 200.0,
                            child: SvgPicture.asset(
                              ImageResources.AP1,
                              semanticsLabel: StringResources.mobApp,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10.0),
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: ColorResources.atruleGreenColor,
                        ),
                        child: Text(
                          '1',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            color: ColorResources.whiteColor,
                            fontFamily: FontResources.bold,
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35.0, right: 10.0),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorResources.atruleGreenColor, width: 0.5),
                        borderRadius: BorderRadius.circular(2000.0),
                        color: ColorResources.whiteColor,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Text(
                              'Brain Storming',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: ColorResources.atruleGreenColor,
                                fontFamily: FontResources.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 200.0,
                            child: SvgPicture.asset(
                              ImageResources.AP2,
                              semanticsLabel: StringResources.mobApp,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10.0),
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: ColorResources.atruleGreenColor,
                        ),
                        child: Text(
                          '2',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            color: ColorResources.whiteColor,
                            fontFamily: FontResources.bold,
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35.0, right: 10.0),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorResources.atruleGreenColor, width: 0.5),
                        borderRadius: BorderRadius.circular(2000.0),
                        color: ColorResources.whiteColor,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Text(
                              'Proto Typing',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: ColorResources.atruleGreenColor,
                                fontFamily: FontResources.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 200.0,
                            child: SvgPicture.asset(
                              ImageResources.AP3,
                              semanticsLabel: StringResources.mobApp,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10.0),
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: ColorResources.atruleGreenColor,
                        ),
                        child: Text(
                          '3',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            color: ColorResources.whiteColor,
                            fontFamily: FontResources.bold,
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35.0, right: 10.0),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorResources.atruleGreenColor, width: 0.5),
                        borderRadius: BorderRadius.circular(2000.0),
                        color: ColorResources.whiteColor,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Text(
                              'Development',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: ColorResources.atruleGreenColor,
                                fontFamily: FontResources.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 200.0,
                            child: SvgPicture.asset(
                              ImageResources.AP4,
                              semanticsLabel: StringResources.mobApp,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10.0),
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: ColorResources.atruleGreenColor,
                        ),
                        child: Text(
                          '4',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            color: ColorResources.whiteColor,
                            fontFamily: FontResources.bold,
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35.0, right: 10.0),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorResources.atruleGreenColor, width: 0.5),
                        borderRadius: BorderRadius.circular(2000.0),
                        color: ColorResources.whiteColor,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Text(
                              'Testing',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: ColorResources.atruleGreenColor,
                                fontFamily: FontResources.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 200.0,
                            child: SvgPicture.asset(
                              ImageResources.AP5,
                              semanticsLabel: StringResources.mobApp,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10.0),
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: ColorResources.atruleGreenColor,
                        ),
                        child: Text(
                          '5',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            color: ColorResources.whiteColor,
                            fontFamily: FontResources.bold,
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35.0, right: 10.0),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorResources.atruleGreenColor, width: 0.5),
                        borderRadius: BorderRadius.circular(2000.0),
                        color: ColorResources.whiteColor,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Text(
                              'Deliver To Client',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: ColorResources.atruleGreenColor,
                                fontFamily: FontResources.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 200.0,
                            child: SvgPicture.asset(
                              ImageResources.AP6,
                              semanticsLabel: StringResources.mobApp,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          )
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10.0),
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          color: ColorResources.atruleGreenColor,
                        ),
                        child: Text(
                          '6',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            color: ColorResources.whiteColor,
                            fontFamily: FontResources.bold,
                          ),
                        ))
                  ],
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
