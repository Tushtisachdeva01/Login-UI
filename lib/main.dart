import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI Challenge 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationController _animationController2;
  AnimationController _animationController3;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animationController.forward();
    _animationController2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    Timer(
      Duration(milliseconds: 400),
      () => _animationController2.forward(),
    );
    _animationController3 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    Timer(
      Duration(milliseconds: 800),
      () => _animationController3.forward(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController2.dispose();
    super.dispose();
  }

  bool obscureText = true;
  _toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange[900],
              Colors.orange[800],
              Colors.orange[400],
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SlideTransition(
                    position:
                        Tween<Offset>(begin: Offset(0, -1), end: Offset.zero)
                            .animate(_animationController),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position:
                        Tween<Offset>(begin: Offset(0, -1), end: Offset.zero)
                            .animate(_animationController),
                    child: FadeTransition(
                      opacity: _animationController,
                      child: Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 70),
                      SlideTransition(
                        position: Tween<Offset>(
                                begin: Offset(0, -1), end: Offset.zero)
                            .animate(_animationController2),
                        child: FadeTransition(
                          opacity: _animationController2,
                          child: Container(
                            width: 340,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.orange,
                                  blurRadius: 15,
                                  offset: Offset(0, 10),
                                )
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: TextFormField(
                                    cursorColor: Colors.orange[900],
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.email,color: Colors.grey),
                                      hintText: "Email or Phone number",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1.5,
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: TextFormField(
                                    cursorColor: Colors.orange[900],
                                    keyboardType: TextInputType.visiblePassword,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.grey,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: _toggle,
                                        icon: obscureText
                                            ? Icon(Icons.visibility)
                                            : Icon(Icons.visibility_off),
                                        color: Colors.grey,
                                      ),
                                      hintText: "Password",
                                      border: InputBorder.none,
                                    ),
                                    obscureText: obscureText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SlideTransition(
                        position: Tween<Offset>(
                                begin: Offset(0, -1), end: Offset.zero)
                            .animate(_animationController3),
                        child: FadeTransition(
                          opacity: _animationController3,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 40),
                              Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 30),
                              _button(Colors.orange[800], 'Login'),
                              SizedBox(height: 40),
                              Text(
                                "Continue with social media",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 30),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      child: _button(
                                          Colors.blue[800], 'Facebook')),
                                  SizedBox(width: 40),
                                  Expanded(
                                      child: _button(Colors.black, 'Github')),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _button(Color color, String title) {
    return Container(
      width: 200,
      child: FlatButton(
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        color: color,
        onPressed: () {},
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}