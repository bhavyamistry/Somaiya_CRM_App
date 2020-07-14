import 'dart:convert';
import 'dart:io';
// import 'package:dio/dio.dart';
import 'package:http/http.dart';
// String url = "http://kjsomaiya.epizy.com/";
String url = "http://10.0.2.2:8080/somaiya/";
//String url = "http://192.168.0.105:8080/somaiya/";
class UserLogin
{
  Map data,success;
  List user_data;
  Future<List> getCredentials(String email,String passwd,String mode) async {
    print("Fetching User Data");
    String full_url = url + 'user_login.php?mode=$mode';
    print(full_url);
      // make POST request
       final Response response = await post(
         full_url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'user_id': email,
            'password': passwd
          }),
        );

      // check the status code for the result
      int statusCode = response.statusCode;
      print("statusCode:$statusCode");
      // this API passes back the id of the new item added to the body
      List op = jsonDecode(response.body);
      print("body:${op}");
      return op;
  }
}
class GoogleUserLogin
{
  Map data,success;
  Map user_data;
  Future<List> getCredentialsFromEmail(String email,String mode) async {
    print("Fetching User Data");
    print(email);
    String full_url = url + 'google_user_login.php?mode=$mode';
    print(full_url);
      // make POST request
    final Response response = await post(
      full_url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'user_id': email,
      }),
    );

      // check the status code for the result
      int statusCode = response.statusCode;
      print("statusCode:$statusCode");
      // this API passes back the id of the new item added to the body
      List op = jsonDecode(response.body);
      print("body:${op}");
      return op;
  }
}