import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class FullScreen extends StatefulWidget {
  String imagePath;
  FullScreen({this.imagePath});
  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.whiteColor,
      appBar: topBar("", context),
      body: SafeArea(
        child: Container(
          child: InteractiveViewer(
            child: Image.asset(
              widget.imagePath,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
