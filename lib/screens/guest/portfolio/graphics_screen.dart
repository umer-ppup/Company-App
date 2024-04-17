import 'package:atrule_tech/models/graphics_p_model.dart';
import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/util/util.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

import 'full_screen.dart';

class GraphicsScreen extends StatefulWidget {
  const GraphicsScreen({Key key}) : super(key: key);

  @override
  _GraphicsScreenState createState() => _GraphicsScreenState();
}

class _GraphicsScreenState extends State<GraphicsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      appBar: topBar("Graphics", context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: FutureBuilder(
              future: readJson("URL", "graphicsPortfolioData"),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      GraphicsPModel graphicsPModel = snapshot.data[index];
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
                                        imagePath: graphicsPModel.image,
                                      ),
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  graphicsPModel.image,
                                  fit: BoxFit.fill,
                                ),
                              ),
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
        ),
      ),
    );
  }
}
