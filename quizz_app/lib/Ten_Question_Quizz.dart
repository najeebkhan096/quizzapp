import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quizz_app/result_screen.dart';
import 'constants.dart';

class Ten_Questions_Quiz extends StatefulWidget {
  static const routname="Ten_Questions_Quiz";
  @override
  _Ten_Questions_QuizState createState() =>
      _Ten_Questions_QuizState();
}

class _Ten_Questions_QuizState extends State<Ten_Questions_Quiz> {
  var Que_index = 0;
  int _Totalmarks = 0;
  var totalmarks;
int timer=30;
DateTime now=DateTime.now();
String show_timer="10";
  var sec=Duration(seconds: 1);
  void starttime(){
Timer.periodic(sec, (Timer t) {
  setState(() {
    if(timer<1 || Que_index >= ten_questions.length ){
      t.cancel();
    }
    else{
      timer--;
      print(timer);
      show_timer=timer.toString();
    }
  });


});
}

@override

void initState() {
    // TODO: implement initState
  print(now.weekday);
  starttime();

    super.initState();
    number_of_questions=ten_questions.length;
 correct_percentage=0;
 wrong_percentage=0;
    obtained_marks=0;
  }

  void nextquestion() {
    print("next ques is");
    setState(() {
      Que_index++;
    });
    print(ten_questions.length);
    print(ten_questions);
    print(Que_index);
  }

  @override
  Widget build(BuildContext context) {
    totalmarks = number_of_questions * 2;
    print(totalmarks);

    return Scaffold(
        appBar: AppBar(
          title: Text("Demo"),
        ),
        body: Stack(fit: StackFit.expand, children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/a.jpg'), fit: BoxFit.fill)),
          ),
          Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 7, 5, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Question 1/1',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Divider(
                              height: 5,
                              color: Colors.white,
                            ),
                            Text(
                              'Marks: $totalmarks',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              show_timer,
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2.0,
                                  fontSize: 16),
                            ),
                            Divider(
                              height: 10,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: FlatButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.deepPurple,
                              ),
                              label: Text(
                                'Finish Practice',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white),
                              )),
                          elevation: 0,
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ]),
                ),
                elevation: 0,
                color: Colors.deepPurple[400].withOpacity(0.5),
              ),
              Que_index < ten_questions.length && Que_index < number_of_questions
                  ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          ten_questions[Que_index]['Question'],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              fontSize: 24),
                        ),
                      ),
                      elevation: 0,
                      color: Colors.purple[400].withOpacity(0.5),
                    ),
                  ),
                  ...(ten_questions[Que_index]['answer'] as List<dynamic>)
                      .map((e) {
                    return Answer(e, ten_questions, Que_index,nextquestion);
                  }).toList(),

                ],
              )
                  : Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'We have No More Question',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            fontSize: 24),
                      ),
                    ),
                    elevation: 0,
                    color: Colors.purple[400].withOpacity(0.5),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: RaisedButton(
                        child: Text(
                          'Check Answer',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              fontSize: 24),
                        ),
                        onPressed: (){
                          correct_percentage=(obtained_marks/totalmarks)*100;
                          wrong_percentage=100-correct_percentage;
                          print(correct_percentage);
                          print(wrong_percentage);
                          print("ontaoined marks");
                          print(obtained_marks);
                          Navigator.of(context).pushReplacementNamed(Result.routname);
                        },
                      ),
                    ),
                    elevation: 0,
                    color: Colors.purple[400].withOpacity(0.5),
                  ),
                ],
              )
            ],
          ),
        ]));
  }
}

class Answer extends StatefulWidget {
  final String ans;
  final List question;
  final int index;
  final Function nextquestion;

  Answer(this.ans, this.question, this.index,this.nextquestion);

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  bool beforeselection = false;

  @override
  void initState() {
    // TODO: implement initState
    print("in it state");
    selected=0;
    super.initState();
  }

  bool pressed = false;
  int selected ;
  void checkreslut(String choice) {
    print("Correct answer is");
    print(widget.question[widget.index]['correctanswer']);
    if (choice == widget.question[widget.index]['correctanswer']) {
      obtained_marks = obtained_marks + 2;
    }

  }

  @override
  Widget build(BuildContext context) {
    print("in buoild method");

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                print("here it changed");
                checkreslut(widget.ans);
                widget.nextquestion();
              },
              child: Card(
                  elevation: 0,
                  color: Colors.white.withOpacity(0.3),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                          widget.ans,
                          style: TextStyle(color: Colors.white, fontSize: 20)
                      ),
                    ),
                  ))),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
