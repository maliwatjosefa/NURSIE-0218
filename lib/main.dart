import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nursie/authentication/user-details.dart';
import 'package:nursie/screens/WelcomeScreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserAuth())
      ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(), 
      
      title: 'Nursie',
      theme: ThemeData(
          //primarySwatch: colorCustom,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      
    ),
    );
  }
}
