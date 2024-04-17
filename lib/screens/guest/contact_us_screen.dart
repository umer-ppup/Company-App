import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/font_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/util/util.dart';
import 'package:atrule_tech/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key key}) : super(key: key);

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKeyContact = GlobalKey<FormState>();

  TextEditingController cName = TextEditingController();
  TextEditingController cEmail = TextEditingController();
  TextEditingController cContactNumber = TextEditingController();
  TextEditingController cBudget = TextEditingController();
  TextEditingController cDescription = TextEditingController();

  FocusNode _nameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _contactNumberFocusNode = FocusNode();
  FocusNode _budgetFocusNode = FocusNode();
  FocusNode _descriptionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: ColorResources.whiteColor,
        appBar: topBar("Contact Us", context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                  child: Text(
                    StringResources.contactUsHeading,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      color: ColorResources.atruleGreenColor,
                      fontFamily: FontResources.bold,
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                  child: Text(
                    StringResources.contactUsHeadingDetail,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorResources.atruleGreenColor,
                      fontFamily: FontResources.regular,
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    // border: Border.all(
                    //     color: ColorResources.atruleGreenColor,
                    //     width: 1.0
                    // ),
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
                          child: Text(
                            StringResources.connectExperts,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              color: ColorResources.atruleGreenColor,
                              fontFamily: FontResources.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            StringResources.connectExpertsDetail,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorResources.atruleGreenColor,
                              fontFamily: FontResources.regular,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30.0),
                          child: Form(
                            key: _formKeyContact,
                            child: Column(
                              children: [
                                inputFieldContact(
                                    "Enter your name",
                                    _nameFocusNode,
                                    cName,
                                    TextInputAction.next,
                                    TextInputType.text,
                                    'Name',
                                    Icons.person_outline,
                                    'name',
                                    context,
                                    _nameFocusNode,
                                    _emailFocusNode,
                                    _contactNumberFocusNode,
                                    _budgetFocusNode,
                                    _descriptionFocusNode),
                                SizedBox(height: 20),
                                inputFieldContact(
                                    "Enter your email",
                                    _emailFocusNode,
                                    cEmail,
                                    TextInputAction.next,
                                    TextInputType.emailAddress,
                                    'Email',
                                    Icons.email_outlined,
                                    'email',
                                    context,
                                    _nameFocusNode,
                                    _emailFocusNode,
                                    _contactNumberFocusNode,
                                    _budgetFocusNode,
                                    _descriptionFocusNode),
                                SizedBox(height: 20),
                                inputFieldContact(
                                    "Enter your contact number",
                                    _contactNumberFocusNode,
                                    cContactNumber,
                                    TextInputAction.next,
                                    TextInputType.phone,
                                    'Contact Number',
                                    Icons.phone_outlined,
                                    'contactNumber',
                                    context,
                                    _nameFocusNode,
                                    _emailFocusNode,
                                    _contactNumberFocusNode,
                                    _budgetFocusNode,
                                    _descriptionFocusNode),
                                SizedBox(height: 20),
                                inputFieldContact(
                                    "Enter your budget",
                                    _budgetFocusNode,
                                    cBudget,
                                    TextInputAction.next,
                                    TextInputType.number,
                                    'Budget',
                                    Icons.attach_money_outlined,
                                    'budget',
                                    context,
                                    _nameFocusNode,
                                    _emailFocusNode,
                                    _contactNumberFocusNode,
                                    _budgetFocusNode,
                                    _descriptionFocusNode),
                                SizedBox(height: 20),
                                inputFieldContact(
                                    "Enter your description",
                                    _descriptionFocusNode,
                                    cDescription,
                                    TextInputAction.done,
                                    TextInputType.text,
                                    'Description',
                                    Icons.description_outlined,
                                    'description',
                                    context,
                                    _nameFocusNode,
                                    _emailFocusNode,
                                    _contactNumberFocusNode,
                                    _budgetFocusNode,
                                    _descriptionFocusNode),
                                SizedBox(height: 20),
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
                                      EdgeInsets.symmetric(horizontal: 20.0),
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
                                                  if (_formKeyContact
                                                      .currentState
                                                      .validate()) {
                                                    _formKeyContact.currentState
                                                        .save();
                                                    await showLoading();

                                                    print(StringResources
                                                        .contactName);
                                                    print(StringResources
                                                        .contactEmail);
                                                    print(StringResources
                                                        .contactContactNumber);
                                                    print(StringResources
                                                        .contactBudget);
                                                    print(StringResources
                                                        .contactDescription);

                                                    await hideLoading();
                                                  }
                                                },
                                                child: Text(
                                                  'Submit Your Inquiry',
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
                                )
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
