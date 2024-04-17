import 'package:atrule_tech/resources/color_resources.dart';
import 'package:atrule_tech/resources/string_resources.dart';
import 'package:atrule_tech/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // navigation bar color
    statusBarColor: ColorResources.atruleGreenColor,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light, // status bar color
  ));

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      title: StringResources.companyName,
      builder: EasyLoading.init(),
    );
  }
}