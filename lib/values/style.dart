import 'package:flutter/material.dart';
import 'package:attedancerecordsystm/values/MyColor.dart';
import 'package:google_fonts/google_fonts.dart';
final kHintTextStyle = TextStyle(
  color: Color(0xff888888),
  fontFamily: 'OpenSans',
);
final kLabelStyle = GoogleFonts.openSans(fontWeight: FontWeight.w600, fontSize: 18, color: MyColor.som_blue, letterSpacing: 0.5);
//final kLabelStyle = TextStyle(
//  color: MyColor.som_blue,
//  fontWeight: FontWeight.bold,
//  fontFamily: 'OpenSans',
//  fontSize: 15.0
//);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);