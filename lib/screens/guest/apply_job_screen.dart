import 'dart:io';

import 'package:atrule_tech/resources/image_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/models/position_model.dart';
import 'package:atrule_tech/models/city_model.dart';
import 'package:atrule_tech/util/util.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';

class ApplyJobScreen extends StatefulWidget {
  const ApplyJobScreen({Key key}) : super(key: key);

  @override
  _ApplyJobScreenState createState() => _ApplyJobScreenState();
}

class _ApplyJobScreenState extends State<ApplyJobScreen> {
  final _formKeyApplyNow = GlobalKey<FormState>();

  List<PositionsModel> positions = new List<PositionsModel>();
  List<CitiesModel> cities = new List<CitiesModel>();
  PositionsModel selectedPosition;
  CitiesModel selectedCity;

  TextEditingController cFirstName = TextEditingController();
  TextEditingController cLastName = TextEditingController();
  TextEditingController cEmail = TextEditingController();
  TextEditingController cMobile = TextEditingController();
  TextEditingController cLinkedInUrl = TextEditingController();
  TextEditingController cStrength = TextEditingController();
  TextEditingController cWeakness = TextEditingController();
  TextEditingController cFutureGoals = TextEditingController();
  TextEditingController cHearAbout = TextEditingController();

  FocusNode _firstNameFocusNode = FocusNode();
  FocusNode _lastNameFocusNode = FocusNode();
  FocusNode _emailNumberFocusNode = FocusNode();
  FocusNode _mobileFocusNode = FocusNode();
  FocusNode _linkedInUrlFocusNode = FocusNode();
  FocusNode _strengthFocusNode = FocusNode();
  FocusNode _weaknessFocusNode = FocusNode();
  FocusNode _futureGoalsNumberFocusNode = FocusNode();
  FocusNode _hearAboutFocusNode = FocusNode();

  File selectedFile;
  Response response;
  String progress;
  Dio dio = new Dio();

  selectFile() async {
    // selectedFile = await FilePicker.getFile(
    //   type: FileType.custom,
    //   allowedExtensions: ['jpg', 'pdf', 'mp4'],
    //   //allowed extension to choose
    // );

    //for file_picker plugin version 2 or 2+
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['doc', 'docx', 'pdf'],
      //allowed extension to choose
    );

    if (result != null) {
      //if there is selected file
      selectedFile = File(result.files.single.path);
    }

