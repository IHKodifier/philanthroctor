import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:philanthroctor/services/userManagement.dart';
import 'package:philanthroctor/ui/UserHome.dart';
import 'package:philanthroctor/ui/apphomePage.dart';
import 'package:philanthroctor/ui/loginPage.dart';
import 'package:philanthroctor/ui/newAccountSuccess.dart';
import 'package:philanthroctor/ui/newcase.dart';
import 'package:philanthroctor/ui/signupPage.dart';
// import 'package:philanthroctor/widgets/philanthroctorLogo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Philanthroctor",
        color: Theme.of(context).primaryColor,
        debugShowCheckedModeBanner: false,
        home: UserManagement().handleAuth(),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => LoginPage(),
          // '/retryLogin': (BuildContext context) => LoginPage(
          // retryLogin: true,
          // ),
          '/appHome': (BuildContext context) => AppHomePage(),
          '/signup': (BuildContext context) => SignUpPage(),
          '/newCase': (BuildContext context) => NewCase(),
          '/userHome': (BuildContext context) => UserHome(),
          '/newAccountSuccess': (BuildContext context) => NewAccountSuccess(),
        },
        theme: _buildThemeData());
  }

  ThemeData _buildThemeData() {
    final baseTheme = ThemeData();

    return baseTheme.copyWith(
      primaryColor: Colors.green.shade900,
      colorScheme: ColorScheme(
          primary: Colors.green.shade900,
          primaryVariant: Colors.green.shade600,
          secondary: Colors.orange[600],
          secondaryVariant: Colors.orange[50],
          surface: Colors.white,
          background: Colors.white70,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.green[900],
          onBackground: Colors.green[900],
          onError: Colors.white,
          brightness: Brightness.light),
      accentColor: Colors.green.shade400,
      scaffoldBackgroundColor: Colors.white,
      buttonTheme: const ButtonThemeData().copyWith(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        textTheme: ButtonTextTheme.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        counterStyle: GoogleFonts.roboto(color: Colors.black),
      ),
      cardTheme: CardTheme(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      appBarTheme: AppBarTheme(
        color: baseTheme.scaffoldBackgroundColor,
        iconTheme: baseTheme.iconTheme.copyWith(color: Colors.green[900]),
      ),
      tabBarTheme: baseTheme.tabBarTheme.copyWith(
        unselectedLabelColor: Colors.grey.shade400,
        unselectedLabelStyle: TextStyle(color: Colors.grey.shade400),
        labelColor: baseTheme.primaryColor,
      ),
      sliderTheme: baseTheme.sliderTheme.copyWith(
        activeTrackColor: Colors.green[900],
        // inactiveTrackColor: baseTheme.accentColor,
        trackShape: RoundedRectSliderTrackShape(),
        trackHeight: 4.0,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
        // thumbColor: Colors.green[900],
        overlayColor: Colors.green[900].withAlpha(50),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 38.0),
        tickMarkShape: RoundSliderTickMarkShape(),
        // activeTickMarkColor: Colors.white,
        // inactiveTickMarkColor: Colors.grey,
        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
        valueIndicatorColor: Colors.green[900],
        valueIndicatorTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      textTheme: baseTheme.textTheme.copyWith(
        title: GoogleFonts.gentiumBookBasic(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        subtitle: GoogleFonts.roboto(
            fontSize: 16.0, color: Colors.black54, fontStyle: FontStyle.italic),
        headline: GoogleFonts.roboto(color: Colors.black54, fontSize: 22),
        subhead: GoogleFonts.roboto(
            color: Colors.black54, fontSize: 22, fontStyle: FontStyle.italic),
        body1: GoogleFonts.roboto(),
        body2: baseTheme.textTheme.body2.copyWith(color: Colors.black),
        caption: GoogleFonts.roboto(color: Colors.black),
        button: GoogleFonts.roboto(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            letterSpacing: 5.5,
            // fontStyle:,
            color: Colors.white),
        display1: baseTheme.textTheme.display1.copyWith(color: Colors.black),
        display2: baseTheme.textTheme.display2.copyWith(color: Colors.black),
        display3: baseTheme.textTheme.display3.copyWith(color: Colors.black),
        display4: baseTheme.textTheme.display4.copyWith(color: Colors.black),
      ),
    );
  }
}
