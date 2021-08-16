import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override

  var formKey = GlobalKey<FormState>();

  late String email;

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
                  )
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
                        color: Theme.of(context).primaryColor
                      ),
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )
                    )
                  ),
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
                    child: Text('Reset Password'),
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
