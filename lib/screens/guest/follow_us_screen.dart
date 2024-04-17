import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/util/util.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:atrule_tech/models/follow_model.dart';
import 'package:flutter/material.dart';

class FollowUsScreen extends StatefulWidget {
  const FollowUsScreen({Key key}) : super(key: key);

  @override
  _FollowUsScreenState createState() => _FollowUsScreenState();
}

class _FollowUsScreenState extends State<FollowUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      appBar: topBar("Follow Us", context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: FutureBuilder(
              future: readJson("URL", "followUsData"),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 3 / 3,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0),
                    itemBuilder: (BuildContext context, int index) {
                      FollowModel followModel = snapshot.data[index];
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              launchURL(followModel.link);
                            },
                            child: Container(
                              width: 50,
                              height: 50.0,
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
                              child: Image.asset(
                                followModel.image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            followModel.name != null ? followModel.name : "",
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorResources.atruleGreenColor,
                              fontFamily: FontResources.regular,
                            ),
                          )
                        ],
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
