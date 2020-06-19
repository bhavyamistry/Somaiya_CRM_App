import 'dart:io';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:dio/dio.dart';    
String url = "http://kjsomaiya.epizy.com/";
// String url = "http://localhost:8080/somaiya/";
class UserLogin
{
  Map data,success;
  List user_data;
  Future<List>  getCredentials(String email,String passwd,String mode) async{
    print("Fetching User Data");
    String full_url = url + 'user_login.php?mode=$mode';
    print(full_url);
    Map<String, String> headers = {"Content-type": "application/json"};
    Map j_son = {
      'user_id': email,
      'password': passwd
    };
    // String j_son = "{'user_id':$email, 'password':$passwd}";
    // Response response = await get(full_url);
    // try
    // {
      // var response = await post(
      // full_url, 
      // headers: {
      //   "Content-Type": "application/json"
      // },
      // body: {"user_id":email,"password":passwd},
      // encoding: Encoding.getByName("UTF-8")
      // );
      Dio dio = Dio();
      try {
        FormData formData = new FormData.fromMap({
          "user_id": email,
          "password": passwd,
        });
        var response = await dio.post(full_url, data: formData);
        print(response.data);
      } catch (e) {
        print(e);
      }
    // if(response.body.isNotEmpty) {
    //   print(response.body.toString());
    //   Map result =json.decode(response.body);
    //   success = result['success'];
    //   print(success);
    //   }
    // }
    // catch(Exception)
    // {
    //   print("Exception:$Exception");
    // }
    // data = result['data'];
  }
}
// class GoogleUserLogin
// {
//   Map data,success;
//   List user_data;
//   Future<List>  getCredentialsFromEmail(String email,String mode) async{
//     print("Fetching User Data");
//     String full_url = url + 'google_user_login.php?mode=$mode';
//     Map<String, String> headers = {"Content-type": "application/json"};
//     String j_son = "{'email_id':$email}";
//     // Response response = await get(full_url);
//     // final Response response = await post(
//     //   full_url, headers: headers, body: j_son);
//     // print(response.body.toString());
//     // Map result = jsonDecode(response.body.toString());
//     // success = result['success'];
//     // data = result['data'];
//   }