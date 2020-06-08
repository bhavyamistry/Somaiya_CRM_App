import 'dart:math';
import 'package:attedancerecordsystm/auth.dart';
import 'package:attedancerecordsystm/screens/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:attedancerecordsystm/values/MyColor.dart';
import 'package:flutter/services.dart';
import 'package:attedancerecordsystm/values/style.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String login = prefs.getString("logged_in");
  runApp(MaterialApp(home: login == 'true' ? Login() : HomeScreen()));
}
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _rememberMe = false;

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
            child: Text(
              'SVV Net ID',
              style: kLabelStyle,
            )),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType:
                TextInputType.numberWithOptions(signed: false, decimal: false),
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            maxLength: 6,
            decoration: InputDecoration(
              border: InputBorder.none,
//              labelText: "SVV Net ID",
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.domain,
                color: Colors.grey[800],
              ),
              hintText: 'Enter your SVV Net ID',
              hintStyle: kHintTextStyle,
              counterText: '',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
          child: Text(
            'Password',
            style: kLabelStyle,
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.grey[800],
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.grey[300]),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.grey[300],
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Login Button Pressed'),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xfff9fcfb),
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: MyColor.som_blue,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            (){
              print('Login with Google');
              _signIn(context).then((FirebaseUser user) => print(user)).catchError((e)=>print(e));
            },
            AssetImage(
              'assets/images/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

//  Widget _buildSignupBtn() {
//    return GestureDetector(
//      onTap: () => print('Sign Up Button Pressed'),
//      child: RichText(
//        text: TextSpan(
//          children: [
//            TextSpan(
//              text: 'Don\'t have an Account? ',
//              style: TextStyle(
//                color: Colors.white,
//                fontSize: 18.0,
//                fontWeight: FontWeight.w400,
//              ),
//            ),
//            TextSpan(
//              text: 'Sign Up',
//              style: TextStyle(
//                color: Colors.white,
//                fontSize: 18.0,
//                fontWeight: FontWeight.bold,
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  SharedPreferences prefs;

  Future<FirebaseUser> _signIn(BuildContext context) async {

//    final snackBar = SnackBar(
//      content: new Text('Sign in'),
//    );
//    _scaffoldKey.currentState.showSnackBar(snackBar);

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    FirebaseUser userDetails = (await _firebaseAuth.signInWithCredential(credential)).user;
    ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);

    List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);

    UserDetails details = new UserDetails(
      userDetails.providerId,
      userDetails.displayName,
      userDetails.photoUrl,
      userDetails.email,
      providerData,
    );
    _addNewItem(details);
//    print(readAll());
//    print(_items);
//    Navigator.pushReplacementNamed(context, '/home', arguments: {
//      'detailsUser':details,
    Navigator.pushReplacementNamed(context, '/home');
    return userDetails;
  }

  void _addNewItem(UserDetails details) async {
    print('Writing everything');
    prefs = await SharedPreferences.getInstance();
    prefs.setString('email', details.userEmail);
    prefs.setString('name', details.userName);
    prefs.setString('photoUrl', details.photoURL);
    prefs.setString('logged_in', 'true');
  }

  Future<bool> readAll() async {
    prefs = await SharedPreferences.getInstance();
    print("login:${ prefs.getString('logged_in')}");
    if(prefs.getString('logged_in') == 'true') {
      Navigator.pushReplacementNamed(context, '/home');
      return true;
    }
    else{
      print("False");
      return false;
    }

  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState(){
    print("Before Init");
    super.initState();
//    print(_items);
  }

  Widget build(BuildContext context) {
      print("Build method called before");
      print("Build method called after");
      readAll().then((value){
        new Future.delayed(new Duration(seconds: 3), (){
          if (!value) {
            return Scaffold(
              backgroundColor: Colors.white,
              key: _scaffoldKey,
              resizeToAvoidBottomPadding: true,
              body: _createStack(),
            );
          }
        });
      });
      return ShowDialog();
//      return Scaffold(
//      backgroundColor: Colors.white,
//      key: _scaffoldKey,
//      resizeToAvoidBottomPadding: true,
//      body: _createStack(),
//      );
    }
  _createStack() {
    return ListView(children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
          color: MyColor.kj_red,
          border: Border.all(color: MyColor.kj_red),
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
//                margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: Image.asset(
                  "assets/images/logo.jpg",
                  height: 40.0,
                ),
                width: MediaQuery.of(context).size.width * 0.49,
                height: MediaQuery.of(context).size.height * 0.13,
              ),
              Container(
//                margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: Image.asset(
                  "assets/images/login_logo2.png",
                  width: 10,
                ),
                width: MediaQuery.of(context).size.width * 0.49,
                height: MediaQuery.of(context).size.height * 0.13,
              ),
            ]),
      ),
      Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            border: Border.all(color: MyColor.kj_red),
            color: MyColor.kj_red,
          ),
        ),
        Card(
          color: Colors.white,
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          shadowColor: Colors.grey[800],
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Center(
                    child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: MyColor.som_blue,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                )),
                SizedBox(
                  height: 20.0,
                ),
                _buildEmailTF(),
                SizedBox(
                  height: 20.0,
                ),
                _buildPasswordTF(),
                SizedBox(
                  height: 20.0,
                ),
                _buildRememberMeCheckbox(),
                _buildForgotPasswordBtn(),
                _buildLoginBtn(),
                SizedBox(
                  height: 10.0,
                ),
                _buildSignInWithText(),
                _buildSocialBtnRow(),

              ],
            ),
          ),
        ),
      ]),
    ]);
  }

  Widget ShowDialog() {}


}

