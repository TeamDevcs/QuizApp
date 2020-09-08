import 'package:QuizAppCs/LoginPage/create_login.dart';
import 'package:QuizAppCs/LoginPage/home_signin_widget.dart';
import 'package:QuizAppCs/LoginPage/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuFrame extends StatelessWidget {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 40.0),
                child: Column(
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.solidHeart,
                      color: Color.fromRGBO(245, 48, 111, 1.0),
                      size: 60.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Wait for title',
                          style: TextStyle(
                            fontSize: 34.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(245, 48, 111, 1.0),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: pageController,
                children: <Widget>[
                  HomeSignInWidget(
                    goToSignIn: () {
                      pageController.animateToPage(1,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    },
                    goToSignUp: () {
                      pageController.animateToPage(2,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    },
                  ),
                  SignIn(),
                  CreateLogin(
                    cencelBackToHome: () {
                      pageController.animateToPage(0,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromRGBO(255, 123, 67, 1.0),
              Color.fromRGBO(245, 50, 111, 1.0),
            ])),
      ),
    );
  }
}
