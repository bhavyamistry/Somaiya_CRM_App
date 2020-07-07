import 'package:attedancerecordsystm/screens/Loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:attedancerecordsystm/values/MyColor.dart';

Widget openCustomDialog(BuildContext context,String Txt, Color color) {
  Future.delayed(const Duration(milliseconds: 2000), () {
    Navigator.pop(context);
  });

  return SafeArea(
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
        Padding(
          padding: const EdgeInsets.fromLTRB(5,0,5,0),
          child: new Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
              boxShadow: [
                new BoxShadow(
                  color: MyColor.som_grey,
                  offset: new Offset(1.0, 1.0),
                )
              ],
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                border: Border(),
                color: color,
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: new Text(
                    Txt,
                    textAlign: TextAlign.left,
                    softWrap: true,
                    textScaleFactor: 1,
                    style: new TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

