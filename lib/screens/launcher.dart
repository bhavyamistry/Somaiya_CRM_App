import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Launcher extends StatefulWidget {
  @override
  _LauncherState createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  Future<bool> _nextscreen() async
  {
    await Future.delayed(Duration(milliseconds: 4000),(){});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String login = prefs.getString("logged_in");
    if(login== "true")
      return true;
    else
      return false;
  }

  @override
  void initState() {
    super.initState();
    _nextscreen().then(
        (status){
          if(!status)
          {
            Navigator.pushReplacementNamed(context, '/login');
          }
          else
          {
            Navigator.pushReplacementNamed(context, '/home');
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar( 
                        backgroundImage: AssetImage('assets/images/logo.jpg'),
                        backgroundColor: Colors.white,
                        radius: 100.0,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  

}
