import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

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
  final _scafoldState = GlobalKey<ScaffoldState>();

  String email;
  String password;

  TextEditingController _text = TextEditingController();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isEmpty = false;
  String _errorMessage = "";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scafoldState,
      body: new Container(
          child: Form(
            key: _formKey,
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
                      child: new TextFormField(
                        controller: _emailController,
                        style: new TextStyle(),
                        decoration: InputDecoration(
                          
                            labelText: "Email",
                            contentPadding: EdgeInsets.only(left: 8.0),
                            ),
                        validator: (val) => !EmailValidator.Validate(val, true)
                        ? 'Not a valid email.'
                        : "",
                        onSaved: (val) => email = _emailController.text,
                        keyboardType: TextInputType.emailAddress,
                      )),
                  // password edit text field
                  Padding(
                    padding:
                        EdgeInsets.only(left: 1, top: 10, right: 1, bottom: 1),
                    child: new TextFormField(
                      controller: _passwordController,
                      style: new TextStyle(),
                      decoration: InputDecoration(
                          labelText: "Password",
                          contentPadding: EdgeInsets.only(left: 8)),
                          validator: (val) =>
                      val.length < 4 ? 'Password too short..' : "",
                  onSaved: (val) => password = _passwordController.text,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                  ),
                  // forgot password text field
                  Container(
                    alignment: Alignment(1, 0),
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: InkWell(
                      onTap: () {
                        _text.text = "";
                        _errorMessage = "";
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
                    child: RaisedButton(

                      onPressed: (){
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
                          // new Center(
                          //   child: new Text(
                          //     "Login with Facebook",
                          //     style: TextStyle(fontWeight: FontWeight.bold),
                          //   ),
                          // ),
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
      ),
          )),
    );
  }

  @override
  void initState() {
    super.initState();
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
                TextField(
                  
                  autofocus: false,
                  controller: _text,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 5, bottom: 2),
                      labelText: "Email"),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  _errorMessage,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.red,
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
                  FocusScope.of(context).requestFocus(new FocusNode());// to dismiss the keyboard
                  setState(() {
                    _text.text.isEmpty
                        ? _errorMessage = "Email can't be empty."
                        : _validateFields(_text.text, "2");

                    print("Tesxc {isEmpty}");
                  });
                  //Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  _validateFields(String email, String type) {
    //String email = _text.text;

    // 1 for email & passoword field
    // 2 forgot password =email

    bool emailValid =
        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

    if (emailValid) {
      if (type == "1") {
        print("Great job");
      } else {
        Navigator.of(context).pop();
      }
    } else {
      setState(() {
        _text.text.isEmpty ? isEmpty = true : new Text("fsdfsd");
      });
    }
  }

  void _onLoginButtonClicked() {
    final form = _formKey.currentState;
FocusScope.of(context).requestFocus(new FocusNode());// to dismiss the keyboard

    if (form.validate()) {
      print("$form.validate() \n $email \t $password");
      form.save();
      _loginSuccessfull();
    }
  }

  void _loginSuccessfull() {
      print("Form Valid \n $email \t $password");
    final SnackBar snackBar = new SnackBar(content: new Text(" $email \t $password"),);
    _scafoldState.currentState.showSnackBar(snackBar);
  }
}
