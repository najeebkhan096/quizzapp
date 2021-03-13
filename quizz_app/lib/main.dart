import 'package:flutter/material.dart';
import 'package:quizz_app/auth_screen.dart';
import 'package:quizz_app/Ten_Question_Quizz.dart';
import 'package:quizz_app/displayquestions.dart';
import 'package:quizz_app/home.dart';
import 'package:quizz_app/loading.dart';
import 'package:quizz_app/practice.dart';
import 'package:quizz_app/practice_questions_screen.dart';
import 'package:quizz_app/practice_screen.dart';
import 'package:quizz_app/quick_quiz.dart';
import 'package:quizz_app/result_screen.dart';
import 'package:quizz_app/show_answer_screen.dart';
import 'package:provider/provider.dart';
import 'auth.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Auth(),
      child: Consumer<Auth>(
      builder: (ctx,auth,_)=> MaterialApp(
          theme: ThemeData(
              fontFamily: 'Cormorant'
          ),
          home: auth.IsAuth?Home():AuthScreen(),
          routes: {
            'loadingscreen': (context) => LoadingScreen(),
            'home': (context) => Home(),
            'Practice_screen':(context)=>Practice_screen(),
            'Practice': (context) => Practice(),
            'quick_quiz': (context) => QuickQuiz(),
            'Display_questions_screen':(context)=>Display_Questions_screen(),
            'result_screen':(context)=>Result(),
            'QuickQuiz_screen':(context)=>QuickQuiz(),
            'Ten_Questions_Quiz':(context)=>Ten_Questions_Quiz(),
            'Practice_Questions_screen':(context)=>Practice_Questions_screen(),
            'Show_Answer_Screen ':(context)=>Show_Answer_Screen(),
          },
        ),
      ),
    );
  }
}
