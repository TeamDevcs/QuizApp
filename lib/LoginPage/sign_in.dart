import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email, password;
  bool _rememberPassword = false;

  void _signIn({String em, String, pw}) {
    _auth
        .signInWithEmailAndPassword(email: em, password: pw)
        .then((authResult) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Container(
          color: Colors.yellow,
          child: Text('Welcome ${authResult.user.email}'),
        );
      }));
    }).catchError((err) {
      print(err.code);
      if (err.code == 'ERROR_WRONG_PASSWORD') {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text('The password was incorrect, please try again'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  Text(
                    'SIGN IN',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    onChanged: (textVal) {
                      setState(() {
                        email = textVal;
                      });
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: 'Enter Email',
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.6)),
                      focusColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: TextStyle(color: Colors.white, fontSize: 26.0),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    onChanged: (textVal) {
                      setState(() {
                        password = textVal;
                      });
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: 'Password',
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.6)),
                      focusColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: TextStyle(color: Colors.white, fontSize: 26.0),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.pinkAccent,
                        value: _rememberPassword,
                        onChanged: (newValue) {
                          setState(() {
                            _rememberPassword = newValue;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Remember Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          _signIn(em: email, pw: password);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 34.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Text(
                            'GET STARTED',
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0)),
                          child: FaIcon(
                            FontAwesomeIcons.facebook,
                            color: Colors.pinkAccent,
                          )),
                      SizedBox(width: 40.0),
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0)),
                          child: FaIcon(
                            FontAwesomeIcons.google,
                            color: Colors.pinkAccent,
                          )),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'FORGET PASSWORD?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(30.0),
          color: Colors.black.withOpacity(0.2),
          child: Text(
            'DON\'T HAVE AN ACCOUNT? SUGN UP',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
