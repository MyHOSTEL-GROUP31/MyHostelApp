import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myhostel/widgets/inputTextWidget.dart';

import 'loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen() : super();

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Segoe UI',
              fontSize: 30,
              shadows: [
                Shadow(
                  color: const Color(0xba000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                )
              ],
            )),
        //centerTitle: true,
        leading: InkWell(
          onTap: () => Get.to(LoginScreen()),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: screenWidth,
          height: screenHeight,
          child: SingleChildScrollView(
            //controller: controller,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'Create Account',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff000000),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  InputTextWidget(
                      labelText: "First name",
                      icon: Icons.person,
                      obscureText: false,
                      keyboardType: TextInputType.text),
                  SizedBox(
                    height: 10.0,
                  ),
                  InputTextWidget(
                      labelText: "Last name",
                      icon: Icons.person,
                      obscureText: false,
                      keyboardType: TextInputType.text),
                  SizedBox(
                    height: 10.0,
                  ),
                  InputTextWidget(
                      labelText: "college",
                      icon: Icons.person,
                      obscureText: false,
                      keyboardType: TextInputType.text),
                  SizedBox(
                    height: 10.0,
                  ),
                  InputTextWidget(
                      controller: _emailController,
                      labelText: "Email Address",
                      icon: Icons.email,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress),
                  SizedBox(
                    height: 10.0,
                  ),
                  InputTextWidget(
                      labelText: "Phone number",
                      icon: Icons.phone,
                      obscureText: false,
                      keyboardType: TextInputType.number),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Container(
                      child: Material(
                        elevation: 15.0,
                        shadowColor: Colors.black,
                        borderRadius: BorderRadius.circular(15.0),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 20.0, left: 15.0),
                          child: TextFormField(
                              obscureText: true,
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                  size: 32.0, /*Color(0xff224597)*/
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(
                                    color: Colors.black54, fontSize: 18.0),
                                hintText: '',
                                enabledBorder: InputBorder.none,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black54),
                                ),
                                border: InputBorder.none,
                              ),
                              controller: _pass,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'password not accepted ';
                                } else if (val.length < 6) {
                                  return 'please use a password of more than 6 characters';
                                }

                                return null;
                              }),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Container(
                      child: Material(
                        elevation: 15.0,
                        shadowColor: Colors.black,
                        borderRadius: BorderRadius.circular(15.0),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 20.0, left: 15.0),
                          child: TextFormField(
                              obscureText: true,
                              autofocus: false,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                  size: 32.0, /*Color(0xff224597)*/
                                ),
                                labelText: "Confirm Password",
                                labelStyle: TextStyle(
                                    color: Colors.black54, fontSize: 18.0),
                                hintText: '',
                                enabledBorder: InputBorder.none,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black54),
                                ),
                                border: InputBorder.none,
                              ),
                              controller: _confirmPass,
                              validator: (val) {
                                if (val!.isEmpty) return 'invalid Password!!';
                                if (val != _pass.text)
                                  return 'Passwords dont match';
                                return null;
                              }),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    height: 55.0,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {}
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 0.0,
                        minimumSize: Size(screenWidth, 150),
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Color(0xfff05945),
                                  offset: const Offset(1.1, 1.1),
                                  blurRadius: 10.0),
                            ],
                            color: Color(0xffF05945),
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Create",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
