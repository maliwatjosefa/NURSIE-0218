import 'package:flutter/material.dart';
import 'package:nursie/journal/database.dart';
import 'package:nursie/journal/post.dart';
import 'package:nursie/journal/PostList.dart';
import 'package:nursie/screens/dashboard.dart';


class Reports extends StatefulWidget {
  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  List<Post> posts = [];

  Post argh;

  void getPosts(){
    getAllPosts().then((posts) => {
      this.setState((){
        this.posts = posts;
      })
    });
  }

  void initState(){
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffe7ecf0),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Stack(children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(top:120),
                  child: Container(
                  height: size.height * .3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage('assets/images/upperPart.png')))
                  ),
                ),
                new Container(
                    height: size.height * .3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.topCenter,
                            image: AssetImage('assets/images/reportsHeader.png')))
                ),
                new Padding(
                    padding: EdgeInsets.only(top:30),
                    child: IconButton(
                            alignment: Alignment.topLeft,
                            icon: Icon(Icons.arrow_back_rounded), 
                            onPressed: () {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Dashboard()));
  }),
                  ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20,70,20,0),
                    child: Column (children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(bottom: 70),
                        child: Column(children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[ 
                              Text.rich(TextSpan(
                                text: "Reports",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: TextStyle(fontSize: 50)),  
                            ]
                          ),
                          
                        ],)),
                      new Expanded(
                        child: PostList(this.posts))
                    ],)
                  )
                )
              ],

              )
        )
      )
      
      
      
    );
    
  }
}

//VERSION 1 W/O EXPANDED
/*child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Stack(children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(top:120),
                  child: Container(
                  height: size.height * .3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage('assets/pic/upperPart.png')))
                  ),
                ),
                new Container(
                    height: size.height * .3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.topCenter,
                            image: AssetImage('assets/pic/ReportsPage/reportsHeader.png')))
                ),
                new Padding(
                    padding: EdgeInsets.only(top:30),
                    child: IconButton(
                            alignment: Alignment.topLeft,
                            icon: Icon(Icons.arrow_back_rounded), 
                            onPressed:null),
                  ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20,85,20,0),
                    child: Column (children: <Widget>[
                      Container(
                        child: Column(children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[ 
                              Text.rich(TextSpan(
                                text: "Reports",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: TextStyle(fontSize: 50)),  
                            ]
                          ),
                          /*
                          Container(
                            //padding: EdgeInsets.only(top:300),
                            height: MediaQuery.of(context).size.width*0.33,
                            child: PostList(this.posts)
                          ),
                          */ 
                        ],))
                    ],)
                  )
                )
              ],

              )
            )
          ],
        )
*/

/*
Column(
        children: <Widget>[
          Container(
            child: Text("Testing lang")
          ),
          Expanded(
            child: PostList(this.posts)),
          /*
          DataTable(
            columns: [
              DataColumn(label: Text('Category')),
              DataColumn(label: Text('Input')),
              DataColumn(label: Text('Date/Time')),
            ],
            rows: List<DataRow>.generate(
              tangina.length,
              (index) => DataRow(
                cells: [
                  DataCell(Text(tangina[index].category)),
                  DataCell(Text(tangina[index].input)),
                  DataCell(Text(tangina[index].dateTime)),
                ])
            )
            
            [
              DataRow(
                cells: [
                  DataCell(Text(argh.category)),
                  DataCell(Text(argh.input)),
                  DataCell(Text(argh.dateTime)),
                ]
              ) 
            ] 
          .toList())*/
      ],)
*/