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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 1,top: 50,right: 1,bottom: 1),
                      child: new Text("Hi", 
                      style: TextStyle(fontFamily: "mono_bold", fontSize: 60),
                      ),
                    ),
                  Padding(
                      padding: EdgeInsets.all(1),
                      
                      child: new Text("There", 
                          style: TextStyle(
                            fontFamily: "mono_bold", 
                            fontSize: 60),
                          ),
                    ),
                  Padding(
                      padding: EdgeInsets.only(left: 1,top: 10,right: 1,bottom: 1),
                      child: new TextField(
                        style: new TextStyle(),
                          decoration: InputDecoration(
                            labelText: "Email",
                            contentPadding: EdgeInsets.only(left: 8.0)
                        ),
                        keyboardType: TextInputType.emailAddress,
                      )
                    ),
                  Padding(
                      padding: EdgeInsets.only(left: 1,top: 10,right: 1,bottom: 1),
                      child: new TextField(
                        style: new TextStyle(

                        ),
                        decoration: InputDecoration(
                          labelText: "Password",
                          contentPadding: EdgeInsets.only(left: 8)
          
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        ),
                    ),
                  Container(
                            alignment: Alignment(1, 0),
                            padding: EdgeInsets.only(top: 20,),
                            child: InkWell(
                                child:  new Text("Forgot Password",
                                        style: new TextStyle(color: Colors.green,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.underline
                                        ),
                                    ),
                              ),
                              
                            ),
                  Container(
                              padding: EdgeInsets.only(top: 20),
                                width: double.infinity,
                                height: 65,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20),
                                  shadowColor: Colors.greenAccent,
                                  elevation: 5,
                                  color: Colors.green,
                                  child: GestureDetector(
                                  onTap: (){},
                                  child: Center(
                                  child: new Text("LOGIN", 
                                    style: TextStyle(
                                      color: Colors.white, 
                                      fontWeight: FontWeight.bold, 
                                      fontSize: 15),
                                      textAlign: TextAlign.center,
                                  ),
                                   ),
                                ),
                               ),
                            ) ,
                  Container(
                              padding: EdgeInsets.only(top: 20),
                              height: 65,
                             
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.green,
                                    style: BorderStyle.solid,
                                    width: 2
                                  ),
                                  borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                   new Center(
                                     child: ImageIcon(AssetImage('assets/facebook.png'),
                                      ),
                                    ),
                                    new Center(

                                      child: new Text("Login with Facebook", style: TextStyle(
                                        fontWeight: FontWeight.bold
                                      ),),
                                    ),
                                  //   new GestureDetector(
                                  //   onTap: (){},
                                  //   child: Center(
                                  //     child: new Text("Login with Facebook", 
                                  //     style: TextStyle(
                                  //       color: Colors.green, 
                                  //       fontWeight: 
                                  //       FontWeight.bold),),
                                  //   ),
                                  // ),
                                    ],
                                  ),
                                  
                              ),
                            ),
                  Container(
                              padding: EdgeInsets.only(top: 30),
                                child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                    Text("Don't have an account?",
                                    style: TextStyle(fontWeight: FontWeight.bold),),

                                     Text("SignUp",
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
        )
      ),
    );
  }
}