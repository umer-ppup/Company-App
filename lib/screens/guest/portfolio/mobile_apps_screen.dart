import 'package:atrule_tech/models/mobile_p_model.dart';
import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/screens/guest/portfolio/full_screen.dart';
import 'package:atrule_tech/util/util.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class MobileAppsScreen extends StatefulWidget {
  const MobileAppsScreen({Key key}) : super(key: key);

  @override
  _MobileAppsScreenState createState() => _MobileAppsScreenState();
}

class _MobileAppsScreenState extends State<MobileAppsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      appBar: topBar("Mobile Apps", context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: FutureBuilder(
              future: readJson("URL", "mobileAppsPortfolioData"),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      MobilePModel mobilePModel = snapshot.data[index];
                      return Container(
                        width: double.infinity,
                        height: 200.0,
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color:
                                  ColorResources.darkGreyColor.withOpacity(0.1),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: Offset(0, 0),
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: ColorResources.whiteColor,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200.0,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FullScreen(
                                        imagePath: mobilePModel.image,
                                      ),
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  mobilePModel.image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10.0,
                              top: 10.0,
                              child: GestureDetector(
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorResources.atruleGreenColor,
                                  ),
                                  child: Icon(
                                    Icons.link,
                                    color: ColorResources.whiteColor,
                                    size: 32.0,
                                    semanticLabel: 'Link.',
                                  ),
                                ),
                                onTap: () {
                                  launchURL(mobilePModel.link);
                                },
                              ),
                            ),
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
        ),
      ),
    );
  }
}
