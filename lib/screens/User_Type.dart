import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:attedancerecordsystm/values/MyColor.dart';

import 'Card_Wid.dart';
class User_Type extends StatefulWidget {
  @override
  _User_TypeState createState() => _User_TypeState();
}

class _User_TypeState extends State<User_Type> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height*1,
      width: size.width*1,
      decoration: BoxDecoration(
        color: MyColor.som_grey,
      ),
      child: Padding(
        padding: EdgeInsets.all(size.width/10),
          child:Column(
            children: <Widget>[
              Text("Choose User Type",style: GoogleFonts.nunito(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold,decoration: TextDecoration.none),textAlign: TextAlign.center,),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 15,
                  primary: false,
                  children: <Widget>[
                    new Card_Wid(
                        'Student', 'assets/images/student.svg','student'),
                    new Card_Wid(
                        'Parent', 'assets/images/parent.svg','parent'),
                    new Card_Wid('Faculty', 'assets/images/teacher.svg','faculty'),
                    new Card_Wid(
                        'HOD', 'assets/images/hod.svg','hod'),
                    new Card_Wid(
                        'Principal', 'assets/images/principal.svg','principal'),
                    new Card_Wid(
                        'Admin', 'assets/images/admin.svg','admin'),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
