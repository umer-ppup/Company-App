import 'package:atrule_tech/resources/app_styles.dart';
import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/image_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/screens/guest/career_screen.dart';
import 'package:atrule_tech/screens/guest/contact_us_screen.dart';
import 'package:atrule_tech/screens/guest/events_screen.dart';
import 'package:atrule_tech/screens/guest/offices_screen.dart';
import 'package:atrule_tech/screens/guest/portfolio_screen.dart';
import 'package:atrule_tech/screens/guest/process_screen.dart';
import 'package:atrule_tech/screens/guest/services_screen.dart';
import 'package:atrule_tech/screens/guest/technologies_screen.dart';
import 'package:atrule_tech/screens/guest/follow_us_screen.dart';
import 'package:atrule_tech/screens/login_screen.dart';
import 'package:atrule_tech/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//region this is a widget for input field for form (Login)
Widget inputField(
    String hint,
    FocusNode focusNode,
    TextEditingController tController,
    TextInputAction action,
    TextInputType textType,
    String label,
    IconData icon,
    String validatorTxt,
    BuildContext context,
    FocusNode emailFocusNode,
    FocusNode passwordFocusNode) {
  return TextFormField(
    focusNode: focusNode,
    textInputAction: action,
    autofocus: false,
    keyboardType: textType,
    obscureText: validatorTxt == 'password' ? true : false,
    style: TextStyle(
      fontSize: 16,
      color: ColorResources.atruleGreenColor,
      fontFamily: FontResources.regular,
    ),
    cursorColor: ColorResources.atruleGreenColor,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorResources.atruleGreenColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorResources.atruleGreenColor,
        ),
      ),
      border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(10.0))),
      alignLabelWithHint: true,
      hintText: hint,
      hintStyle: TextStyle(
        fontSize: 16,
        color: ColorResources.lightGreyColor,
        fontFamily: FontResources.regular,
      ),
      labelText: label,
      labelStyle: TextStyle(
        fontSize: 16,
        color: ColorResources.atruleGreenColor,
        fontFamily: FontResources.regular,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      prefixIcon: Icon(
        icon,
        color: ColorResources.atruleGreenColor,
        size: 24.0,
      ),
    ),
    validator: (value) {
      if (validatorTxt == 'email') {
        if (value.isEmpty) {
          return 'Please enter an email address.';
        } else if (!StringResources.EmailValidatorRegExp.hasMatch(value)) {
          return 'Please enter valid email address.';
        } else {
          return null;
        }
      } else if (validatorTxt == 'password') {
        if (value.isEmpty) {
          return 'Please enter password.';
        } else if (value.length < 8) {
          return 'Password cannot less than 8 characters.';
        } else {
          return null;
        }
      } else {
        return null;
      }
    },
    onSaved: (value) {
      if (validatorTxt == 'email') {
        StringResources.email = value;
      } else if (validatorTxt == 'password') {
        StringResources.password = value;
      }
    },
    onFieldSubmitted: (_) {
      if (validatorTxt == 'email') {
        fieldFocusChange(context, emailFocusNode, passwordFocusNode);
      }
    },
  );
}
//endregion

