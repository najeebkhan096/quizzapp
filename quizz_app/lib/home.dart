import 'dart:convert';
import 'package:intl/intl.dart';  //for date format
import 'package:flutter/material.dart';
import 'package:quizz_app/Ten_Question_Quizz.dart';
import 'package:quizz_app/practice.dart';
import 'package:quizz_app/quick_quiz.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';


class Home extends StatefulWidget {

  static const routname="home";
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
@override
  void initState() {
    // TODO: implement initState
  // postQuestions();

  get_Practice_Questions();
  get_Ten_Questions();
  getQuestions();
  get_coins();

    super.initState();
  }

DateTime now =  DateTime.now();
var formatter =  DateFormat.yMMMMd();


void get_Practice_Questions()async{

  print("in Practice_questions method");
  final url="https://quizzapp-7acc8-default-rtdb.firebaseio.com/practice_questions.json?auth=$authtoken";
  final response=await http.get(url);
  var data=json.decode(response.body) as List<dynamic>;
  practice_questions=[];
  for(var i in data){
    if(!practice_questions.contains(i)){
      practice_questions.add(i);
    }
  };
  print(practice_questions);

}
void get_Ten_Questions()async{
  print("in ten_questions method");
  final url="https://quizzapp-7acc8-default-rtdb.firebaseio.com/ten_questions.json?auth=$authtoken";
  final response=await http.get(url);

  var data=json.decode(response.body) as List<dynamic>;
      ten_questions=[];
  print("chup kr");
  print(data);
    for(var i in data){
      if(!ten_questions.contains(i)){
        ten_questions.add(i);
      }
    };

}
void getQuestions()async{
  print("in get question method");
  final url="https://quizzapp-7acc8-default-rtdb.firebaseio.com/questions.json?auth=$authtoken";
  final response=await http.get(url);
  var data=json.decode(response.body) as  Map<String, dynamic>;
  data.forEach((key, value) {
    for(var i in value){
      if(!questions.contains(i)){
        questions.add(i);
      }
    }
  });

}


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/a.jpg'),
                        fit: BoxFit.fill
                    )
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10,100,10,140),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 105),
                    child:
                    Text(
                      'Quiz App',
                      style: TextStyle(

                          fontSize: 38.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  elevation: 0,
                  color: Colors.white30.withOpacity(0.2),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,200,0,0),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(70, 40, 60, 2),
                            child: Card(

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: FlatButton(
                                  child: Text(
                                    '2 Question Quiz ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold

                                    ),
                                  ),
                                  onPressed: (){
                                    Navigator.of(context).pushReplacementNamed(Ten_Questions_Quiz.routname);
                                    },
                                ),
                              ),

                              elevation: 0,
                              color: Colors.deepPurple[300].withOpacity(0.5),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                                  child: FlatButton(
                                    child: Text(
                                      'Practice ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold

                                      ),
                                    ),
                                    onPressed: (){
                                      Navigator.pushReplacementNamed(context, Practice.routname);
                                    },
                                  ),
                                ),

                                elevation: 0,
                                color: Colors.deepPurple[300].withOpacity(0.5),
                              ),

                              Card(

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                                  child: FlatButton(
                                    child: Text(
                                      'Quick Quiz',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold

                                      ),
                                    ),
                                    onPressed: (){
                                      Navigator.of(context).pushReplacementNamed(QuickQuiz.routename);
                                    },
                                  ),
                                ),

                                elevation: 0,
                                color: Colors.deepPurple[300].withOpacity(0.5),
                              ),
                            ],
                          ),
                          Row( mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: MediaQuery.of(context).size.width*0.2,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: FlatButton(
                                      child: Text(
                                        'Quiz History ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      onPressed: (){},
                                    ),

                                    elevation: 0,
                                    color: Colors.deepPurple[300].withOpacity(0.5),
                                  ),
                                ),
                              ),

                              Container(
                            height: MediaQuery.of(context).size.width*0.2,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 39),
                                    child: FlatButton(
                                      child: Text(
                                        'Tips ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      onPressed: (){},
                                    ),
                                  ),

                                  elevation: 0,
                                  color: Colors.deepPurple[300].withOpacity(0.5),
                                ),
                              ),
                            ],
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Container(
                                height: MediaQuery.of(context).size.width*0.15,
                                width: MediaQuery.of(context).size.height*0.17,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: FittedBox(
                                    child: FlatButton.icon(
                                      icon: Icon(
                                        Icons.contact_support,
                                        color: Colors.deepPurple,
                                      ),
                                      label: Text(
                                        'Contact Us',
                                        style: TextStyle(
                                            color: Colors.deepPurple,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold

                                        ),
                                      ),
                                      onPressed: (){},
                                    ),
                                  ),

                                  elevation: 0,
                                  color: Colors.white30.withOpacity(0.2),
                                ),
                              ),

                              Container(
                                height: MediaQuery.of(context).size.width*0.15,
                                width: MediaQuery.of(context).size.height*0.17,
                                child: FittedBox(
                                  child: Card(

                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: FlatButton.icon(
                                      icon: Icon(
                                        Icons.rate_review_rounded,
                                        color: Colors.deepPurple,
                                      ),
                                      label: Text(
                                        'Rate Us',
                                        style: TextStyle(
                                            color: Colors.deepPurple,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold

                                        ),
                                      ),
                                      onPressed: (){},
                                    ),

                                    elevation: 0,
                                    color: Colors.white30.withOpacity(0.2),
                                  ),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.width*0.15,
                                width: MediaQuery.of(context).size.height*0.17,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: FittedBox(
                                    child: FlatButton.icon(
                                      icon: Icon(
                                        Icons.share_rounded,
                                        color: Colors.deepPurple,
                                      ),
                                      label: Text(
                                        'Share Us',
                                        style: TextStyle(
                                            color: Colors.deepPurple,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      onPressed: (){},
                                    ),
                                  ),

                                  elevation: 0,
                                  color: Colors.white30.withOpacity(0.2),
                                ),
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
          )
      ),
    );
  }
}