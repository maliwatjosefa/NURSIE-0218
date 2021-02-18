import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nursie/authentication/user-data.dart';
import 'package:nursie/authentication/user-details.dart';
import 'package:nursie/main.dart';
import 'package:nursie/screens/SignupScreen.dart';
import 'package:nursie/screens/dashboard.dart';
import 'package:nursie/screens/forgotPW.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static final FacebookLogin facebookSignIn = new FacebookLogin();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String name = '', image;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

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
                              SizedBox(height: 210),
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
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Column(
                                        children: <Widget>[
                                          SignInButton(
                                            Buttons.Facebook,
                                            onPressed: () async {
                                              final FacebookLoginResult result =
                                                  await facebookSignIn
                                                      .logIn(['email']);

                                              switch (result.status) {
                                                case FacebookLoginStatus
                                                    .loggedIn:
                                                  final FacebookAccessToken
                                                      accessToken =
                                                      result.accessToken;
                                                  final graphResponse =
                                                      await http.get(
                                                          'https://graph.facebook.com/v2.12/me?fields=first_name,picture&access_token=${accessToken.token}');
                                                  final profile = jsonDecode(
                                                      graphResponse.body);
                                                  print(profile);
                                                  setState(() {
                                                    name =
                                                        profile['first_name'];
                                                    image = profile['picture']
                                                        ['data']['url'];
                                                  });
                                                  print('''
                                                        Logged in!
                                                        
                                                        Token: ${accessToken.token}
                                                        User id: ${accessToken.userId}
                                                        Expires: ${accessToken.expires}
                                                        Permissions: ${accessToken.permissions}
                                                        Declined permissions: ${accessToken.declinedPermissions}
                                                        ''');
                                                  break;
                                                case FacebookLoginStatus
                                                    .cancelledByUser:
                                                  print(
                                                      'Login cancelled by the user.');
                                                  break;
                                                case FacebookLoginStatus.error:
                                                  print(
                                                      'Something went wrong with the login process.\n'
                                                      'Here\'s the error Facebook gave us: ${result.errorMessage}');
                                                  break;
                                              }
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (ctx) =>
                                                          Dashboard()));
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Column(
                                        children: <Widget>[
                                          SignInButton(Buttons.GoogleDark,
                                              onPressed: () async {
                                            // try {
                                            //   final GoogleSignIn _googleSignIn =
                                            //       GoogleSignIn(
                                            //     scopes: ['email'],
                                            //   );
                                            //   final FirebaseAuth _auth =
                                            //       FirebaseAuth.instance;

                                            //   final GoogleSignInAccount
                                            //       googleUser =
                                            //       await _googleSignIn.signIn();
                                            //   final GoogleSignInAuthentication
                                            //       googleAuth = await googleUser
                                            //           .authentication;

                                            //   final AuthCredential credential =
                                            //       GoogleAuthProvider.credential(
                                            //     accessToken:
                                            //         googleAuth.accessToken,
                                            //     idToken: googleAuth.idToken,
                                            //   );

                                            //   final User user = (await _auth
                                            //           .signInWithCredential(
                                            //               credential))
                                            //       .user;
                                            //   print("signed in " +
                                            //       user.displayName);

                                            //   return user;
                                            // } catch (e) {
                                            //   print(e.message);
                                            // }
                                            login();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        Dashboard()));
                                          }),
                                        ],
                                      ),
                                    )
                                  ]),
                              SizedBox(
                                height: 30,
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
  void login() async {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      // you can add extras if you require
    ],
  );

  _googleSignIn.signIn().then((GoogleSignInAccount acc) async {
    GoogleSignInAuthentication auth = await acc.authentication;
    print(acc.id);
    print(acc.email);
    print(acc.displayName);
    print(acc.photoUrl);

    acc.authentication.then((GoogleSignInAuthentication auth) async {
      print(auth.idToken);
      print(auth.accessToken);
    });
  });
}
}