//region this is a widget for navigation drawer
class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      color: ColorResources.whiteColor,
      child: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              createDrawerHeader(),
              InkWell(
                onTap: () async {
                  await showLoading();
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ServicesScreen()));
                  await hideLoading();
                },
                child: ListTile(
                  leading: Container(
                    width: 25.0,
                    height: 25.0,
                    child: SvgPicture.asset(
                      ImageResources.servicesIcon,
                      semanticsLabel: 'Services',
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: Text(
                    'Services',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorResources.atruleGreenColor,
                      fontFamily: FontResources.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await showLoading();
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => PortfolioScreen()));
                  await hideLoading();
                },
                child: ListTile(
                  leading: SvgPicture.asset(
                    ImageResources.portfolioIcon,
                    semanticsLabel: 'Portfolio',
                    width: 25.0,
                    height: 25.0,
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    'Portfolio',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorResources.atruleGreenColor,
                      fontFamily: FontResources.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await showLoading();
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ProcessScreen()));
                  await hideLoading();
                },
                child: ListTile(
                  leading: SvgPicture.asset(
                    ImageResources.processIcon,
                    semanticsLabel: 'Process',
                    width: 25.0,
                    height: 25.0,
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    'Process',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorResources.atruleGreenColor,
                      fontFamily: FontResources.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await showLoading();
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => TechnologiesScreen()));
                  await hideLoading();
                },
                child: ListTile(
                  leading: SvgPicture.asset(
                    ImageResources.technologiesIcon,
                    semanticsLabel: 'Technologies',
                    width: 25.0,
                    height: 25.0,
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    'Technologies',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorResources.atruleGreenColor,
                      fontFamily: FontResources.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await showLoading();
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ContactUsScreen()));
                  await hideLoading();
                },
                child: ListTile(
                  leading: SvgPicture.asset(
                    ImageResources.contactUsIcon,
                    semanticsLabel: 'Contact Us',
                    width: 25.0,
                    height: 25.0,
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    'Contact Us',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorResources.atruleGreenColor,
                      fontFamily: FontResources.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await showLoading();
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => OfficesScreen()));
                  await hideLoading();
                },
                child: ListTile(
                  leading: SvgPicture.asset(
                    ImageResources.officesIcon,
                    semanticsLabel: 'Offices',
                    width: 25.0,
                    height: 25.0,
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    'Offices',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorResources.atruleGreenColor,
                      fontFamily: FontResources.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await showLoading();
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => CareerScreen()));
                  await hideLoading();
                },
                child: ListTile(
                  leading: SvgPicture.asset(
                    ImageResources.careerIcon,
                    semanticsLabel: 'Career',
                    width: 25.0,
                    height: 25.0,
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    'Career',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorResources.atruleGreenColor,
                      fontFamily: FontResources.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await showLoading();
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => EventsScreen()));
                  await hideLoading();
                },
                child: ListTile(
                  leading: SvgPicture.asset(
                    ImageResources.eventsIcon,
                    semanticsLabel: 'Events',
                    width: 25.0,
                    height: 25.0,
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    'Events',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorResources.atruleGreenColor,
                      fontFamily: FontResources.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await showLoading();
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => FollowUsScreen()));
                  await hideLoading();
                },
                child: ListTile(
                  leading: SvgPicture.asset(
                    ImageResources.followIcon,
                    semanticsLabel: 'Follow Us',
                    width: 25.0,
                    height: 25.0,
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    'Follow Us',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorResources.atruleGreenColor,
                      fontFamily: FontResources.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  await showLoading();
                  Navigator.pop(context);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()));
                  await hideLoading();
                },
                child: ListTile(
                  leading: SvgPicture.asset(
                    ImageResources.employeeIcon,
                    semanticsLabel: 'Employees Login',
                    width: 25.0,
                    height: 25.0,
                    fit: BoxFit.fill,
                  ),
                  title: Text(
                    'Employees Login',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorResources.atruleGreenColor,
                      fontFamily: FontResources.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//endregion

//region this is a widget for navigation drawer header
Widget createDrawerHeader() {
  return Container(
    color: ColorResources.atruleGreenColor,
    child: DrawerHeader(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 36.0,
            backgroundColor: ColorResources.whiteColor,
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: Image.asset(
                ImageResources.atruleIcon,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            StringResources.companyName,
            style: TextStyle(
              fontSize: 16,
              color: ColorResources.whiteColor,
              fontFamily: FontResources.regular,
            ),
          ),
        ],
      ),
    ),
  );
}
//endregion

