import 'package:flutter/material.dart';
class Launcher extends StatefulWidget {
  @override
  _LauncherState createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> {
  Future<bool> _nextscreen() async{
    await Future.delayed(Duration(milliseconds: 5000),(){});
    return true;
  }

  @override
  void initState() {
    super.initState();
    _nextscreen().then(
        (status){
          if(status)
          {
            Navigator.pushNamed(context, '/login');
          }
          else
          {
            Navigator.pushNamed(context, '/home');
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