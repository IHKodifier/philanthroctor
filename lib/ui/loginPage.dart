import 'package:firebase_auth/firebase_auth.dart';
import 'package:philanthroctor/packageLib.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:philanthroctor/widgets/philanthroctorLogo.dart';
import 'dart:async';



class LoginPage extends StatefulWidget {
  // bool retryLogin=false;

  LoginPage();
  @override
  _LoginPageState createState() => _LoginPageState( );
}

class _LoginPageState extends State<LoginPage> {
  _LoginPageState();
  // bool retryLogin;
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    ThemeData localTheme = Theme.of(context);
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: PhilanthroctorLogo(),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:8.0),
                  child: TextField(
                    style: GoogleFonts.raleway(color: Colors.black, fontSize: 22),
                    decoration: InputDecoration(
                      hintText: 'email used to create Philanthroctor account',
                      labelText: 'Email',
                      labelStyle: localTheme.textTheme.title.copyWith(
                        color: localTheme.primaryColor,
                        fontSize: 16.0,
                      ),
                      hintStyle: localTheme.textTheme.subhead.copyWith(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    onChanged: (value) {
                      _email = value.toString().trim();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:8.0),
                  child: TextField(
                    style: GoogleFonts.raleway(color: Colors.black, fontSize: 22),
                    decoration: InputDecoration(
                      border: localTheme.inputDecorationTheme.border,
                      hintText: ' alWayS CASE sENsItivE!!',
                      hintStyle: localTheme.textTheme.subhead.copyWith(
                        fontSize: 16.0,
                        color: Colors.black54,
                        fontStyle: FontStyle.italic,
                      ),
                      labelText: 'Password',
                      labelStyle: localTheme.textTheme.title.copyWith(
                        color: localTheme.primaryColor,
                        fontSize: 16.0,
                      ),
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      _password = value.toString().trim();
                    },
                  ),
                ),
                SizedBox(height: 30.0),
                 
                Container(
                  width: 260,
                  height: 45.0,
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: RaisedButton(
                      child: Text(
                        'LOGIN',
                        style: localTheme.textTheme.button
                            .copyWith(color: Colors.white, fontSize: 20.0),
                      ),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _email, password: _password)
                            .then((user) {
                          Navigator.of(context).popAndPushNamed('/appHome');
                        }).catchError((onError) {
                          // Navigator.of(context).pushReplacementNamed('/retryLogin');
                        });
                      }),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Text('Don\'t have an account?',
                    style:
                        localTheme.textTheme.display1.copyWith(fontSize: 26.0)),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 260,
                  height: 45.0,
                  padding: EdgeInsets.symmetric(
                    horizontal: 2,
                  ),
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'SIGN UP ',
                      style: localTheme.textTheme.button
                          .copyWith( fontSize: 20.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/signup');
                    },
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
