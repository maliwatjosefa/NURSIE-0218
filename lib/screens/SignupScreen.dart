import 'package:flutter/material.dart';
import 'package:nursie/authentication/user-data.dart';
import 'package:nursie/authentication/user-details.dart';
import 'package:nursie/screens/LoginScreen.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final UserData user = UserData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/signup_wp.png'),
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
                              SizedBox(height: 165),
                              TextFormField(
                                obscureText: false,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    hintText: "Name",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0))),
                                validator: (name) {
                                  if (name.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                                onSaved: (name) => user.name = name,
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                obscureText: false,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    hintText: "Age",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0))),
                                validator: (birthday) {
                                  if (birthday.isEmpty) {
                                    return 'Please enter birthday';
                                  } 
                                  return null;
                                },
                                onSaved: (age) => user.age = age,
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                obscureText: false,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 15.0, 20.0, 15.0),
                                    hintText: "Birthday (m/dd/yyyy)",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0))),
                                validator: (birthday) {
                                  if (birthday.isEmpty) {
                                    return 'Please enter birthday';
                                  } 
                                  return null;
                                },
                                onSaved: (birthday) => user.birthday = birthday,
                              ),
                              SizedBox(height: 20),
                              TextFormField(
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
                                      return 'Please enter a valid e-mail';
                                    }
                                  return null;
                                },
                                onSaved: (email) => user.email = email,
                              ),
                              SizedBox(height: 20),
                              TextFormField(
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
                                    return 'Please enter password';
                                  }
                                  return null;
                                },
                                onSaved: (password) => user.password = password,
                              ),
                              SizedBox(height: 45),
                              Material(
                                color: Color(0xffadddce),
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(30.0),
                                child: MaterialButton(
                                  minWidth: MediaQuery.of(context).size.width,
                                  padding:
                                      EdgeInsets.all(10),
                                  onPressed: () {
                                    if (formKey.currentState.validate()) {
                                      formKey.currentState.save();
                                    }
                                    userAuth.signUp(
                                        userData: user,
                                        onSuccess: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen()));
                                        },
                                        onFail: () {
                                          print('an error aoccured: ');
                                        });
                                  },
                                  child: Text("Sign up",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ),
                              ),
                              SizedBox(height: 30),
                              Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        SizedBox(
                          width: 10,
                          height: 35,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (ctx) => LoginScreen()));
                          },
                          child: Text(
                            'Login',
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
            ),
          ),
        );
  }
}
