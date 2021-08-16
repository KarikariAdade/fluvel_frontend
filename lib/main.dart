import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluvel/auth/forgot_password.dart';
import 'package:fluvel/auth/login.dart';
import 'package:fluvel/auth/signup.dart';
import 'package:fluvel/home.dart';

void main() => runApp(
  MaterialApp(
    theme: ThemeData(
        primaryColor: Colors.deepOrange,
        accentColor: Colors.white,
        hintColor: Colors.deepOrange,
    ),
    debugShowCheckedModeBanner: false,
    routes: {
      '/auth/login': (context) => Login(),
      '/auth/signup': (context) => SignUp(),
      'home': (context) => Home(),
      '/auth/forgot_password': (context) => ForgotPassword()
    },
    home: SplashScreen(),
  )
);

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => Navigator.pushNamed(context, '/auth/login'));
  }

  @override


  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  minRadius: 40.0,
                  backgroundColor: Theme.of(context).accentColor,
                  child: Icon(
                    Icons.account_circle_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 40.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:20.0),
                  child: Text(
                    'FLUVEL',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        letterSpacing: 1.0
                    )
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: CircularProgressIndicator(
                backgroundColor: Colors.deepOrange,
                color: Theme.of(context).accentColor,
              ),
            ),
            )
        ],
      ),
    );
  }
}
