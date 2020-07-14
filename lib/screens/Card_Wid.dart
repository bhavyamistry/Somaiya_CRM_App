import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '';
class Card_Wid extends StatefulWidget {
  var s1,t1,u1;
  Card_Wid(String s, String t, String u){
    s1 = s;
    t1 = t;
    u1 = u;
  }

  @override
  _Card_WidState createState() => _Card_WidState(s1,t1,u1);
}

class _Card_WidState extends State<Card_Wid> {
  String name='',img_url='',url='';

  _Card_WidState(String s1, String t1,String u1)
  {
    name = s1;
    img_url = t1;
    url = u1;
    print(url);
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, url);
      },
      child: Card(
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
              img_url,
              height: size.height* .13,
              allowDrawingOutsideViewBox: true,
            ),
            Text(name,style: GoogleFonts.notoSans(fontSize: 20,fontWeight: FontWeight.w600),)
          ],
        ),
      ),
    );
  }
}
class Class_Card_Wid extends StatefulWidget {
  var s1,t1,u1;
  Class_Card_Wid(String s, String t, String u){
    s1 = s;
    t1 = t;
    u1 = u;
  }

  @override
  _Card_WidState2 createState() => _Card_WidState2(s1,t1,u1);
}

class _Card_WidState2 extends State<Class_Card_Wid> {
  String name='',img_url='',url='';

  _Card_WidState2(String s1, String t1,String u1)
  {
    name = s1;
    img_url = t1;
    url = u1;
    print(url);
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        height: size.height*0.23,
        width: ((size.width * 1.0) - (size.width*0.059)),

        child: Card(
          elevation: 5,
          semanticContainer: false,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.grey[50],
          borderOnForeground: true,
          shadowColor: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.width*.05),
          ),
          child: Stack(
            children:[
                Opacity(
                  opacity: 1.0,
                  child: Image.asset(
                    "assets/images/card_themes/general/img_breakfast.jpg",
                    fit: BoxFit.cover,
                    width: ((size.width * 1.0) - (size.width*0.059)),
                    height: size.height*0.25,
                  ),
                ),
              SizedBox(height: size.height*0.1,),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(name,style: GoogleFonts.notoSans(fontSize: 20,fontWeight: FontWeight.w600, color: Color(0xffffffff),letterSpacing: 0.3),textAlign: TextAlign.center,)
                  ),
              )
              ],
            ),
          ),
        ),
      );
  }
}
