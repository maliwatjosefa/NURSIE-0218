import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nursie/screens/SignupScreen.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String _email;
  final auth = FirebaseAuth.instance;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //backgroundColor: Colors.red,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/forgotpw.png'),
                fit: BoxFit.cover),
          ),
          child: Column(children: [
            Container(
              child: Padding(
                  padding: const EdgeInsets.only(top: 300, left: 20, right: 20),
                  child: Text(
                    "Enter your email and we'll send you a link to reset your password.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                            onChanged: (value) {
                              setState(() {
                                _email = value.trim();
                              });
                            },
                    validator: (reset) {
                      if (reset.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
                                child: Material(
                                  color: Color(0xffadddce),
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: MaterialButton(
                                    minWidth: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(10),
                                    onPressed: () {
                                      auth.sendPasswordResetEmail(email: _email);
                                      Navigator.of(context).pop();
                                    },
                                    
                                    child: Text("Send reset link",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                              SizedBox(height: 40),
                              Center(
                                child: Text(
                                  'Or',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                    height: 40,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  SignupScreen()));
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          decoration: TextDecoration.underline),
                                    ),
                                  )
          ]),
        ));
  }
}
