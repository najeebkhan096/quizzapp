import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'constants.dart';


class Auth with ChangeNotifier {
  String _token;
  DateTime _expirydate;
  String _userid;


  bool get IsAuth {
    print("in ISAUTH function");
    print(token);
    return token != null;
  }

  String get userid {
    return _userid;
  }

  String get token {
    if (_expirydate != null &&
        _token != null &&
        _expirydate.isAfter(DateTime.now())) {
      print(_token);
      return _token;
    }
    print(_token);
    print('before token');
    return null;
  }


  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        "https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyBQfiv2brDrumkyHctet5N0aaOC4qLQaVY";
    try{
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData=jsonDecode(response.body);
      if(responseData['error']!=null){
        throw HttpException(responseData['error']['message']);
      }
      print("lund ,mera");
      print(responseData);
      print("liala");

      _token = responseData['idToken'];
      authtoken=_token;
      print(_token);
      _userid = responseData['localId'];
      _expirydate = DateTime.now().add(

        Duration(
          seconds: int.parse(responseData['expiresIn']),
        ),
      );
      _userid = responseData['localId'];

      notifyListeners();
    }catch(error){
      throw error;
    }

  }

  Future<void> signup(String email, String password) async {
    return  _authenticate(email, password, "signUp").then((value) {
      coins=3;
      post_coins();
    });
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, "signInWithPassword");
  }
}
