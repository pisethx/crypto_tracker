import 'package:crypto_tracker/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crypto_tracker/screens/home_screen.dart';
import 'package:crypto_tracker/screens/login_screen.dart';
import 'package:crypto_tracker/screens/splash_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp();

  runApp(CryptoTracker());
}

class CryptoTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      title: 'Crypto Tracker',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: Colors.grey,
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: kDarkGrayColor,
          displayColor: kDarkGrayColor,
        ),
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
      },
    );
  }
}
