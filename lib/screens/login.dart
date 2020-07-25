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
import 'package:attedancerecordsystm/service/ApiCall.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Home.dart';
import 'AlertDialog.dart';
import 'User_Type.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
//  bool _rememberMe = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
//  TextEditingController passwordController = TextEditingController();
  bool _validate = true, _obscureText = true, _autovalid = false,fetched = false, _rememberMe = false, _mailvalidate = true, user_set = false;
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
//  bool _obscureText = true;
//  bool _autovalid = false;
  String _password, _email;
  final _formKey2 = GlobalKey<FormState>();
  var screen_size;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  SharedPreferences prefs;
//  bool fetched = false;
  int succeed = 0;
  @override
  void dispose() {
//    nameController.dispose();
//    passwordController.dispose();
    super.dispose();
  }

  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  Widget _buildEmailTF() {
    screen_size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
            child: Text(
              'SVV Net ID',
              style: kLabelStyle,
            )),
        SizedBox(height: screen_size.height * 0.01),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            focusNode: _emailFocusNode,
            controller: nameController,
            maxLines: 1,
            onSaved: (val) => _email = val,
            minLines: 1,
            autovalidate: !_mailvalidate,
            onTap: (){
              if(_email.length>0) {
                setState(() {
                  _mailvalidate = true;
                });
              }
              print("Inside-MailValidate:$_mailvalidate");
            },
            keyboardType:
                TextInputType.numberWithOptions(signed: false, decimal: false),
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            textInputAction: TextInputAction.next,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            maxLength: 10,
            decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10.0)),
              border: InputBorder.none,
//              labelText: "SVV Net ID",
              contentPadding: EdgeInsets.only(top: 12.0),
              prefixIcon: Icon(
                Icons.domain,
                color: Colors.grey[800],
              ),
              hintText: 'Enter your SVV Net ID',
              hintStyle: kHintTextStyle,
              counterText: '',
              errorStyle: GoogleFonts.roboto(color: Colors.red, fontWeight: FontWeight.bold,letterSpacing: 0.5, fontSize: 12,height: 0.35),
            ),
            validator: (value) {
              if (value.length < 10 && value.length > 0) {
                return "*Invalid SVV Net ID";
              }
              else if(value.length == 0 && value.isEmpty) {
                return "*Required";
              }
              else {
                return null;
              }
            },
            onFieldSubmitted: (_) {
              fieldFocusChange(context, _emailFocusNode, _passwordFocusNode);
            },
          ),
        ),
      ],
    );
  }


  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget _buildPasswordTF() {
    screen_size = MediaQuery.of(context).size;
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
          margin: EdgeInsets.symmetric(vertical: 0.0),
          padding: EdgeInsets.fromLTRB(0, 0.0, 0, 0.0),
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: _validate? screen_size.height * 0.105 : screen_size.height * 0.105,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              TextFormField(
                controller: passwordController,
                maxLines:  1,
                minLines: 1,
                onSaved: (val) => _password = val,
                onTap: (){
                  if(_password.length>0) {
                    setState(() {
                      _validate = true;
                    });
                  }
                  print("Inside-Validate:$_validate");
                },
                autovalidate: !_validate,
                textInputAction: TextInputAction.next,
                obscureText: _obscureText,
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10.0)),
                  contentPadding: EdgeInsets.fromLTRB(0, 12.0, 0, 0.0),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey[800],
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility,size: 25,),
                    onPressed: _toggle,
                    color: Colors.grey[800],
                  ),
                  hintText: 'Enter your Password',
                  hintStyle: kHintTextStyle,
                  errorStyle: GoogleFonts.roboto(color: Colors.red, fontWeight: FontWeight.bold,letterSpacing: 0.5, fontSize: 12,height: 0.35),
