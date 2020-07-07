import 'package:attedancerecordsystm/values/MyColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
String txt="";
class Loading extends StatefulWidget {
  Loading(String s){
    txt = s;
  }
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SpinKitFoldingCube(
                color: Colors.white,
                size: size.width * .2,
                controller: AnimationController(
                    vsync: this, duration: const Duration(milliseconds: 1200)),
              ),
              SizedBox(height: size.height * .1),
              Text(txt,
                  style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontStyle: FontStyle.normal)),
            ],
          ),
        ),
      ),
    );
  }
}