//region this is a widget for input field for form (Contact)
Widget inputFieldContact(
    String hint,
    FocusNode focusNode,
    TextEditingController tController,
    TextInputAction action,
    TextInputType textType,
    String label,
    IconData icon,
    String validatorTxt,
    BuildContext context,
    FocusNode nameFocusNode,
    FocusNode emailFocusNode,
    FocusNode contactNumberFocusNode,
    FocusNode budgetFocusNode,
    FocusNode descriptionFocusNode) {
  return TextFormField(
    focusNode: focusNode,
    textInputAction: action,
    autofocus: false,
    keyboardType: textType,
    // obscureText: validatorTxt == 'password' ? true : false,
    style: TextStyle(
      fontSize: 16,
      color: ColorResources.atruleGreenColor,
      fontFamily: FontResources.regular,
    ),
    cursorColor: ColorResources.atruleGreenColor,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorResources.atruleGreenColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorResources.atruleGreenColor,
        ),
      ),
      border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(10.0))),
      alignLabelWithHint: true,
      hintText: hint,
      hintStyle: TextStyle(
        fontSize: 16,
        color: ColorResources.lightGreyColor,
        fontFamily: FontResources.regular,
      ),
      labelText: label,
      labelStyle: TextStyle(
        fontSize: 16,
        color: ColorResources.atruleGreenColor,
        fontFamily: FontResources.regular,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      prefixIcon: Icon(
        icon,
        color: ColorResources.atruleGreenColor,
        size: 24.0,
      ),
    ),
    validator: (value) {
      if (validatorTxt == 'name') {
        if (value.isEmpty) {
          return 'Please enter your name.';
        } else {
          return null;
        }
      } else if (validatorTxt == 'email') {
        if (value.isEmpty) {
          return 'Please enter an email address.';
        } else if (!StringResources.EmailValidatorRegExp.hasMatch(value)) {
          return 'Please enter valid email address.';
        } else {
          return null;
        }
      } else if (validatorTxt == 'contactNumber') {
        if (value.isEmpty || value.length == 0) {
          return 'Please enter contact number.';
        } else if (!StringResources.kPhoneValidatorRegExp.hasMatch(value)) {
          return 'Please enter a valid contact number.';
        } else {
          return null;
        }
      } else if (validatorTxt == 'budget') {
        if (value.isEmpty) {
          return 'Please enter your budget.';
        } else if (double.parse(value) < 1) {
          return 'Budget should be greater than 0.';
        } else {
          return null;
        }
      } else if (validatorTxt == 'description') {
        if (value.isEmpty) {
          return 'Description cannot be empty.';
        } else {
          return null;
        }
      } else {
        return null;
      }
    },
    onSaved: (value) {
      if (validatorTxt == 'name') {
        StringResources.contactName = value;
      } else if (validatorTxt == 'email') {
        StringResources.contactEmail = value;
      } else if (validatorTxt == 'contactNumber') {
        StringResources.contactContactNumber = value;
      } else if (validatorTxt == 'budget') {
        StringResources.contactBudget = value;
      } else if (validatorTxt == 'description') {
        StringResources.contactDescription = value;
      }
    },
    onFieldSubmitted: (_) {
      if (validatorTxt == 'name') {
        fieldFocusChange(context, nameFocusNode, emailFocusNode);
      } else if (validatorTxt == 'email') {
        fieldFocusChange(context, emailFocusNode, contactNumberFocusNode);
      } else if (validatorTxt == 'contactNumber') {
        fieldFocusChange(context, contactNumberFocusNode, budgetFocusNode);
      } else if (validatorTxt == 'budget') {
        fieldFocusChange(context, budgetFocusNode, descriptionFocusNode);
      }
    },
  );
}
//endregion

