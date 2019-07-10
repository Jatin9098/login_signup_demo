import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formResetEmailKey = GlobalKey<FormState>();
  final _scafoldState = GlobalKey<ScaffoldState>();
  int counter = 0;
  bool _validate = false;
  String email, password;

  @override
  Widget build(BuildContext context) {
    
    
    return WillPopScope(
      onWillPop: (){
        if(counter == 1){
          print("EXIT");
        
        }
         Fluttertoast.showToast(
        msg: "Press again for exit!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM, 
        );
        counter++;
       Timer(Duration(seconds : 2),(){
            counter = 0;
          });
      },
          child: new Scaffold(
        key: _scafoldState,
        body: new Container(
            child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Text field
                  Padding(
                    padding:
                        EdgeInsets.only(left: 1, top: 50, right: 1, bottom: 1),
                    child: new Text(
                      "Hi",
                      style: TextStyle(fontFamily: "mono_bold", fontSize: 60),
                    ),
                  ),
                  // text field
                  Padding(
                    padding: EdgeInsets.all(1),
                    child: new Text(
                      "There",
                      style: TextStyle(fontFamily: "mono_bold", fontSize: 60),
                    ),
                  ),
                  // Email edit text field
                  Padding(
                    padding:
                        EdgeInsets.only(left: 1, top: 10, right: 1, bottom: 1),
                    child: new Form(
                      key: _formKey,
                      child: _formData(),
                    ),
                    // password edit text field
                  ),
                  // forgot password text field
                  Container(
                    alignment: Alignment(1, 0),
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: InkWell(
                      onTap: () {
                        _showAlertDialog();
                      },
                      child: new Text(
                        "Forgot Password",
                        style: new TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  // Login in button
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    height: 65,
                    child: MaterialButton(
                     shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20)),
                      onPressed: () {
                        _onLoginButtonClicked();
                      },
                      child: new Center(
                        child: new Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      // borderRadius: BorderRadius.circular(20),
                      // shadowColor: Colors.greenAccent,
                      elevation: 5,
                      color: Colors.green,
                      // child: GestureDetector(
                      //   onTap: () {

                      //     _onLoginButtonClicked();
                      //     // setState(() {
                      //     //   _validateFields(_emailController.text, "1");
                      //     // });
                      //   },
                      //   child: Center(
                      //     child: new Text(
                      //       "LOGIN",
                      //       style: TextStyle(
                      //           color: Colors.white,
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 15),
                      //       textAlign: TextAlign.center,
                      //     ),
                      //   ),
                      // ),
                    ),
                  ),
                  // facebook login button
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    height: 65,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.green,
                              style: BorderStyle.solid,
                              width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Center(
                            child: ImageIcon(
                              AssetImage('assets/facebook.png'),
                            ),
                          ),
                         new GestureDetector(
                            onTap: () {
                              print("fds");
                            },
                            child: Center(
                              child: new Text(
                                "Login with Facebook",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // sign up text field
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an account?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "SignUp",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget _formData() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Enter Email'),
          //maxLength: 32,
          validator: validateEmail,
          onSaved: (String val) {
            email = val;
          },
        ),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Enter Password'),
            keyboardType: TextInputType.phone,
            // maxLength: 30,
            validator: validatePassword,
            onSaved: (String val) {
              password = val;
            }),
      ],
    );
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
    //String patttern = r'(^[0-9]*$)';
    // RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Password is Required";
    } else if (value.length <= 5) {
      return "Password length must 6 character";
    }
    //else if (!regExp.hasMatch(value)) {
    //   return "Mobile Number must be digits";
    // }
    return null;
  }

// for Reset Passsword
  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(
              "Forgot Password",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                    "We just need your email id to send the reset password instructions."),
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formResetEmailKey,
                  child: new TextFormField(
                    decoration: new InputDecoration(hintText: 'Enter Email'),
                    //maxLength: 32,
                    validator: validateResetEmail,
                    onSaved: (String val) {
                      email = val;
                    },
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: new Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: new Text("Send"),
                onPressed: () {
                  // FocusScope.of(context).requestFocus(new FocusNode()); // to dismiss the keyboard
                  _onResetEmailButtonClicked();
                  //Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  String validateResetEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  void _onResetEmailButtonClicked() {
    if (_formResetEmailKey.currentState.validate()) {
      // No any error in validation
      _formResetEmailKey.currentState.save();
      print("Email $email");

      _loginSuccessfull();
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }

  void _onLoginButtonClicked() {
    if (_formKey.currentState.validate()) {
      // No any error in validation
      _formKey.currentState.save();
      print("Email $email");
      print("Password $password");
      _loginSuccessfull();
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }

  void _loginSuccessfull() {
    final SnackBar snackBar = new SnackBar(
      content: new Text(" $email \t $password"),
    );
    _scafoldState.currentState.showSnackBar(snackBar);
  }
}
