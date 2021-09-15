import 'dart:math';

import 'package:flutter/material.dart';
import 'package:practice/auth/login_form.dart';
import 'package:practice/auth/sign_up.dart';
import 'package:practice/auth/social_button.dart';
import 'package:practice/constants.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  bool _isShowSignUp = false;
  late AnimationController _animationController;
  late Animation<double> _animationTextRotate;

  void setUpAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: defaultDuration);

    _animationTextRotate =
        Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  void updatedView() {
    setState(() {
      _isShowSignUp = !_isShowSignUp;
    });
    _isShowSignUp
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return Stack(
              children: [
                //login
                AnimatedPositioned(
                  duration: defaultDuration,
                  width: _size.width * 0.88,
                  height: _size.height,
                  left: _isShowSignUp ? -_size.width * 0.76 : 0,
                  // child: GestureDetector(
                  //   onTap: () {
                  //     setState(() {
                  //       _isShowSignUp = !_isShowSignUp;
                  //     });
                  //   },
                  child: Container(
                    color: login_bg,
                    child: LoginForm(),
                  ),
                ),

                //   ),
                //sign up
                AnimatedPositioned(
                    duration: defaultDuration,
                    height: _size.height,
                    width: _size.width,
                    left:
                        _isShowSignUp ? _size.width * 0.12 : _size.width * 0.88,
                    child: Container(
                      color: signup_bg,
                      alignment: Alignment.center,
                      child: SignUpForm(),
                    )),
                //logo
                AnimatedPositioned(
                  duration: defaultDuration,
                  left: 0,
                  top: _size.height * 0.1,
                  right: _isShowSignUp ? -_size.width * 0.1 : _size.width * 0.1,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 25,
                    child: Image.asset(
                      "assets/images/favicon.png",
                    ),
                  ),
                ),
                AnimatedPositioned(
                    duration: defaultDuration,
                    width: _size.width,
                    bottom: _size.height * 0.1,
                    right: _isShowSignUp
                        ? -_size.width * 0.06
                        : _size.width * 0.06,
                    child: SocalButtns()),
                //LOGIN TEXT ANIMATION
                AnimatedPositioned(
                  duration: defaultDuration,
                  bottom: _isShowSignUp
                      ? _size.height / 2 - 80
                      : _size.height * 0.3,
                  left: _isShowSignUp ? 0 : _size.width * 0.44 - 80,
                  child: AnimatedDefaultTextStyle(
                      duration: defaultDuration,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: _isShowSignUp ? 20 : 30,
                          fontWeight: FontWeight.bold,
                          color: _isShowSignUp ? Colors.white : Colors.white70),
                      child: Transform.rotate(
                        angle: -_animationTextRotate.value * pi / 180,
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: updatedView,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding * 0.75),
                            width: 160,
                            child: Text(
                              _isShowSignUp ? "Sign In" : "",
                            ),
                          ),
                        ),
                      )),
                ),
                AnimatedPositioned(
                  duration: defaultDuration,
                  bottom: !_isShowSignUp
                      ? _size.height / 2 - 80
                      : _size.height * 0.3,
                  right: _isShowSignUp ? _size.width * 0.44 - 80 : 0,
                  child: AnimatedDefaultTextStyle(
                      duration: defaultDuration,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: !_isShowSignUp ? 20 : 30,
                          fontWeight: FontWeight.bold,
                          color: _isShowSignUp ? Colors.white : Colors.white70),
                      child: Transform.rotate(
                        angle: (90 - _animationTextRotate.value) * pi / 180,
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: updatedView,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding * 0.75),
                            width: 160,
                            child: Text(
                              _isShowSignUp ? "" : "Sign Up",
                            ),
                          ),
                        ),
                      )),
                )
              ],
            );
          }),
    );
  }
}
