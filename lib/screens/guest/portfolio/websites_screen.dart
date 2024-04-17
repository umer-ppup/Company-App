import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/image_resources.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class WebsitesScreen extends StatefulWidget {
  const WebsitesScreen({Key key}) : super(key: key);

  @override
  _WebsitesScreenState createState() => _WebsitesScreenState();
}

class _WebsitesScreenState extends State<WebsitesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      appBar: topBar("Websites", context),
      body: Center(
        child: Image.asset(ImageResources.coming_soon,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            fit: BoxFit.contain),
      ),
    );
  }
}