//                  errorText: _validate? null : "*Required",

                  counterText: '',
                ),
                validator: (value){
                  if(value.length==0 && value.isEmpty)
                  {
//                    setState(() {
//                      _validate = false;
//                    });
                    print("Inside-Validate:$_validate");
                    return "*Required";
                  }
                  else {
                    print("Inside-Validate:$_validate");
//                      setState(() {
//                        _validate = true;
//                      });
                    return null;
                  }
                },
              ),
              ],
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
        onPressed: () async {
          print('Login Button Pressed');
          setState(() {
//            nameController.text.isEmpty ? _validate = true : _validate = false;
          });
          if (_formKey2.currentState.validate()) {
            print("All Validating");
            print("SVV Net ID:${nameController.text}");
            print("Password:${passwordController.text}");
            UserLogin user = UserLogin();
            await user
                .getCredentials(
                nameController.text, passwordController.text, 'student')
                .then((value) async {
              print("value is:$value");
              var l1 = value[0];
              print(l1['success']);
              print(l1['success'].runtimeType);
              // succeed = int.parse(l1['success']);
              StudentUserDetails details;
              if (l1['success'] == 1) {
                Navigator.of(context).push(
                  PageRouteBuilder(
                      pageBuilder: (context, _, __) => openCustomDialog(context,'Login Successfull!',MyColor.login_success),
                      opaque: false),
                );
                var l2 = value[1];
                String name =
                    l2['F_name'] + ' ' + l2['M_name'] + ' ' + l2['L_name'];
                details = new StudentUserDetails(
                    name,
                    l2['img'],
                    l2['S_email'],
                    l2['roll'],
                    l2['S_id'],
                    l2['batch'],
                    l2['current_sem'],
                    l2['gender'],
                    l2['dept_short']);
                _addUserInformation(details);
                print(readAll());
              } else {
                details = new StudentUserDetails(
                  '',
                  '',
                  '',
                  '',
                  '',
                  '',
                  '',
                  '',
                  '');
                Navigator.of(context).push(
                  PageRouteBuilder(
                      pageBuilder: (context, _, __) => openCustomDialog(context,'Authentication Failed Check ID or Password',MyColor.login_fail),
                      opaque: false),
                );
              }
            });
          }
          else {
            print("Form is not valid");
            setState(() {
              _autovalid = !_autovalid;
              _validate = false;
            });
            print("Auto-Valid:$_autovalid");
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xfff9fcfb),
        splashColor: MyColor.kj_red,
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
            () async {
              print('Login with Google');
              _signIn(context)
                  .then((FirebaseUser user) => print(user))
                  .catchError((e) => print(e));
            },
            AssetImage(
              'assets/images/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Future<FirebaseUser> _signIn(BuildContext context) async {
//    final snackBar = SnackBar(
//      content: new Text('Sign in'),
//    );
//    _scaffoldKey.currentState.showSnackBar(snackBar);

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    FirebaseUser userDetails =
        (await _firebaseAuth.signInWithCredential(credential)).user;
    ProviderDetails providerInfo = new ProviderDetails(userDetails.providerId);
    List<ProviderDetails> providerData = new List<ProviderDetails>();
    providerData.add(providerInfo);
    GoogleUserLogin user = GoogleUserLogin();
    StudentUserDetailsGoogle details;
    await user
        .getCredentialsFromEmail(userDetails.email, 'student')
        .then((value) {
      print("value is:$value");
      var l1 = value[0];
      print(l1['success']);
      print(l1['success'].runtimeType);
      // succeed = int.parse(l1['success']);
      if (l1['success'] == 1) {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return openCustomDialog(context,'Authentication Failed Check ID or Password',MyColor.login_fail);
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) =>
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-9, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
            transitionDuration: Duration(milliseconds: 0),
          ),
        ).then((value){
          var l2 = value[1];
          String name = l2['F_name'] + ' ' + l2['M_name'] + ' ' + l2['L_name'];
          details = new StudentUserDetailsGoogle(
              userDetails.providerId,
              name,
              userDetails.photoUrl,
              userDetails.email,
              providerData,
              l2['roll'],
              l2['S_id'],
              l2['batch'],
              l2['current_sem'],
              l2['gender'],
              l2['dept_short']);
          _addUserInformation(details);
          print(readAll());
        });
      } else {
        details = new StudentUserDetailsGoogle(
            '', '', '', '', providerData, '', '', '', '','','');
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return openCustomDialog(context,'Authentication Failed Check ID or Password',MyColor.login_fail);
            },
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-9, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
            transitionDuration: Duration(milliseconds: 1000),
          ),
        );
//        Navigator.of(context).push(
//          PageRouteBuilder(
//              pageBuilder: (context, _, __) => openCustomDialog(context),
//              opaque: false),
//        );
      }
    });
    return userDetails;
  }

  void _addUserInformation(var details) async {
    print('Writing everything');
    prefs = await SharedPreferences.getInstance();
    prefs.setString('email', details.userEmail);
    prefs.setString('name', details.userName);
    prefs.setString('photoUrl', details.photoURL);
    prefs.setString('roll', details.userRoll);
    prefs.setString('svv', details.userSvv);
    prefs.setString('sem', details.sem);
    prefs.setString('batch', details.batch);
    prefs.setString('gender', details.gender);
    prefs.setString('dept', details.dept);
    prefs.setString('logged_in', 'true');
  }

  Future<bool> readAll() async {
    prefs = await SharedPreferences.getInstance();
    print("login:${prefs.getString('logged_in')}");
    print("2 seconds over");
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        if (prefs.getString('logged_in') == 'true') {
          Navigator.pushReplacementNamed(context, '/home');
          return true;
        } else {
          print("False");
          return false;
        }
      });
    });

  }



  @override
  void initState() {
//    showAlert(context);
    print("Before Init");
    userScreen();
    super.initState();
//    print(_items);
  }

  void userScreen() async
  {
    var user = await Navigator.of(context).push(
      PageRouteBuilder(
          pageBuilder: (context, _, __) => User_Type(),
          opaque: true),
    );
  }

  Widget build(BuildContext context) {
    print("Build method called before");
    print("Build method called after");
    print("Validate:$_validate");
    print("Auto-Validate:$_autovalid");
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: true,
      body: _createStack(),
    );
    // return ShowDialog();
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
            child: Form(
              autovalidate: _autovalid,
              key: _formKey2,
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
        ),
      ]),
    ]);
  }

  showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'What do you want to remember?'),
                    ),
                    SizedBox(
                      width: 320.0,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: const Color(0xFF1BC0C5),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

}