//region this is a widget for input field for form (Login)
Widget topBar(String title, BuildContext context) {
  return AppBar(
    elevation: 0.0,
    title: myTextWidget(title, 16.0, ColorResources.whiteColor, FontResources.regular, TextAlign.left),
    // toolbarHeight: 40.0,
    titleSpacing: 0,
    iconTheme: IconThemeData(color: ColorResources.whiteColor),
    backgroundColor: ColorResources.atruleGreenColor,
    brightness: Brightness.dark,
    bottom: PreferredSize(
      preferredSize: Size(double.infinity, 2.0),
      child: Container(height: 2.0, width: double.infinity, color: ColorResources.atruleGreenColor,),
    ),
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () => Navigator.pop(context, false),
    ),
  );
}

Widget topAppBar(String title) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
        fontSize: 16,
        color: ColorResources.whiteColor,
        fontFamily: FontResources.regular,
      ),
    ),
    automaticallyImplyLeading: false,
    centerTitle: true,
    elevation: 1.0,
    backgroundColor: ColorResources.atruleGreenColor,
  );
}
//endregion

//region bullet plus text widget
Widget bullet(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    child: Row(
      children: [
        Container(
          width: 15.0,
          height: 15.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2000.0),
            color: ColorResources.atruleGreenColor,
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 16,
              color: ColorResources.atruleGreenColor,
              fontFamily: FontResources.regular,
            ),
          ),
        )
      ],
    ),
  );
}
//endregion

//region this is a widget for input field for form (Apply Now)
Widget inputFieldApplyNow(
  String hint,
  FocusNode focusNode,
  TextEditingController tController,
  TextInputAction action,
  TextInputType textType,
  String label,
  String validatorTxt,
  BuildContext context,
  FocusNode _FirstNameFocusNode,
  FocusNode _LastNameFocusNode,
  FocusNode _EmailNumberFocusNode,
  FocusNode _MobileFocusNode,
  FocusNode _LinkedInUrlFocusNode,
) {
  return TextFormField(
    focusNode: focusNode,
    textInputAction: action,
    autofocus: false,
    keyboardType: textType,
    // obscureText: validatorTxt == 'password' ? true : false,
    style: TextStyle(
      fontSize: 16,
      color: ColorResources.atruleGreenColor,
      fontFamily: FontResources.regular,
    ),
    cursorColor: ColorResources.atruleGreenColor,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorResources.atruleGreenColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorResources.atruleGreenColor,
        ),
      ),
      border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(10.0))),
      alignLabelWithHint: true,
      hintText: hint,
      hintStyle: TextStyle(
        fontSize: 16,
        color: ColorResources.lightGreyColor,
        fontFamily: FontResources.regular,
      ),
      labelText: label,
      labelStyle: TextStyle(
        fontSize: 16,
        color: ColorResources.atruleGreenColor,
        fontFamily: FontResources.regular,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      //prefixIcon: Icon(icon, color: ColorResources.atruleGreenColor, size: 24.0,),
    ),
    validator: (value) {
      if (validatorTxt == 'first_name') {
        if (value.isEmpty) {
          return 'Please enter your first name.';
        } else {
          return null;
        }
      } else if (validatorTxt == 'last_name') {
        if (value.isEmpty) {
          return 'Please enter your last name.';
        } else {
          return null;
        }
      } else if (validatorTxt == 'email') {
        if (value.isEmpty) {
          return 'Please enter an email address.';
        } else if (!StringResources.EmailValidatorRegExp.hasMatch(value)) {
          return 'Please enter valid email address.';
        } else {
          return null;
        }
      } else if (validatorTxt == 'mobile') {
        if (value.isEmpty || value.length == 0) {
          return 'Please enter contact number.';
        } else if (!StringResources.kPhoneValidatorRegExp.hasMatch(value)) {
          return 'Please enter a valid contact number.';
        } else {
          return null;
        }
      }
      // else if(validatorTxt == 'linked_url'){
      //   if (value.isEmpty) {
      //     return 'Please enter your LinkedIn Url.';
      //   }
      //   else if (!Uri.parse(value).isAbsolute) {
      //     return 'Please enter a valid Url.';
      //   }
      //   else {
      //     return null;
      //   }
      // }
      else {
        return null;
      }
    },
    onSaved: (value) {
      if (validatorTxt == 'first_name') {
        StringResources.applyFirstName = value;
      } else if (validatorTxt == 'last_name') {
        StringResources.applyLastName = value;
      } else if (validatorTxt == 'email') {
        StringResources.applyEmail = value;
      } else if (validatorTxt == 'mobile') {
        StringResources.applyMobile = value;
      } else if (validatorTxt == 'linked_url') {
        StringResources.applyLinkedIn = value;
      }
    },
    onFieldSubmitted: (_) {
      if (validatorTxt == 'first_name') {
        fieldFocusChange(context, _FirstNameFocusNode, _LastNameFocusNode);
      } else if (validatorTxt == 'last_name') {
        fieldFocusChange(context, _LastNameFocusNode, _EmailNumberFocusNode);
      } else if (validatorTxt == 'email') {
        fieldFocusChange(context, _EmailNumberFocusNode, _MobileFocusNode);
      } else if (validatorTxt == 'mobile') {
        fieldFocusChange(context, _MobileFocusNode, _LinkedInUrlFocusNode);
      }
    },
  );
}
//endregion

