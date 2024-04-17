import 'package:atrule_tech/models/tech_model.dart';
import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/util/util.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class TechnologiesScreen extends StatefulWidget {
  const TechnologiesScreen({Key key}) : super(key: key);

  @override
  _TechnologiesScreenState createState() => _TechnologiesScreenState();
}

class _TechnologiesScreenState extends State<TechnologiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      appBar: topBar("Technologies", context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: FutureBuilder(
              future: readJson("URL", "techData"),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      TechModel techModel = snapshot.data[index];
                      return Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 20.0),
                                    child: myTextWidget(techModel.techName != null ? techModel.techName : "",
                                        22.0,
                                        ColorResources.atruleGreenColor,
                                        FontResources.regular,
                                        TextAlign.left),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              height: 160.0,
                              child: ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                scrollDirection: Axis.horizontal,
                                itemCount: techModel.techNameList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100.0,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: ColorResources
                                                  .darkGreyColor
                                                  .withOpacity(0.1),
                                              spreadRadius: 3,
                                              blurRadius: 3,
                                              offset: Offset(0, 0),
                                            )
                                          ],
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          color: ColorResources.whiteColor,
                                        ),
                                        child: Image.asset(
                                          techModel.techNameList[index].image,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      myTextWidget(techModel.techNameList[index].name != null ? techModel.techNameList[index].name : "",
                                        16.0,
                                        ColorResources.atruleGreenColor,
                                        FontResources.regular,
                                        TextAlign.center)
                                    ],
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                      child: myTextWidget("${snapshot.error}",
                          16.0,
                          ColorResources.atruleGreenColor,
                          FontResources.bold,
                          TextAlign.center));
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