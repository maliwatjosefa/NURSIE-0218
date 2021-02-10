import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nursie/journal/journal.dart';
import 'package:nursie/medReminder/reminder.dart';
import 'package:nursie/screens/remedies.dart';
import 'package:nursie/screens/reports.dart';
import 'package:nursie/screens/user-profile.dart';

class Dashboard extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/dashboard_wp.png'),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 170.0),
                        CarouselSlider(
                          items: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => JournalPage()));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/jcard.png'),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => MedReminder()));
                              },
                              child: Container(
                                margin: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/medcard.png'),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => RemediesPage()));
                              },
                              child: Container(
                                margin: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/homecard.png'),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => Reports()));
                              },
                              child: Container(
                                margin: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/reportcard.png'),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => UserProfile()));
                              },
                              child: Container(
                                margin: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/usercard.png'),
                                  ),
                                ),
                              ),
                            )
                          ],
                          carouselController: buttonCarouselController,
                          options: CarouselOptions(
                            height: 400.0,
                            enlargeCenterPage: true,
                            aspectRatio: 20,
                            enableInfiniteScroll: false,
                            viewportFraction: 0.7,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ],
                    )))));
  }
}
