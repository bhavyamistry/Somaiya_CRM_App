import 'package:flutter/material.dart';
import 'package:attedancerecordsystm/values/MyColor.dart';
final kHintTextStyle = TextStyle(
  color: Color(0xff252525),
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: MyColor.som_blue,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
  fontSize: 15.0
);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.grey[400],
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);