import 'package:flutter/material.dart';
import 'package:quizz_app/displayquestions.dart';
import 'constants.dart';
class QuickQuiz extends StatefulWidget {
  static const routename="QuickQuiz_screen";
  @override
  _QuickQuizState createState() => _QuickQuizState();
}

class _QuickQuizState extends State<QuickQuiz> {
  List _locations = [0, 1, 2, 3, 4, 5];
  int _totalmarks = 0;
  double time=0;
 @override
  void initState() {
    // TODO: implement initState
   number_of_questions=0;
   correct_percentage=0;
   wrong_percentage=0;
   obtained_marks=0;
   super.initState();
  }
  @override
  Widget build(BuildContext context) {
    number_of_questions!=null?_totalmarks=number_of_questions*2:_totalmarks=0;
    time=number_of_questions*1.48;
    return Scaffold(
      appBar: AppBar(
        title: Text("Quick Quizz"),
      ),
      backgroundColor: Colors.deepPurpleAccent[100],
      body: SafeArea(
          child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/a.jpg'), fit: BoxFit.fill)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 520),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Quick Mockup',
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
                                            'Marks:',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          Text(
                                            '$_totalmarks',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Time:',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          Text(
                                            '$time min',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Total Question:',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          Text(
                                            '$number_of_questions',
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
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 10, 15, 150),
                                child: Text(
                                  'Chose Number of Questions',
                                  style: TextStyle(
                                      fontSize: 28.0,
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
                                            'Set A, 2 Mark Question:',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          DropdownButton(
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 19,
                                            ),
                                            dropdownColor: Colors.purpleAccent,
                                            value: number_of_questions,
                                            onChanged: (newValue) {
                                              setState(() {
                                                number_of_questions = newValue;
                                              });
                                            },
                                            items: _locations.map((location) {
                                              return DropdownMenuItem(
                                                child: new Text(
                                                  '$location',
                                                style: TextStyle(color: Colors.black),),
                                                value: location,
                                              );
                                            }).toList(),
                                          )
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(70, 5, 60, 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: FlatButton(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 30),
                              child: Text(
                                'Start',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed(Display_Questions_screen.routname,);
                            },
                          ),
                          elevation: 0,
                          color: Colors.deepPurple[300].withOpacity(0.5),
                        ),
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
