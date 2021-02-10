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

// // Map<int, Color> color = {
// //   50: Color.fromRGBO(173, 221, 207, .1),
// //   100: Color.fromRGBO(173, 221, 207, .2),
// //   200: Color.fromRGBO(173, 221, 207, .3),
// //   300: Color.fromRGBO(173, 221, 207, .4),
// //   400: Color.fromRGBO(173, 221, 207, .5),
// //   500: Color.fromRGBO(173, 221, 207, .6),
// //   600: Color.fromRGBO(173, 221, 207, .7),
// //   700: Color.fromRGBO(173, 221, 207, .8),
// //   800: Color.fromRGBO(173, 221, 207, .9),
// //   900: Color.fromRGBO(173, 221, 207, 1),
// // };

// MaterialColor colorCustom = MaterialColor(0xFFADDDCF, color);

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
      //JournalPage(),
      title: 'Nursie',
      theme: ThemeData(
          //primarySwatch: colorCustom,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      
    ),
    );
  }
}