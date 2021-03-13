
import 'package:flutter/material.dart';
import 'package:quizz_app/practice_questions_screen.dart';

class Practice extends StatefulWidget {
  static const routname="Practice";
  @override
  _PracticeState createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                padding: const EdgeInsets.fromLTRB(10,10,10,520),
                child: Card(

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Practice Quiz',
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
                  padding: const EdgeInsets.fromLTRB(0,150,0,0),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(13, 40, 10, 0),
                            child: Card(

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: FlatButton(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Mockup 1',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold

                                        ),
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                      Row(
                                        children: [

                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(54,0,0,0),
                                            child: Text(
                                              'Marks: 20',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold

                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 30.0,),
                                          Icon(
                                            Icons.timer,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            '18 min',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold

                                            ),
                                          ),
                                        ],
                                      ),

                                      Divider(
                                        height: 20,
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                      Text(
                                        'Total Questions: 10',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold

                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: (){
                                    Navigator.pushReplacementNamed(context, Practice_Questions_screen.routname,arguments: "mockup1");
                                  },
                                ),
                              ),

                              elevation: 0,
                              color: Colors.deepPurple[300].withOpacity(0.5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(13, 10, 20, 0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: FlatButton(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Mockup 2',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold

                                        ),
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                      Row(
                                        children: [

                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(54,0,0,0),
                                            child: Text(
                                              'Marks: 20',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold

                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 30.0,),
                                          Icon(
                                            Icons.timer,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            '18 min',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold

                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                      Text(
                                        'Total Questions: 10',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold

                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: (){
                                    Navigator.pushReplacementNamed(context, Practice_Questions_screen.routname,arguments: "mockup2");
                                  },
                                ),
                              ),

                              elevation: 0,
                              color: Colors.deepPurple[300].withOpacity(0.5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(13, 10, 20, 0),
                            child: Card(

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: FlatButton(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Mockup 3',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold

                                        ),
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                      Row(
                                        children: [

                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(54,0,0,0),
                                            child: Text(
                                              'Marks: 20',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold

                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 30.0,),
                                          Icon(
                                            Icons.timer,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            '18 min',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold

                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                      Text(
                                        'Total Questions: 10',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold

                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: (){
                                    Navigator.pushReplacementNamed(context, Practice_Questions_screen.routname,arguments: "mockup3");
                                  },
                                ),
                              ),

                              elevation: 0,
                              color: Colors.deepPurple[300].withOpacity(0.5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(13, 10, 20, 0),
                            child: Card(

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: FlatButton(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Mockup 4',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold

                                        ),
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                      Row(
                                        children: [

                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(54,0,0,0),
                                            child: Text(
                                              'Marks: 20',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold

                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 30.0,),
                                          Icon(
                                            Icons.timer,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            '18 min',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold

                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                      Text(
                                        'Total Questions: 10',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold

                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: (){
                                    Navigator.pushReplacementNamed(context, Practice_Questions_screen.routname,arguments: "mockup4");
                                  },
                                ),
                              ),

                              elevation: 0,
                              color: Colors.deepPurple[300].withOpacity(0.5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(13, 10, 20, 0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: FlatButton(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Mockup 5',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold

                                        ),
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                      Row(
                                        children: [

                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(54,0,0,0),
                                            child: Text(
                                              'Marks: 20',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold

                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 30.0,),
                                          Icon(
                                            Icons.timer,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            '18 min',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold

                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                      Text(
                                        'Total Questions: 10',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold

                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: (){
                                    Navigator.pushReplacementNamed(context, Practice_Questions_screen.routname,arguments: "mockup5");
                                  },
                                ),
                              ),

                              elevation: 0,
                              color: Colors.deepPurple[300].withOpacity(0.5),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(13, 10, 20, 4),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: FlatButton(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Mockup 6',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold

                                        ),
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                      Row(
                                        children: [

                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(54,0,0,0),
                                            child: Text(
                                              'Marks: 20',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold

                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 30.0,),
                                          Icon(
                                            Icons.timer,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            '18 min',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold

                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Colors.white.withOpacity(0.2),
                                      ),
                                      Text(
                                        'Total Questions: 10',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold

                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: (){
                            Navigator.pushReplacementNamed(context, Practice_Questions_screen.routname,arguments: "mockup6");
                                  },
                                ),
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
          )
      ),
    );
  }
}