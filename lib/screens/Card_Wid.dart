import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '';
class Card_Wid extends StatefulWidget {
  var s1,t1;
  Card_Wid(String s, String t){
    s1 = s;
    t1 = t;
  }

  @override
  _Card_WidState createState() => _Card_WidState(s1,t1);
}

class _Card_WidState extends State<Card_Wid> {
  String name='',url='';

  _Card_WidState(s1, t1)
  {
    name = s1;
    url = t1;
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      color: Colors.grey[50],
      borderOnForeground: true,
      shadowColor: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size.width*.05),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SvgPicture.asset(
            url,
            height: size.height* .15,
            allowDrawingOutsideViewBox: true,
          ),
          Text(name,style: GoogleFonts.notoSans(fontSize: 22,fontWeight: FontWeight.w600),)
        ],
      ),
    );
  }
}
