import 'package:attedancerecordsystm/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:attedancerecordsystm/values/MyColor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:attedancerecordsystm/screens/Card_Wid.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Loading.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs;
  String name = '',
      email = '',
      photoUrl = '',
      sem = '',
      roll = '',
      batch = '',
      svv = '',
      gender = '';

  bool load = true;
  Future<void> _readAll() async {
    prefs = await _prefs;
    setState(() {
      name = prefs.getString('name');
      email = prefs.getString('email');
      photoUrl = prefs.getString('photoUrl');
      sem = prefs.getString('sem');
      roll = prefs.getString('roll');
      batch = prefs.getString('batch');
      svv = prefs.getString('svv');
      gender = prefs.getString('gender');

      // name = 'name';
      // email = 'email';
      // photoUrl = 'photoUrl';
    });
    // print(prefs.getString('email')+prefs.getString('name')+prefs.getString('photoUrl'));
  }

  Future<bool> _nextscreen() async {
    await Future.delayed(Duration(milliseconds: 2300), () {
      setState(() {
        load = false;
      });
    });
  }

  Widget _simplePopup() => PopupMenuButton<int>(
        child: CircleAvatar(
          backgroundImage: photoUrl != ''? NetworkImage(photoUrl) : gender=='M'? AssetImage('assets/images/man.png') : gender=='F'? AssetImage('assets/images/woman.png'): AssetImage('assets/images/portrait.png'),
          // NetworkImage(
          //     'https://mir-s3-cdn-cf.behance.net/project_modules/disp/f55edd25074391.5633ee08081f9.png'),
          radius: 25,
          backgroundColor: Colors.transparent,
        ),
        onSelected: (int a) {
          if (a == 1) {
            prefs.remove('email');
            prefs.remove('name');
            prefs.remove('photoUrl');
            prefs.remove('roll');
            prefs.remove('svv');
            prefs.remove('sem');
            prefs.remove('batch');
            prefs.remove('gender');
            prefs.remove('logged_in');
            Navigator.popAndPushNamed(context, '/login');
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.exit_to_app,
                  textDirection: TextDirection.ltr,
                ),
                Text(
                  "Logout",
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ],
      );

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    _readAll();
    super.initState();
    _nextscreen();
  }

//  Map data;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
//    data = ModalRoute.of(context).settings.arguments;
//    userDetails = data['detailsUser'];
//    print(data['detailsUser']);
//    print(userDetails.photoURL);
//    var detailsUser = data;
    print("name:$name");
    print("email:$email");
    print("photoUrl:$photoUrl");
    print("svv:$svv");
    print(photoUrl == '');
    return load
        ? Loading("Logging In...")
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: <Widget>[
                Flexible(
                  child: Container(
                    height: size.height * .45,
                    decoration: BoxDecoration(
                      color: MyColor.kj_red,
                      borderRadius: new BorderRadius.only(
                          bottomLeft: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0)),
                    ),
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
                                padding: EdgeInsets.fromLTRB(
                                    0, 0, 0, size.height * .01),
                                margin: EdgeInsets.fromLTRB(
                                    size.width * .04, 0, 0, 0),
                                // child: CircleAvatar(
                                //   backgroundImage: NetworkImage(photoUrl),
                                //   // NetworkImage(
                                //   //     'https://mir-s3-cdn-cf.behance.net/project_modules/disp/f55edd25074391.5633ee08081f9.png'),
                                //   radius: 25,
                                //   backgroundColor: Colors.transparent,
                                // ),
                                child: _simplePopup(),
                              ),
                              SizedBox(
                                width: size.width * .07,
                              ),
                              Flexible(
                                  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      name,
                                      // '',
                                      style: GoogleFonts.nunito(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: size.height * .013,
                                    ),
                                    Text(
                                      svv,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
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
                                    child: Flexible(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            sem,
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
                              ),
                              Expanded(
                                child: Container(
                                  width: (size.width - 0.35) / 3,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          roll,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          batch,
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
                                  'Classroom', 'assets/images/classroom.svg','/classroom'),
                              new Card_Wid(
                                  'Attendance', 'assets/images/analysis.svg','/home'),
                              new Card_Wid('Result', 'assets/images/score.svg','/home'),
                              new Card_Wid(
                                  'Events', 'assets/images/calendar.svg','/home'),
                              new Card_Wid(
                                  'Contact Us', 'assets/images/phone-book.svg','/home'),
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
