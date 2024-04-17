import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  const Example({Key key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorResources.darkGreyColor,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              "",
              fit: BoxFit.fill,
              width: double.infinity,
              height: 200.0,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "",
              style: TextStyle(
                fontSize: 16,
                color: ColorResources.whiteColor,
                fontFamily: FontResources.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
