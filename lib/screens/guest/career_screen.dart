import 'package:atrule_tech/models/opportunity_model.dart';
import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/image_resources.dart';
import 'package:atrule_tech/screens/guest/contact_us_screen.dart';
import 'package:atrule_tech/screens/guest/apply_job_screen.dart';
import 'package:atrule_tech/util/util.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class CareerScreen extends StatefulWidget {
  const CareerScreen({Key key}) : super(key: key);

  @override
  _CareerScreenState createState() => _CareerScreenState();
}

class _CareerScreenState extends State<CareerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      appBar: topBar("Career", context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Want to join us?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: ColorResources.atruleGreenColor,
                    fontFamily: FontResources.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Give your career right boost and land at your dream workspace.',
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
              Container(
                height: 450.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return index == 0
                        ? Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: ColorResources.darkGreyColor
                                      .withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: Offset(0, 0),
                                )
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: ColorResources.whiteColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  child: Image.asset(
                                    ImageResources.cvIcon,
                                    width: 150.0,
                                    height: 150.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 20.0),
                                  child: Text(
                                    "Send your resume for suitable openings.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: ColorResources.atruleGreenColor,
                                      fontFamily: FontResources.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    "Let us know about your skills, achievements and determination.",
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
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  width: double.infinity,
                                  height: 55.0,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    color: ColorResources.atruleGreenColor,
                                  ),
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Expanded(
                                              child: TextButton(
                                                style: ButtonStyle(
                                                  overlayColor:
                                                      MaterialStateProperty.all(
                                                          ColorResources
                                                              .atruleGreenColorLite),
                                                  animationDuration: Duration(
                                                      milliseconds: 3,
                                                      microseconds: 0),
                                                ),
                                                onPressed: () async {
                                                  await showLoading();
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              ApplyJobScreen()));
                                                  await hideLoading();
                                                },
                                                child: Text(
                                                  'Send Us Your CV',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: ColorResources
                                                        .whiteColor,
                                                    fontFamily:
                                                        FontResources.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                )
                              ],
                            ),
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: ColorResources.darkGreyColor
                                      .withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: Offset(0, 0),
                                )
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: ColorResources.whiteColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  child: Image.asset(
                                    ImageResources.bonusIcon,
                                    width: 150.0,
                                    height: 150.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 20.0),
                                  child: Text(
                                    "Get a valuable bonus for referring a friend.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: ColorResources.atruleGreenColor,
                                      fontFamily: FontResources.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    "You can receive bonus for just referring a friend. Get it now!",
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
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  width: double.infinity,
                                  height: 55.0,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    color: ColorResources.atruleGreenColor,
                                  ),
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Expanded(
                                              child: TextButton(
                                                style: ButtonStyle(
                                                  overlayColor:
                                                      MaterialStateProperty.all(
                                                          ColorResources
                                                              .atruleGreenColorLite),
                                                  animationDuration: Duration(
                                                      milliseconds: 3,
                                                      microseconds: 0),
                                                ),
                                                onPressed: () async {
                                                  await showLoading();
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              ContactUsScreen()));
                                                  await hideLoading();
                                                },
                                                child: Text(
                                                  'Contact Us Now',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: ColorResources
                                                        .whiteColor,
                                                    fontFamily:
                                                        FontResources.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                )
                              ],
                            ),
                          );
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: Text(
                  'Our Opportunities',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: ColorResources.atruleGreenColor,
                    fontFamily: FontResources.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: FutureBuilder(
                  future: readJson("URL", "ourOpportunitiesData"),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          OpportunityModel opportunityModel =
                              snapshot.data[index];
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 10.0),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: ColorResources.darkGreyColor
                                      .withOpacity(0.1),
                                  spreadRadius: 3,
                                  blurRadius: 3,
                                  offset: Offset(0, 0),
                                )
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: ColorResources.whiteColor,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  child: Image.asset(
                                    opportunityModel.image,
                                    width: 150.0,
                                    height: 150.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 20.0),
                                  child: Text(
                                    opportunityModel.title != null
                                        ? opportunityModel.title
                                        : "",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: ColorResources.atruleGreenColor,
                                      fontFamily: FontResources.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    opportunityModel.description != null
                                        ? opportunityModel.description
                                        : "",
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
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          "Education: ",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                ColorResources.atruleGreenColor,
                                            fontFamily: FontResources.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      Expanded(
                                        child: Text(
                                          opportunityModel.education != null
                                              ? opportunityModel.education
                                              : "",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                ColorResources.atruleGreenColor,
                                            fontFamily: FontResources.regular,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Text(
                                          "Experience:",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                ColorResources.atruleGreenColor,
                                            fontFamily: FontResources.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      Expanded(
                                        child: Text(
                                          opportunityModel.experience != null
                                              ? opportunityModel.experience
                                              : "",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                ColorResources.atruleGreenColor,
                                            fontFamily: FontResources.regular,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  width: double.infinity,
                                  height: 56.0,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    color: ColorResources.atruleGreenColor,
                                  ),
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Expanded(
                                              child: TextButton(
                                                style: ButtonStyle(
                                                  overlayColor:
                                                      MaterialStateProperty.all(
                                                          ColorResources
                                                              .atruleGreenColorLite),
                                                  animationDuration: Duration(
                                                      milliseconds: 3,
                                                      microseconds: 0),
                                                ),
                                                onPressed: () async {
                                                  await showLoading();
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              ApplyJobScreen()));
                                                  await hideLoading();
                                                },
                                                child: Text(
                                                  'Apply Now',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: ColorResources
                                                        .whiteColor,
                                                    fontFamily:
                                                        FontResources.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                )
                              ],
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        "${snapshot.error}",
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorResources.atruleGreenColor,
                          fontFamily: FontResources.bold,
                        ),
                      ));
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
