import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

int number_of_questions=0;
double correct_percentage=0;
double wrong_percentage=0;
double obtained_marks=0;
Color answercolor=Colors.white;
int corrected_que=0;
String authtoken;
int coins=0;
String coin_id="";

var questions = [];
var practice_questions=[];
var ten_questions=[];


Future<void> post_coins()async{
  final url="https://quizzapp-7acc8-default-rtdb.firebaseio.com/coins.json?auth=$authtoken";
  http.post(url,body: jsonEncode({
    'coins':coins
  }));
}
Future<void> update_coins()async{
  final url="https://quizzapp-7acc8-default-rtdb.firebaseio.com/coins/$coin_id.json?auth=$authtoken";
  http.patch(url,body: jsonEncode({
    'coins':coins
  }));
}
Future<void> get_coins()async{

  final url="https://quizzapp-7acc8-default-rtdb.firebaseio.com/coins.json?auth=$authtoken";
  final response=await http.get(url);
  final responseData=jsonDecode(response.body) as Map<String,dynamic>;
 responseData.forEach((key, value) {
  coin_id=key;
   coins=value['coins'];
 });


}