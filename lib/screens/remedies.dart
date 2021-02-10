import 'package:flutter/material.dart';
import 'package:nursie/screens/dashboard.dart';

class RemediesPage extends StatefulWidget {
  @override
  _RemediesPageState createState() => _RemediesPageState();
}

class _RemediesPageState extends State<RemediesPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffe7ecf0),
      //backgroundColor: Color(0xFFfffbe8),
      //appBar: AppBar(centerTitle: true, title: Text("Journal", style: TextStyle(fontSize: 25, fontFamily: 'Casanova'))),
      body: Stack(
      children: <Widget>[
        Container(
            height: 600,
            decoration: BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage('assets/images/remediesHeader.png')))),
        Padding(
          padding: EdgeInsets.only(top:30),
          child: IconButton(
                  alignment: Alignment.topLeft,
                  icon: Icon(Icons.arrow_back), 
                  onPressed: () {
                     Navigator.push(
        context, MaterialPageRoute(builder: (context) => Dashboard()));
                  }),),
        Padding(
              padding: EdgeInsets.only(top:600),
              child: Container(
                height: size.height * .3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage('assets/images/lower.png')))
              ),
            ),
        SafeArea(
            child: Padding(
                padding: EdgeInsets.fromLTRB(20,50,20,10),
                child: Column(
                  children: <Widget>[
                    Container(  
                        height: 100,
                        margin: EdgeInsets.only(bottom: 50),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text.rich(TextSpan(
                                text: "Remedies",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold, 
                                  //fontFamily: "Caveat"
                                  ),
                              ),
                              style: TextStyle(fontSize: 50)),  
                              ]
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("  I am looking for a remedy for...", 
                                  style: TextStyle(
                                    fontSize: 18, 
                                    //fontFamily: "Roboto Mono"
                                  )),
                              ]  
                            )
                           
                          ]
                          
                        )
                        
                    ),
                    SizedBox(height: 28,),
                    Expanded(
                      child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        primary: false,
                        children: <Widget>[
                          ClipRect(
                            child: Container(
                            //transformAlignment: Alignment(5, -5),
                            width: 125.0,
                            height: 125.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/fever.png'))),
                            child: FlatButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: (){},
                              //  () {
                              //debugPrint('Fever Button');
                              //},
                              child: null,
                            ),
                          )),
                          ClipRect(
                            child: Container(
                            //transformAlignment: Alignment(5, -5),
                            width: 125.0,
                            height: 125.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/headache.png'))),
                            child: FlatButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: (){},
                              //  () {
                              //debugPrint('Fever Button');
                              //},
                              child: null,
                            ),
                          )),
                          ClipRect(
                            child: Container(
                            //transformAlignment: Alignment(5, -5),
                            width: 125.0,
                            height: 125.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/stomach.png'))),
                            child: FlatButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: (){},
                              //  () {
                              //debugPrint('Fever Button');
                              //},
                              child: null,
                            ),
                          )),
                          ClipRect(
                            child: Container(
                            //transformAlignment: Alignment(5, -5),
                            width: 125.0,
                            height: 125.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/cough.png'))),
                            child: FlatButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: (){},
                              //  () {
                              //debugPrint('Fever Button');
                              //},
                              child: null,
                            ),
                          )),
                          ClipRect(
                            child: Container(
                            //transformAlignment: Alignment(5, -5),
                            width: 125.0,
                            height: 125.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/colds.png'))),
                            child: FlatButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: (){},
                              //  () {
                              //debugPrint('Fever Button');
                              //},
                              child: null,
                            ),
                          )),
                          ClipRect(
                            child: Container(
                            //transformAlignment: Alignment(5, -5),
                            width: 125.0,
                            height: 125.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('assets/images/taste.png'))),
                            child: FlatButton(
                              padding: EdgeInsets.all(0.0),
                              onPressed: (){},
                              //  () {
                              //debugPrint('Fever Button');
                              //},
                              child: null,
                            ),
                          ))
                        ],
                        crossAxisCount: 2,
                      )
                    ), 
                  ],
                )))
      ],
    ));
  }
}