//region this is a widget for input field for form (Apply Now Blocks)
Widget inputFieldApplyNowBlocks(
    String hint,
    FocusNode focusNode,
    TextEditingController tController,
    TextInputAction action,
    TextInputType textType,
    String label,
    String validatorTxt,
    BuildContext context,
    FocusNode _StrengthFocusNode,
    FocusNode _WeaknessFocusNode,
    FocusNode _FutureGoalsNumberFocusNode,
    FocusNode _HearAboutFocusNode) {
  return TextFormField(
    focusNode: focusNode,
    controller: tController,
    textInputAction: action,
    autofocus: false,
    maxLines: 3,
    keyboardType: textType,
    obscureText: false,
    style: TextStyle(
      fontSize: 16,
      color: ColorResources.atruleGreenColor,
      fontFamily: FontResources.regular,
    ),
    cursorColor: ColorResources.atruleGreenColor,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorResources.atruleGreenColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorResources.atruleGreenColor,
        ),
      ),
      border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(10.0))),
      alignLabelWithHint: true,
      counterStyle: TextStyle(
        fontSize: 14,
        color: ColorResources.tomatoColor,
        fontFamily: FontResources.regular,
      ),
      labelText: label,
      labelStyle: TextStyle(
        fontSize: 16,
        color: ColorResources.atruleGreenColor,
        fontFamily: FontResources.regular,
      ),
      hintText: hint,
      hintStyle: TextStyle(
        fontSize: 16,
        color: ColorResources.lightGreyColor,
        fontFamily: FontResources.regular,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
    ),
    validator: (value) {
      if (validatorTxt == 'strength') {
        if (value.isEmpty) {
          return 'Please enter your strength.';
        } else {
          return null;
        }
      } else if (validatorTxt == 'weakness') {
        if (value.isEmpty) {
          return 'Please enter your weakness.';
        } else {
          return null;
        }
      } else if (validatorTxt == 'future_goals') {
        if (value.isEmpty) {
          return 'Please enter your future goals.';
        } else {
          return null;
        }
      }
      // else if(validatorTxt == 'hear_about'){
      //   if (value.isEmpty) {
      //     return 'Where did you hear about us?';
      //   } else {
      //     return null;
      //   }
      // }
      else {
        return null;
      }
    },
    onSaved: (value) {
      if (validatorTxt == 'strength') {
        StringResources.applyStrength = value;
      } else if (validatorTxt == 'weakness') {
        StringResources.applyWeakness = value;
      } else if (validatorTxt == 'future_goals') {
        StringResources.applyFutureGoals = value;
      } else if (validatorTxt == 'hear_about') {
        StringResources.applyHearAbout = value;
      }
    },
    onFieldSubmitted: (_) {},
  );
}
//endregion