    setState(() {}); //update the UI so that file name is shown
  }

  uploadFile() async {
    String uploadUrl = "http://192.168.0.112/test/file_upload.php";
    //dont use http://localhost , because emulator don't get that address
    //instead use your local IP address or use live URL
    //hit "ipConfig" in windows or "ip a" in linux to get you local IP

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(selectedFile.path,
          filename: basename(selectedFile.path)
          //show only filename from path
          ),
    });

    response = await dio.post(
      uploadUrl,
      data: formData,
      onSendProgress: (int sent, int total) {
        String percentage = (sent / total * 100).toStringAsFixed(2);
        setState(() {
          progress = "$sent" +
              " Bytes of " "$total Bytes - " +
              percentage +
              " % uploaded";
          //update the progress
        });
      },
    );

    if (response.statusCode == 200) {
      print(response.toString());
      //print response from server
    } else {
      print("Error during connection to server.");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson("URL", "positionsData").then((valuePosition) {
      setState(() {
        positions = valuePosition;
        //selectedPosition = positions[0];
      });
      readJson("URL", "citiesData").then((valueCity) {
        setState(() {
          cities = valueCity;
          //selectedCity = cities[0];
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: ColorResources.whiteColor,
        appBar: topBar("Apply Now", context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0.0),
                          bottomLeft: Radius.elliptical(500.0, 100.0),
                          bottomRight: Radius.elliptical(500.0, 100.0),
                          topRight: Radius.circular(0.0),
                        ),
                        color: ColorResources.whiteColor,
                      ),
                      child: Image.asset(
                        ImageResources.applyBack,
                        width: MediaQuery.of(context).size.width,
                        height: 250.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250.0,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0.0),
                          bottomLeft: Radius.elliptical(500.0, 100.0),
                          bottomRight: Radius.elliptical(500.0, 100.0),
                          topRight: Radius.circular(0.0),
                        ),
                        color: ColorResources.darkGreyColor.withOpacity(0.5),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Join Atrule Now",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          color: ColorResources.whiteColor,
                          fontFamily: FontResources.bold,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ColorResources.darkGreyColor.withOpacity(0.1),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: Offset(0, 0),
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: ColorResources.whiteColor,
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          width: double.infinity,
                          color: ColorResources.dodgerBlue,
                          child: Text(
                            "Pre Interview Information:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorResources.whiteColor,
                              fontFamily: FontResources.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                          width: double.infinity,
                          color: ColorResources.whiteColor,
                          child: Text(
                            "Applied For:",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorResources.atruleGreenColor,
                              fontFamily: FontResources.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          width: double.infinity,
                          child: DropdownButton<PositionsModel>(
                            hint: Text(
                              "Select position",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorResources.atruleGreenColor,
                                fontFamily: FontResources.regular,
                              ),
                            ),
                            value: selectedPosition,
                            isExpanded: true,
                            isDense: false,
                            dropdownColor: ColorResources.whiteColor,
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorResources.atruleGreenColor,
                              fontFamily: FontResources.regular,
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              size: 24.0,
                              color: ColorResources.atruleGreenColor,
                            ),
                            underline: Container(
                              height: 1.0,
                              color: ColorResources.atruleGreenColor,
                              margin: EdgeInsets.only(top: 50.0),
                            ),
                            onChanged: (PositionsModel value) {
                              setState(() {
                                selectedPosition = value;
                              });
                            },
                            items: positions?.map((PositionsModel position) {
                                  return DropdownMenuItem<PositionsModel>(
                                    value: position,
                                    child: Container(
                                      color: ColorResources.whiteColor,
                                      child: Text(
                                        position.position,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              ColorResources.atruleGreenColor,
                                          fontFamily: FontResources.regular,
                                        ),
                                      ),
                                    ),
                                  );
                                })?.toList() ??
                                [],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20.0),
                          width: double.infinity,
                          color: ColorResources.whiteColor,
                          child: Text(
                            "City:",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorResources.atruleGreenColor,
                              fontFamily: FontResources.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          width: double.infinity,
                          child: DropdownButton<CitiesModel>(
                            hint: Text(
                              "Select city",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorResources.atruleGreenColor,
                                fontFamily: FontResources.regular,
                              ),
                            ),
                            value: selectedCity,
                            isExpanded: true,
                            isDense: false,
                            dropdownColor: ColorResources.whiteColor,
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorResources.atruleGreenColor,
                              fontFamily: FontResources.regular,
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              size: 24.0,
                              color: ColorResources.atruleGreenColor,
                            ),
                            underline: Container(
                              height: 1.0,
                              color: ColorResources.atruleGreenColor,
                              margin: EdgeInsets.only(top: 50.0),
                            ),
                            onChanged: (CitiesModel value) {
                              setState(() {
                                selectedCity = value;
                              });
                            },
                            items: cities?.map((CitiesModel city) {
                                  return DropdownMenuItem<CitiesModel>(
                                    value: city,
                                    child: Container(
                                      color: ColorResources.whiteColor,
                                      child: Text(
                                        city.city,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              ColorResources.atruleGreenColor,
                                          fontFamily: FontResources.regular,
                                        ),
                                      ),
                                    ),
                                  );
                                })?.toList() ??
                                [],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          width: double.infinity,
                          color: ColorResources.dodgerBlue,
                          child: Text(
                            "Personal Information:",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorResources.whiteColor,
                              fontFamily: FontResources.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          child: Form(
                            key: _formKeyApplyNow,
                            child: Column(
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: inputFieldApplyNow(
                                      "First Name",
                                      _firstNameFocusNode,
                                      cFirstName,
                                      TextInputAction.next,
                                      TextInputType.text,
                                      'First Name',
                                      'first_name',
                                      context,
                                      _firstNameFocusNode,
                                      _lastNameFocusNode,
                                      _emailNumberFocusNode,
                                      _mobileFocusNode,
                                      _linkedInUrlFocusNode),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: inputFieldApplyNow(
                                      "Last Name",
                                      _lastNameFocusNode,
                                      cLastName,
                                      TextInputAction.next,
                                      TextInputType.text,
                                      'Last Name',
                                      'last_name',
                                      context,
                                      _firstNameFocusNode,
                                      _lastNameFocusNode,
                                      _emailNumberFocusNode,
                                      _mobileFocusNode,
                                      _linkedInUrlFocusNode),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: inputFieldApplyNow(
                                      "Email Address",
                                      _emailNumberFocusNode,
                                      cEmail,
                                      TextInputAction.next,
                                      TextInputType.text,
                                      'Email Address',
                                      'email',
                                      context,
                                      _firstNameFocusNode,
                                      _lastNameFocusNode,
                                      _emailNumberFocusNode,
                                      _mobileFocusNode,
                                      _linkedInUrlFocusNode),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: inputFieldApplyNow(
                                      "Mobile",
                                      _mobileFocusNode,
                                      cMobile,
                                      TextInputAction.next,
                                      TextInputType.text,
                                      'Mobile',
                                      'mobile',
                                      context,
                                      _firstNameFocusNode,
                                      _lastNameFocusNode,
                                      _emailNumberFocusNode,
                                      _mobileFocusNode,
                                      _linkedInUrlFocusNode),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: inputFieldApplyNow(
                                      "LinkedIn Url",
                                      _linkedInUrlFocusNode,
                                      cLinkedInUrl,
                                      TextInputAction.done,
                                      TextInputType.text,
                                      'LinkedIn Url',
                                      'linked_url',
                                      context,
                                      _firstNameFocusNode,
                                      _lastNameFocusNode,
                                      _emailNumberFocusNode,
                                      _mobileFocusNode,
                                      _linkedInUrlFocusNode),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  width: double.infinity,
                                  color: ColorResources.whiteColor,
                                  child: Text(
                                    "Resume:",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: ColorResources.atruleGreenColor,
                                      fontFamily: FontResources.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 20.0),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    border: Border.all(
                                        color: ColorResources.atruleGreenColor,
                                        width: 1.0),
                                    color: ColorResources.whiteColor,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Text(
                                            selectedFile == null
                                                ? "Choose File"
                                                : basename(selectedFile.path),
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: ColorResources
                                                  .atruleGreenColor,
                                              fontFamily: FontResources.regular,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            color: ColorResources
                                                .atruleGreenColor),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.attach_file,
                                            size: 24.0,
                                            color: ColorResources.whiteColor,
                                          ),
                                          splashColor:
                                              ColorResources.whiteColor,
                                          focusColor: ColorResources.whiteColor,
                                          hoverColor: ColorResources.whiteColor,
                                          highlightColor:
                                              ColorResources.whiteColor,
                                          onPressed: () {
                                            selectFile();
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10.0),
                                  width: double.infinity,
                                  color: ColorResources.dodgerBlue,
                                  child: Text(
                                    "More Information:",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: ColorResources.whiteColor,
                                      fontFamily: FontResources.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  width: double.infinity,
                                  color: ColorResources.whiteColor,
                                  child: Text(
                                    "Lists your strengths:",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: ColorResources.atruleGreenColor,
                                      fontFamily: FontResources.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: inputFieldApplyNowBlocks(
                                      "Enter your Strengths",
                                      _strengthFocusNode,
                                      cStrength,
                                      TextInputAction.newline,
                                      TextInputType.multiline,
                                      '',
                                      'strength',
                                      context,
                                      _strengthFocusNode,
                                      _weaknessFocusNode,
                                      _futureGoalsNumberFocusNode,
                                      _hearAboutFocusNode),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  width: double.infinity,
                                  color: ColorResources.whiteColor,
                                  child: Text(
                                    "Lists your Weakness:",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: ColorResources.atruleGreenColor,
                                      fontFamily: FontResources.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: inputFieldApplyNowBlocks(
                                      "Enter your Weakness",
                                      _weaknessFocusNode,
                                      cWeakness,
                                      TextInputAction.newline,
                                      TextInputType.multiline,
                                      '',
                                      'weakness',
                                      context,
                                      _strengthFocusNode,
                                      _weaknessFocusNode,
                                      _futureGoalsNumberFocusNode,
                                      _hearAboutFocusNode),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  width: double.infinity,
                                  color: ColorResources.whiteColor,
                                  child: Text(
                                    "What are your Future Goals?",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: ColorResources.atruleGreenColor,
                                      fontFamily: FontResources.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: inputFieldApplyNowBlocks(
                                      "Enter your Future Goals",
                                      _futureGoalsNumberFocusNode,
                                      cFutureGoals,
                                      TextInputAction.newline,
                                      TextInputType.multiline,
                                      '',
                                      'future_goals',
                                      context,
                                      _strengthFocusNode,
                                      _weaknessFocusNode,
                                      _futureGoalsNumberFocusNode,
                                      _hearAboutFocusNode),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  width: double.infinity,
                                  color: ColorResources.whiteColor,
                                  child: Text(
                                    "How did you hear about atrule:",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: ColorResources.atruleGreenColor,
                                      fontFamily: FontResources.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: inputFieldApplyNowBlocks(
                                      "Where did you hear about us?",
                                      _hearAboutFocusNode,
                                      cHearAbout,
                                      TextInputAction.newline,
                                      TextInputType.multiline,
                                      '',
                                      'hear_about',
                                      context,
                                      _strengthFocusNode,
                                      _weaknessFocusNode,
                                      _futureGoalsNumberFocusNode,
                                      _hearAboutFocusNode),
                                ),
                                SizedBox(height: 30),
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
                                      EdgeInsets.symmetric(horizontal: 40.0),
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
                                                  if (_formKeyApplyNow
                                                      .currentState
                                                      .validate()) {
                                                    _formKeyApplyNow
                                                        .currentState
                                                        .save();
                                                    if (selectedPosition ==
                                                            null ||
                                                        selectedCity == null) {
                                                      if (selectedPosition ==
                                                              null &&
                                                          selectedCity ==
                                                              null) {
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "Please select position and city.",
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity:
                                                                ToastGravity
                                                                    .CENTER,
                                                            timeInSecForIosWeb:
                                                                1,
                                                            backgroundColor:
                                                                ColorResources
                                                                    .tomatoColor,
                                                            textColor:
                                                                ColorResources
                                                                    .whiteColor,
                                                            fontSize: 16.0);
                                                      } else if (selectedPosition ==
                                                          null) {
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "Please select position.",
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity:
                                                                ToastGravity
                                                                    .CENTER,
                                                            timeInSecForIosWeb:
                                                                1,
                                                            backgroundColor:
                                                                ColorResources
                                                                    .tomatoColor,
                                                            textColor:
                                                                ColorResources
                                                                    .whiteColor,
                                                            fontSize: 16.0);
                                                      } else {
                                                        Fluttertoast.showToast(
                                                            msg:
                                                                "Please select city.",
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity:
                                                                ToastGravity
                                                                    .CENTER,
                                                            timeInSecForIosWeb:
                                                                1,
                                                            backgroundColor:
                                                                ColorResources
                                                                    .tomatoColor,
                                                            textColor:
                                                                ColorResources
                                                                    .whiteColor,
                                                            fontSize: 16.0);
                                                      }
                                                    } else {
                                                      await showLoading();

                                                      print(selectedPosition
                                                          .position);
                                                      print(selectedCity.city);
                                                      print(StringResources
                                                          .applyFirstName);
                                                      print(StringResources
                                                          .applyLastName);
                                                      print(StringResources
                                                          .applyEmail);
                                                      print(StringResources
                                                          .applyMobile);
                                                      print(StringResources
                                                          .applyLinkedIn);
                                                      print(StringResources
                                                          .applyStrength);
                                                      print(StringResources
                                                          .applyWeakness);
                                                      print(StringResources
                                                          .applyFutureGoals);
                                                      print(StringResources
                                                          .applyHearAbout);

                                                      await hideLoading();
                                                    }
                                                  }
                                                },
                                                child: Text(
                                                  'Submit',
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
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
