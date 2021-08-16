import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override

  var formKey = GlobalKey<FormState>();

  late String email, password;

  validateField(){
    final form = formKey.currentState;

    if(form!.validate() == true){
      form.save();
    }
  }

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 14.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/auth/forgot_password');
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0
                          ),
                        ),
                      )
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(right: 10.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, '/auth/signup');
                          },
                          child: Text(
                            'New Here?',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0
                            ),
                          ),
                        )
                    ),
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