Widget svgIconWidget(String _iconData, double _width, double _height) {
  return SvgPicture.asset(
    _iconData,
    height: _height,
    width: _width,
  );
}

Widget paddingTextWidget(String text, TextStyle textStyle, Alignment _alignment,
    TextAlign _textAlign, double horizontalPadding, double verticalPadding) {
  return Padding(
    padding: EdgeInsets.symmetric(
        vertical: verticalPadding, horizontal: horizontalPadding),
    child: Align(
      alignment: _alignment,
      child: Text(
        text,
        textAlign: _textAlign,
        style: textStyle,
      ),
    ),
  );
}

Widget myTextWidget(String text, double _fontSize, Color textColor, String _fontFamily, TextAlign textAlign) {
  return Text(
    text != null ? text : "",
    textAlign: textAlign,
    style: myTextStyle(_fontSize, textColor, _fontFamily),
  );
}

Widget myTextWidgetWithMaxLine(String text, double _fontSize, Color textColor, String _fontFamily, TextAlign textAlign, int maxLine) {
  return Text(
    text != null ? text : "",
    maxLines: maxLine,
    overflow: TextOverflow.ellipsis,
    textAlign: textAlign,
    style: myTextStyle(_fontSize, textColor, _fontFamily),
  );
}

TextStyle myTextStyle(double _fontSize, Color textColor, String _fontFamily) {
  return TextStyle(
      fontFamily: _fontFamily,
      fontSize: _fontSize,
      color: textColor);
}

//region top clip path code
class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height,
        size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
//endregion

//region my custom text widget for max line
Widget myTextWidgetMaxLine(String title, TextAlign textAlign, Color color, double fontSize, String fontFamily, int line){
  return Text(
      title != null ? title : "",
      textAlign: textAlign,
      maxLines: line,
      overflow: TextOverflow.ellipsis,
      style: myTextStyle(fontSize, color, fontFamily)
  );
}
//endregion

//region Rounded Button
class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = ColorResources.atruleGreenColor,
    this.textColor = ColorResources.whiteColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      width: size.width * 0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            color: color,
            onPressed: press,
            child: paddingTextWidget(text, AppStyles.textStyle,
                Alignment.center, TextAlign.center, 5.0, 5.0)),
      ),
    );
  }
}
//endregion

//region Top Common Container
Widget topCommonContainer(){
  return Container(
      padding: EdgeInsets.only(bottom: 15.0, left: 10.0, right: 10.0, top: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(0.0),
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0)
          ),
          color: ColorResources.atruleGreenColor
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                width: 70.0,
                height: 70.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: ColorResources.atruleGreenColorLite,
                        width: 1.0
                    ),
                    boxShadow: [BoxShadow(
                      color: ColorResources.darkGreyColor.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 0),
                    )],
                    color: ColorResources.whiteColor
                ),
                child: Image.asset('asset/profile.png', fit: BoxFit.fill,),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: myTextWidget(StringResources.employeeName, 16.0, ColorResources.whiteColor, FontResources.bold, TextAlign.left)
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: myTextWidget(StringResources.employeeDesignation, 16.0, ColorResources.whiteColor, FontResources.regular, TextAlign.left)
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      )
  );
}
//endregion

//region My Common Button
class MyButton extends StatelessWidget {
  String text;
  Color buttonColor, splashColor, textColor;
  Function onPress;

  MyButton({
    Key key,
    this.text,
    this.buttonColor,
    this.splashColor,
    this.textColor,
    this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              // side: BorderSide(color: Colors.red)
            )
        ),
        backgroundColor: MaterialStateProperty.all(buttonColor),
        overlayColor: MaterialStateProperty.all(splashColor),
        animationDuration: Duration(
            milliseconds: 3,
            microseconds: 0
        ),
      ),
      onPressed: onPress,
      child: myTextWidget(text, 16.0, textColor, FontResources.bold, TextAlign.center),
    );
  }
}
//endregion
