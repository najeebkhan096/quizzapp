import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

import 'package:quizz_app/home.dart';
import 'package:quizz_app/show_answer_screen.dart';
import 'constants.dart';
class Result extends StatefulWidget {
  static const routname="result_screen";
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  final _size = Size(300.0, 300.0);

  @override
  Widget build(BuildContext context) {
print(correct_percentage.toStringAsFixed(2));
correct_percentage=double.parse(correct_percentage.toStringAsFixed(2));
wrong_percentage=double.parse(wrong_percentage.toStringAsFixed(2));
return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'images/a.jpg'),
                        fit: BoxFit.fill)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 520),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Result',
                      style: TextStyle(
                          fontSize: 38.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  elevation: 0,
                  color: Colors.white30.withOpacity(0.2),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 170, horizontal: 150),
                                  ),
                                  elevation: 0,
                                  color: Colors.white.withOpacity(0.4),
                                ),
                              ),
                              Column(
                                children: [
                                  AnimatedCircularChart(

                                    size: _size,

                                    initialChartData: <CircularStackEntry>[

                                      CircularStackEntry(

                                        <CircularSegmentEntry>[

                                          CircularSegmentEntry(correct_percentage,

                                              Colors.greenAccent[400].withOpacity(0.5),

                                              rankKey: 'Completed'),

                                          CircularSegmentEntry(double.parse(wrong_percentage.toStringAsFixed(2)),

                                              Colors.redAccent[400].withOpacity(0.5),

                                              rankKey: 'Remaining'),

                                        ],

                                        rankKey: 'Progress',

                                      ),

                                    ],

                                    chartType: CircularChartType.Pie,

                                    percentageValues: true,

                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(color: Colors.greenAccent[400].withOpacity(0.5),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "$correct_percentage Correct",
                                            style: TextStyle(

                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 30,),
                                      Container(
                                        color:  Colors.redAccent[400].withOpacity(0.5),
                                        child: Padding(

                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "$wrong_percentage Wrong",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        135, 10, 144, 200),
                                    child: Text(
                                      'Details',
                                      style: TextStyle(
                                          fontSize: 30.0,
                                          letterSpacing: 2.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  elevation: 0,
                                  color: Colors.white30.withOpacity(0.2),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(15, 80, 15, 0),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(12, 20, 12, 40),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Total Questions:',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 30.0,
                                              ),
                                              Text(
                                                (number_of_questions).toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20,),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Total Marks:',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 30.0,
                                              ),
                                              Text(
                                                (number_of_questions*2).toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            height: 20,
                                            color: Colors.white.withOpacity(0.5),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Marks Obtained:',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 30.0,
                                              ),
                                              Text(
                                                obtained_marks.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    elevation: 0,
                                    color: Colors.deepPurple[300].withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: FlatButton(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 18, horizontal: 10),
                                    child: Text(
                                      'Show Answers',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Show_Answer_Screen.routname,arguments: practice_questions);
                                  },
                                ),
                                elevation: 0,
                                color: Colors.deepPurple[300].withOpacity(0.5),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: FlatButton(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 18, horizontal: 30),
                                    child: Text(
                                      'Exit',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, Home.routname);
                                  },
                                ),
                                elevation: 0,
                                color: Colors.purple[400].withOpacity(0.5),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}