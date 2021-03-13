import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quizz_app/home.dart';
import 'package:quizz_app/result_screen.dart';
import 'constants.dart';
import 'package:http/http.dart' as http;

const String testDevice = 'YOUR_DEVICE_ID';
class Practice_Questions_screen extends StatefulWidget {
  static const routname = "Practice_Questions_screen";

  @override
  _Practice_Questions_screenState createState() =>
      _Practice_Questions_screenState();
}

class _Practice_Questions_screenState extends State<Practice_Questions_screen> {
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    childDirected: true,
    nonPersonalizedAds: true,
  );
  int _coins = 0;

  var Que_index = 0;
  int _Totalmarks = 0;

  var totalmarks;
  var now = new DateTime.now();
  String mockup;

  int timer = 30;
  String show_timer = "10";
  var sec = Duration(seconds: 1);

  void starttime() {
    Timer.periodic(sec, (Timer t) {
      setState(() {
        if (timer < 1 || Que_index >= practice_questions.length) {
          t.cancel();
        } else {
          timer--;
          print(timer);
          show_timer = timer.toString();
        }
      });
    });
  }

  void upload_Mockup() async {
    String url =
        "https://quizzapp-7acc8-default-rtdb.firebaseio.com/mockup.json";
    final response = await http.post(url,
        body: jsonEncode({
          'Mockup': mockup,
          'date': DateFormat("dd-MM-yyyy").format(now),
          'time': DateFormat("H:m:s").format(now),
          'CorrectQuestions': corrected_que,
          'TotalQuestions': practice_questions.length,
          'percentage': correct_percentage
        }));
  }

  void nextquestion() {
    print("next ques is");
    setState(() {
      Que_index++;
      if (Que_index >= practice_questions.length) {
        upload_Mockup();
      }
    });

    print(Que_index);
  }

  @override
  void initState() {
    // TODO: implement initState
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);

    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      print("RewardedVideoAd event $event");
      if (event == RewardedVideoAdEvent.rewarded) {
        setState(() {
          _coins += rewardAmount;
          coins = _coins;
        });
      }
    };

    RewardedVideoAd.instance.load(
        adUnitId: RewardedVideoAd.testAdUnitId, targetingInfo: targetingInfo);

    if (coins != 0) {
      starttime();
    }

    get_coins();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    if (coins >= 0) {
      coins--;
      if (coins >= 0) {
        update_coins();
      }
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    totalmarks = number_of_questions * 2;
    number_of_questions = practice_questions.length;
    mockup = ModalRoute.of(context).settings.arguments;
    print("rimsha");
    print(coins);
    return Scaffold(
        appBar: AppBar(
          title: Text("Practice Quizz"),
        ),
        body: Stack(fit: StackFit.expand, children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/a.jpg'), fit: BoxFit.fill)),
          ),
          coins <= 0
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 150,
                        child: Card(
                          color: Colors.white10,
                          child: Center(
                              child: Column(
                            children: [
                              Text(
                                "Get Coins OR Watch ADS ",
                                style: TextStyle(
                                    letterSpacing: 1.5,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                              RaisedButton(
                                onPressed: () {
                                  RewardedVideoAd.instance.show();
                                },
                                child: Text(
                                  "Click Here",
                                  style: TextStyle(
                                      letterSpacing: 1.5,
                                      color: Colors.white,
                                      fontSize: 20),
                                ),
                              )
                            ],
                          )),
                        ),
                      ),
                      Card(
                        color: Colors.white10,
                        child: Container(
                          height: 100,
                          width: 200,
                          child: FlatButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed(Home.routname);
                              },
                              child: Text(
                                "Press Me",
                                style: TextStyle(
                                    letterSpacing: 1.5,
                                    color: Colors.white,
                                    fontSize: 20),
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
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
                                    'Question ${Que_index}/${practice_questions.length}',
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
                    Que_index < practice_questions.length &&
                            Que_index < number_of_questions
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
                                      practice_questions[Que_index]['Question'],
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
                              ...(practice_questions[Que_index]['answer']
                                      as List<dynamic>)
                                  .map((e) {
                                return Answer(e, practice_questions, Que_index,
                                    nextquestion);
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
                                    onPressed: () {
                                      correct_percentage =
                                          (obtained_marks / totalmarks) * 100;
                                      wrong_percentage =
                                          100 - correct_percentage;
                                      print(correct_percentage);
                                      print(wrong_percentage);
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                              Result.routname);
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
  final List practice_questions;
  final int index;
  final Function nextquestion;

  Answer(this.ans, this.practice_questions, this.index, this.nextquestion);

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  bool beforeselection = false;

  @override
  void initState() {
    // TODO: implement initState
    print("in it state");
    selected = 0;
    super.initState();
  }

  bool pressed = false;
  int selected;
  void checkreslut(String choice) {
    print("Correct answer is");
    print(widget.practice_questions[widget.index]['correctanswer']);
    if (choice == widget.practice_questions[widget.index]['correctanswer']) {
      obtained_marks = obtained_marks + 2;
      corrected_que++;
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
                      child: Text(widget.ans,
                          style: TextStyle(
                            color: Colors.black,
                            wordSpacing: 2,
                            letterSpacing: 2,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
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
