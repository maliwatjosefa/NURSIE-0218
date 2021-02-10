import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nursie/screens/LoginScreen.dart';

GoogleSignIn googleSignIn;

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowLoginInfo(),
    );
  }
}

class ShowLoginInfo extends StatefulWidget {
  @override
  _ShowLoginInfoState createState() => _ShowLoginInfoState();
}

class _ShowLoginInfoState extends State<ShowLoginInfo> {
  String userImg;
  String userName;

  @override
  void initState() {

    super.initState();
    _handleInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: (userImg != null)
                ? Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(userImg),
                        )),
                  )
                : _showLoading(),
          ),
          SizedBox(
            height: 10,
          ),
          (userName != null)
              ? Text(
                userName,
                  style: TextStyle(fontSize: 32, color: Colors.black,
                  ))
              : Text(
                  'We are looking for username',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                )
        ],
      ),
    );
  }

  Widget _showLoading() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: Center(
        child: const CircularProgressIndicator(),
      ),
    );

  }

  Future<void> _handleInfo() async {
    try {
      GoogleSignInAccount data = await googleSignIn.signIn() ?? null;
      print(data.toString());
      if (data != null) {
        userName   = data.displayName;
        userImg = data.photoUrl;
      }
    } catch (error) {
      print(error);
    }
  }
}
