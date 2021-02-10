import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nursie/authentication/user-data.dart';
import 'package:nursie/authentication/user-details.dart';
import 'package:nursie/screens/SignupScreen.dart';
import 'package:nursie/screens/dashboard.dart';
import 'package:nursie/screens/forgotPW.dart';
import 'package:provider/provider.dart';

import 'package:nursie/TEST/test.dart';

// GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
//    'email',
// ]);

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // GoogleSignInAccount _currentUser;
  
  // void initState() {
  //   super.initState();
  //   _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
  //     setState(() {
  //       _currentUser = account;
  //     });
  //     if (_currentUser != null) {
  //       Navigator.push(context, 
  //         MaterialPageRoute(builder: (context) => TestPage()));
  //     }
  //    });
  // }

  // Future<void> _handleSignIn() async {
  //   try {
  //     await _googleSignIn.signIn();
  //   } catch (error) { 
  //     print(error);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/sign_wp.png'),
                  fit: BoxFit.cover),
            ),
            child: Form(
              key: formKey,
              child: Consumer<UserAuth>(builder: (_, userAuth, __) {
                return Column(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(36.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 220),
                              TextFormField(
                                controller: _emailController,
                                obscureText: false,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    hintText: "Email",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0))),
                                validator: (email) {
                                  if (email.isEmpty) {
                                    return 'Please enter e-mail';
                                  } else if (!email.contains('@')) {
                                    return 'Please type a valid e-mail';
                                  }
                                  return null;
                                },
                                //onSaved: (email) => user.email = email,
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    hintText: "Password",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0))),
                                validator: (password) {
                                  if (password.isEmpty) {
                                    return 'Please enter a password';
                                  } else if (password.length < 6) {
                                    return 'Password must have more than 6 characters';
                                  }
                                  return null;
                                },
                                //onSaved: (password) => user.password = password,
                              ),
                              SizedBox(height: 25),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ForgotPassword()));
                                    },
                                    child: Container(
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                              SizedBox(height: 35),
                              Material(
                                color: Color(0xffadddce),
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(30.0),
                                child: MaterialButton(
                                  minWidth: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(10),
                                  onPressed: () {
                                    if (formKey.currentState.validate()) {
                                      userAuth.signIn(
                                          userData: UserData(
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                          ),
                                          onFail: (e) {
                                            print('an error occured');
                                          },
                                          onSuccess: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Dashboard()));
                                                       
                                          });
                                    }
                                  },
                                  child: Text("Login",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ),
                              ),
                              SizedBox(height: 30),
                              Center(
                                child: Text(
                                  'Or',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  SignupScreen()));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(23),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image:
                                            AssetImage('assets/images/facebook.png'),
                                      )),
                                    ),
                                  ),
                                  SizedBox(width: 30,),
                                  InkWell(
                                    onTap: () {
                                      //_handleSignIn();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(23),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image:
                                            AssetImage('assets/images/google.png'),
                                      )),
                                    ),
                                  ),
                                ],
                              ),

                             
                                  // SignInButton(
                                  // Buttons.Google, 
                                  //   text: 'Sign in with Google', 
                                  //   onPressed: () {
                                  //     _handleSignIn();
                                  //   },),
                              
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Don't have an account?",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 10,
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
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            )));
  }
}
