import 'package:attedancerecordsystm/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:attedancerecordsystm/values/MyColor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:attedancerecordsystm/screens/Card_Wid.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//  UserDetails userDetails;
//  final GoogleSignIn _gSignIn = GoogleSignIn();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> _readAll() async {
    final SharedPreferences prefs = await _prefs;
    print(prefs.getString('email')+prefs.getString('name')+prefs.getString('photoUrl'));
  }

  @override
  void initState() {
    super.initState();
    _readAll();
  }

  _HomeScreenState();
//  Map data;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
//    data = ModalRoute.of(context).settings.arguments;
//    userDetails = data['detailsUser'];
//    print(data['detailsUser']);
//    print(userDetails.photoURL);
//    var detailsUser = data;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(color: MyColor.kj_red,
            borderRadius: new BorderRadius.only(bottomLeft: Radius.circular(40.0),bottomRight: Radius.circular(40.0)),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(size.height * .016),
              child: Column(
                children: <Widget>[
                  Container(
                    height: size.height * .12,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: size.width * .19,
                          height: size.height * .12,
                          padding:
                              EdgeInsets.fromLTRB(0, 0, 0, size.height * .01),
                          margin:
                              EdgeInsets.fromLTRB(size.width * .04, 0, 0, 0),
                          child: CircleAvatar(
                            backgroundImage:
//                            NetworkImage(prefs.getString('photoUrl')),
                            NetworkImage(
                                'https://mir-s3-cdn-cf.behance.net/project_modules/disp/f55edd25074391.5633ee08081f9.png'),
                            radius: 25,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        SizedBox(
                          width: size.width * .07,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
//                              prefs.getString('name'),
                            '',
                              style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: size.height * .013,
                            ),
                            Text(
                              "2220190371",
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                    ),
                    height: size.height * .125,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            width: (size.width - 0.35) / 3,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Semester',
                                    style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: size.height * .01,
                                  ),
                                  Text(
                                    '5',
                                    style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: (size.width - 0.35) / 3,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Roll No.',
                                    style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: size.height * .01,
                                  ),
                                  Text(
                                    '32',
                                    style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: (size.width - 0.35) / 3,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Batch No.',
                                    style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: size.height * .01,
                                  ),
                                  Text(
                                    '2',
                                    style: GoogleFonts.nunito(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .04,
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      children: <Widget>[
                        new Card_Wid(
                            'Attendance', 'assets/images/analysis.svg'),
                        new Card_Wid(
                            'Result', 'assets/images/score.svg'),
                        new Card_Wid(
                            'Events', 'assets/images/calendar.svg'),
                        new Card_Wid(
                            'Contact Us', 'assets/images/phone-book.svg'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
class User
{
  String username,email,photoUrl;

  User(this.username, this.email, this.photoUrl);
}

