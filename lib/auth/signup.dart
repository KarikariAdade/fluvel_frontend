import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluvel/api/api.dart';
import 'dart:convert';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  @override

  final formKey = GlobalKey<FormState>();

  late String email, password, fullName, phone;

  bool _isLoading = false;

  void handleLogin () async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      'fullName': fullNameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'password': passwordController.text
    };

    var res = await CallApi().postData(data, 'register');
    var body = json.decode(res.body);

    print(body);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 280.0),
        child: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black45,
                    blurRadius: 50.0,
                    spreadRadius: 2.0
                )
              ]
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                Container(
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 35.0,
                    child: Icon(
                      Icons.account_circle_outlined,
                      color: Theme.of(context).accentColor,
                      size: 50.0,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: fullNameController,
                      decoration: InputDecoration(
                          labelText: 'Full Name',
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color:Theme.of(context).primaryColor,
                          ),
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          )
                      ),
                    )
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color:Theme.of(context).primaryColor,
                      ),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      )
                    ),
                  )
                ),
                SizedBox(height: 20.0),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      decoration: InputDecoration(
                          labelText: 'Phone Number',
                          prefixIcon: Icon(
                            Icons.phone,
                            color:Theme.of(context).primaryColor,
                          ),
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          )
                      ),
                    )
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(
                        Icons.lock_open_rounded,
                        color: Theme.of(context).primaryColor
                      ),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.red, width: 10.0),
                      )
                    ),
                  )
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 14.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Already have an Account?',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                      elevation: MaterialStateProperty.all(10.0),
                      padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0))
                    ),
                    onPressed: (){
                      handleLogin();
                    },
                    child: Text(_isLoading == true ? 'Creating...' : 'Sign Up')
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

