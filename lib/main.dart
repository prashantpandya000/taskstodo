import 'package:flutter/material.dart';

import 'package:taskstodo/services/auth_service.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'locator.dart';
import 'views/navigation_view.dart';
import 'views/first_view.dart';
import 'views/sign_up_view.dart';
import 'widgets/provider_widget.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//setupLocator();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        title: "taskstodo App",
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme:
                TextTheme(bodyText2: GoogleFonts.bitter(fontSize: 14.0))),
        home: HomeController(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomeController(),
          '/signUp': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.signUp),
          '/signIn': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.signIn),
          '/anonymousSignIn': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.anonymous),
          '/convertUser': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.convert),
        },
      ),
    );
  }
}
/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Task todo App",
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
            textTheme: TextTheme(body1: GoogleFonts.bitter(fontSize: 14.0))),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            textTheme: TextTheme(body1: GoogleFonts.bitter(fontSize: 14.0))),
        home: HomeController(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomeController(),
          '/signUp': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.signUp),
          '/signIn': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.signIn),
          '/anonymousSignIn': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.anonymous),
          '/convertUser': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.convert),
        },
      ),
    );
  }
}
*/

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? Home() : FirstView();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
