import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/image_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/screens/employee/navigation/employee_navigation_screen.dart';
import 'package:atrule_tech/screens/guest/guest_home.dart';
import 'package:atrule_tech/util/util.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'hr/hr_home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController cEmail = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  int employee = 0, hr = 0;

  Future<bool> onWillPop() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (BuildContext context) => GuestHome()));
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          backgroundColor: ColorResources.whiteColor,
          appBar: AppBar(
            elevation: 0.0,
            title: Text(
              "Employees Login",
              style: TextStyle(
                fontSize: 16,
                color: ColorResources.whiteColor,
                fontFamily: FontResources.bold,
              ),
            ),
            iconTheme: IconThemeData(color: ColorResources.whiteColor),
            backgroundColor: ColorResources.atruleGreenColor,
            brightness: Brightness.dark,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (BuildContext context) => GuestHome())),
            ),
          ),
          body: SafeArea(
            child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Image.asset(
                      ImageResources.atruleIcon,
                      fit: BoxFit.fill,
                      width: 100.0,
                      height: 100.0,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                      child: Text(
                        StringResources.companySmallIntro,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorResources.atruleGreenColor,
                          fontFamily: FontResources.regular,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            inputField(
                                "Enter your email",
                                _emailFocusNode,
                                cEmail,
                                TextInputAction.next,
                                TextInputType.emailAddress,
                                'Email',
                                Icons.email_outlined,
                                'email',
                                context,
                                _emailFocusNode,
                                _passwordFocusNode),
                            SizedBox(height: 20),
                            inputField(
                                "Enter your password",
                                _passwordFocusNode,
                                cPassword,
                                TextInputAction.done,
                                TextInputType.text,
                                'Password',
                                Icons.vpn_key_outlined,
                                'password',
                                context,
                                _emailFocusNode,
                                _passwordFocusNode),
                            SizedBox(height: 20.0),
                            Row(
                              children: [
                                Expanded(
                                  child: myTextWidget("Employment Type:", 16.0, ColorResources.atruleGreenColor, FontResources.bold, TextAlign.left),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile(
                                    activeColor: ColorResources.atruleGreenColor,
                                    selectedTileColor: ColorResources.atruleGreenColor,
                                    tileColor: ColorResources.whiteColor,
                                    contentPadding: EdgeInsets.all(0.0),
                                    value: 1,
                                    groupValue: employee,
                                    onChanged: (value) {
                                      setState(() {
                                        hr = 0;
                                        employee = value;
                                      });
                                    },
                                    title: myTextWidget("Employee", 16.0, ColorResources.atruleGreenColor, FontResources.regular, TextAlign.left),
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile(
                                    activeColor: ColorResources.atruleGreenColor,
                                    selectedTileColor: ColorResources.atruleGreenColor,
                                    tileColor: ColorResources.whiteColor,
                                    contentPadding: EdgeInsets.all(0.0),
                                    value: 2,
                                    groupValue: hr,
                                    onChanged: (value) {
                                      setState(() {
                                        employee = 0;
                                        hr = value;
                                      });
                                    },
                                    title: myTextWidget("Hr", 16.0, ColorResources.atruleGreenColor, FontResources.regular, TextAlign.left),
                                  ),
                                )
                              ],
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
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
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
                                              if (_formKey.currentState.validate()) {
                                                _formKey.currentState.save();
                                                await showLoading();
                                                print(StringResources.email);
                                                print(StringResources.password);

                                                if(employee != 0 || hr != 0){
                                                  await addBoolToSF(StringResources.isLogin, true);
                                                  if(employee != 0){
                                                    await addIntToSF(StringResources.loginAs, StringResources.employee);

                                                    Navigator.of(context).pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                            context) =>
                                                                EmployeeNavigationScreen(selectedIndex: 0,)));
                                                  }
                                                  else{
                                                    await addIntToSF(StringResources.loginAs, StringResources.hr);
                                                    Navigator.of(context).pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                            context) =>
                                                                HRHomePage()));
                                                  }
                                                }
                                                else{
                                                  myToast("Please select employment type.");
                                                }
                                                await hideLoading();
                                              }
                                            },
                                            child: Text(
                                              'Login',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: ColorResources.whiteColor,
                                                fontFamily: FontResources.bold,
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
                            SizedBox(height: 20),
                            // Container(
                            //   clipBehavior: Clip.antiAlias,
                            //   width: double.infinity,
                            //   height: 56.0,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            //     color: ColorResources.whiteColor,
                            //   ),
                            //   margin: EdgeInsets.symmetric(horizontal: 20.0),
                            //   child: Row(
                            //     children: [
                            //       Expanded(
                            //         child: Column(
                            //           crossAxisAlignment: CrossAxisAlignment.stretch,
                            //           children: [
                            //             Expanded(
                            //               child: TextButton(
                            //                 style: ButtonStyle(
                            //                   overlayColor: MaterialStateProperty.all(ColorResources.atruleGreenColorLite),
                            //                   animationDuration: Duration(milliseconds: 3, microseconds: 0),
                            //                 ),
                            //                 onPressed: () async {
                            //                   await showLoading();
                            //                   Navigator.of(context).pushReplacement(MaterialPageRoute(
                            //                       builder: (BuildContext context) => GuestHome()));
                            //                   await hideLoading();
                            //                 },
                            //                 child: Text(
                            //                   'Continue as a guest',
                            //                   style: TextStyle(
                            //                     fontSize: 16,
                            //                     color: ColorResources.atruleGreenColor,
                            //                     fontFamily: FontResources.bold,
                            //                   ),
                            //                 ),
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
