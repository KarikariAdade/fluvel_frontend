import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override

  var formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.fromLTRB(30.0, 200.0, 30.0, 280.0),
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
                    keyboardType: TextInputType.emailAddress,
                    initialValue: 'Enter Email Address',
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      prefixIcon: Icon(
                          Icons.email_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor
                      ),
                      // focusColor: Theme.of(context).primaryColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                    ),

                  ),
                )
                ),
                SizedBox(height: 20.0),
                Padding(

                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      initialValue: 'Enter Password',
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock_open_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor
                        ),
                        focusColor: Colors.red,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.red, width: 10.0),
                        ),

                      ),
                    )
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
                    onPressed: (){},
                    child: Text('Login'),
                  ),
                )
              ],
            ),
          ),
          ),
        )
      );
  }
}


// decoration: BoxDecoration(
// color: Theme.of(context).accentColor,
// borderRadius: BorderRadius.circular(10.0),
// border: Border.all(
// color: Theme.of(context).accentColor,
// ),
// boxShadow: [
// BoxShadow(
// color: Colors.black,
// blurRadius: 30.0,
// spreadRadius: 1.0,
// offset: Offset(5.0, 5.0)
// )
// ]
// ),