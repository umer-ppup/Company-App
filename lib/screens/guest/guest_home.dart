import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/image_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/models/service_model.dart';
import 'package:atrule_tech/screens/guest/services/desktop_dev_screen.dart';
import 'package:atrule_tech/screens/guest/services/graphic_dev_screen.dart';
import 'package:atrule_tech/screens/guest/services/mobile_dev_screen.dart';
import 'package:atrule_tech/screens/guest/services/seo_dev_screen.dart';
import 'package:atrule_tech/screens/guest/services/web_dev_screen.dart';
import 'package:atrule_tech/util/util.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class GuestHome extends StatefulWidget {
  const GuestHome({Key key}) : super(key: key);

  @override
  _GuestHomeState createState() => _GuestHomeState();
}

class _GuestHomeState extends State<GuestHome> {
  DateTime currentBackPressTime;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

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
    _controller = VideoPlayerController.asset("asset/video.mp4");

    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.play();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorResources.whiteColor,
        drawer: DrawerWidget(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: ColorResources.whiteColor,
                  width: double.infinity,
                  height: 300.0,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 300.0,
                        color: ColorResources.whiteColor,
                        child: FutureBuilder(
                          future: _initializeVideoPlayerFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) {
                              // If the VideoPlayerController has finished initialization, use
                              // the data it provides to limit the aspect ratio of the video.
                              return AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                // Use the VideoPlayer widget to display the video.
                                child: VideoPlayer(_controller),
                              );
                            } else {
                              // If the VideoPlayerController is still initializing, show a
                              // loading spinner.
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            width: double.infinity,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                boxShadow: [BoxShadow(
                                  color: ColorResources.darkGreyColor.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0, 0),
                                )],
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                color: ColorResources.atruleGreenColor.withOpacity(0.5)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                      color: Colors.transparent
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.dehaze_rounded, size: 24.0, color: ColorResources.whiteColor,),
                                    splashColor: ColorResources.whiteColor,
                                    focusColor: ColorResources.whiteColor,
                                    hoverColor: ColorResources.whiteColor,
                                    highlightColor: ColorResources.whiteColor,
                                    onPressed: (){
                                      _scaffoldKey.currentState.openDrawer();
                                    },
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    StringResources.companyName,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: ColorResources.whiteColor,
                                      fontFamily: FontResources.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                                  width: double.infinity,
                                  child: Text(
                                    "Smart Engineers Delivering",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: ColorResources.whiteColor,
                                      fontFamily: FontResources.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                                  width: double.infinity,
                                  child: DefaultTextStyle(
                                    style: const TextStyle(
                                      fontSize: 22.0,
                                      color: ColorResources.whiteColor,
                                      fontFamily: FontResources.bold,
                                    ),
                                    child: AnimatedTextKit(
                                      isRepeatingAnimation: true,
                                      repeatForever: true,
                                      pause: Duration(milliseconds: 2000),
                                      animatedTexts: [
                                        TypewriterAnimatedText('Smarter Solution'),
                                        TypewriterAnimatedText('Amazing UX Designs'),
                                        TypewriterAnimatedText('Promotional Digital Marketing')
                                      ]
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Our Services",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: ColorResources.atruleGreenColor,
                      fontFamily: FontResources.regular,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 70.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 5.0,
                  color: ColorResources.atruleGreenColor,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: FutureBuilder(
                    future: readJson("URL", "servicesData"),
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return Container(
                          height: 346.0,
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              ServicesModel serviceModel = snapshot.data[index];
                              int color;
                              if(index == 0){
                                color = 0xFF013966;
                              }
                              else if(index == 1){
                                color = 0xFF1199C0;
                              }
                              else if(index == 2){
                                color = 0xFF062C93;
                              }
                              else if(index == 3){
                                color = 0xFF017777;
                              }
                              else if(index == 4){
                                color = 0xFF17A2B8;
                              }
                              return GestureDetector(
                                onTap: (){
                                  if(index == 0){
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) => DesktopDevScreen()));
                                  }
                                  else if(index == 1){
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) => WebDevScreen()));
                                  }
                                  else if(index == 2){
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) => MobileDevScreen()));
                                  }
                                  else if(index == 3){
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) => SeoDevScreen()));
                                  }
                                  else if(index == 4){
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (BuildContext context) => GraphicDevScreen()));
                                  }
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.48,
                                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                                  height: 346.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    boxShadow: [BoxShadow(
                                      color: ColorResources.darkGreyColor.withOpacity(0.1),
                                      spreadRadius: 3,
                                      blurRadius: 3,
                                      offset: Offset(0, 0),
                                    )],
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    color: Color(color),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                        child: Text(
                                          serviceModel.heading != null ? serviceModel.heading : "",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: ColorResources.whiteColor,
                                            fontFamily: FontResources.regular,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                        child: Text(
                                          serviceModel.detail != null ? serviceModel.detail : "",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: ColorResources.whiteColor,
                                            fontFamily: FontResources.thin,
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        serviceModel.image,
                                        fit: BoxFit.fill,
                                        width: 100.0,
                                        height: 100.0,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      else if(snapshot.hasError){
                        return Center(child: Text(
                          "${snapshot.error}",
                          style: TextStyle(
                            fontSize: 16,
                            color: ColorResources.atruleGreenColor,
                            fontFamily: FontResources.bold,
                          ),
                        )
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Our Achievements",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: ColorResources.atruleGreenColor,
                      fontFamily: FontResources.regular,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 100.0,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  height: 5.0,
                  color: ColorResources.atruleGreenColor,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 190.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //     color: ColorResources.atruleGreenColor,
                          //     width: 0.5
                          // ),
                          boxShadow: [BoxShadow(
                            color: ColorResources.darkGreyColor.withOpacity(0.1),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: Offset(0, 0),
                          )],
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: ColorResources.whiteColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10.0),
                              child: SvgPicture.asset(
                                ImageResources.happyIcon,
                                semanticsLabel: StringResources.happyClient,
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                '25 +',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 28,
                                  color: ColorResources.atruleGreenColor,
                                  fontFamily: FontResources.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                              color: ColorResources.atruleGreenColor,
                              child: Text(
                                StringResources.happyClient,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ColorResources.whiteColor,
                                  fontFamily: FontResources.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 190.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //     color: ColorResources.atruleGreenColor,
                          //     width: 0.5
                          // ),
                          boxShadow: [BoxShadow(
                            color: ColorResources.darkGreyColor.withOpacity(0.1),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: Offset(0, 0),
                          )],
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: ColorResources.whiteColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10.0),
                              child: SvgPicture.asset(
                                ImageResources.hourIcon,
                                semanticsLabel: StringResources.devHour,
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                '120k +',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 28,
                                  color: ColorResources.atruleGreenColor,
                                  fontFamily: FontResources.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                              color: ColorResources.atruleGreenColor,
                              child: Text(
                                StringResources.devHour,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ColorResources.whiteColor,
                                  fontFamily: FontResources.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 190.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //     color: ColorResources.atruleGreenColor,
                          //     width: 0.5
                          // ),
                          boxShadow: [BoxShadow(
                            color: ColorResources.darkGreyColor.withOpacity(0.1),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: Offset(0, 0),
                          )],
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: ColorResources.whiteColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10.0),
                              child: SvgPicture.asset(
                                ImageResources.webAppIcon,
                                semanticsLabel: StringResources.webApp,
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                '50 +',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 28,
                                  color: ColorResources.atruleGreenColor,
                                  fontFamily: FontResources.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                              color: ColorResources.atruleGreenColor,
                              child: Text(
                                StringResources.webApp,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ColorResources.whiteColor,
                                  fontFamily: FontResources.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 190.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //     color: ColorResources.atruleGreenColor,
                          //     width: 0.5
                          // ),
                          boxShadow: [BoxShadow(
                            color: ColorResources.darkGreyColor.withOpacity(0.1),
                            spreadRadius: 3,
                            blurRadius: 3,
                            offset: Offset(0, 0),
                          )],
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: ColorResources.whiteColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10.0),
                              child: SvgPicture.asset(
                                ImageResources.mobAppIcon,
                                semanticsLabel: StringResources.mobApp,
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                '20 +',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 28,
                                  color: ColorResources.atruleGreenColor,
                                  fontFamily: FontResources.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                              color: ColorResources.atruleGreenColor,
                              child: Text(
                                StringResources.mobApp,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: ColorResources.whiteColor,
                                  fontFamily: FontResources.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 380.0,
                      child: Image.asset(
                        ImageResources.why_us_back,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 380.0,
                      color: ColorResources.atruleGreenColor.withOpacity(0.7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              StringResources.whyUs,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                color: ColorResources.whiteColor,
                                fontFamily: FontResources.regular,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width: 50.0,
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            height: 5.0,
                            color: ColorResources.whiteColor,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 30.0),
                            child: Text(
                              StringResources.whyUsDetail,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorResources.whiteColor,
                                fontFamily: FontResources.regular,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
