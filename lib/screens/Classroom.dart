import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:attedancerecordsystm/values/MyColor.dart';
import 'package:attedancerecordsystm/screens/Card_Wid.dart';

class Classroom extends StatefulWidget {
  @override
  Classroom_State createState() => Classroom_State();
}

class Classroom_State extends State<Classroom> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Classroom',style: GoogleFonts.nunito(color: Colors.white,fontSize: 20),),
        backgroundColor: MyColor.kj_red,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width * 1.0,
          height: size.height * 1.0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new  Class_Card_Wid('Python Web Programming','',''),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
