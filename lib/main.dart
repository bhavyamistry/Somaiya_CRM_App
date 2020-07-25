import 'package:attedancerecordsystm/screens/Loading.dart';
import 'package:flutter/material.dart';
import 'screens/launcher.dart';
import 'screens/login.dart';
import 'screens/Home.dart';
import 'screens/Classroom.dart';
import 'screens/User_Type.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Somaiya Attendance',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto Light',
        ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes:{
        '/': (context) => Launcher(),
        '/login': (context) => Login(),
        '/home': (context) => HomeScreen(),
        '/classroom': (context) => Classroom(),
        '/user_type': (context) => User_Type(),
        },
      );
  }
}

