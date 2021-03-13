import 'package:flutter/material.dart';
import 'constants.dart';
class Show_Answer_Screen extends StatefulWidget {
  static const routname="Show_Answer_Screen ";
  @override
  _Show_Answer_ScreenState createState() => _Show_Answer_ScreenState();
}

class _Show_Answer_ScreenState extends State<Show_Answer_Screen> {
@override
  void initState() {
    // TODO: implement initState

  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Answer Screen"),
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
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                List answer = questions[index]['answer'];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, bottom: 10, top: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  questions[index]['Question'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Divider(
                                height: 25,
                                color: Colors.white.withOpacity(0.5),
                              ),
                              ListView.builder(
                                itemBuilder: (ctx, i) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          answer[i],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  );
                                },
                                itemCount: answer.length,
                                shrinkWrap: true,
                              ),
                              Divider(
                                height: 10,
                                color: Colors.white.withOpacity(0.5),
                              ),


                              Stack(
                                children: [
                                  Container(
                                    height: 80,
                                    width: double.infinity,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 10,top: 5),
                                        child: Text(
                                          'Correct Answer',
                                          style: TextStyle(
                                              fontSize: 20,
                                              letterSpacing: 2.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      elevation: 200,
                                      color: Colors.white30.withOpacity(0.2),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Container(
                                      width: double.infinity,
                                      child: Card(
                                        elevation: 500,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        color:  Colors.green[600],
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 20,top: 8,bottom: 8),
                                          child: Text(
                                            questions[index]['correctanswer'],
                                            style: TextStyle(
                                                color:Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
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
                    SizedBox(
                      height: 10,
                    ),
                  ],
                );
              },
              itemCount: questions.length,
            ),
          ),
        ],
      )),
    );
  }
}
