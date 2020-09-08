import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeSignInWidget extends StatelessWidget {
  final Function goToSignUp;
  final Function goToSignIn;

  HomeSignInWidget({this.goToSignUp, this.goToSignIn});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 30.0,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FaIcon(
                  FontAwesomeIcons.facebookF,
                  color: Colors.red,
                ),
                Text(" | Sing in with Facebook",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0))
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.red,
                ),
                Text(" | Sing in with Google",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0))
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () {
              goToSignUp();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sign Up",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          InkWell(
            onTap: () {
              goToSignIn();
            },
            child: Text(
              'ALREADY REGISTERED? SIGN IN',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
