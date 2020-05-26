import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:attedancerecordsystm/values/MyColor.dart';
import 'package:flutter/services.dart';
import 'package:attedancerecordsystm/values/style.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _rememberMe = false;

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'SVV Net ID',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.numberWithOptions(signed: false, decimal: false),
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            maxLength: 6,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.domain,
                color: Colors.white,
              ),
              hintText: 'Enter your SVV Net ID',
              hintStyle: kHintTextStyle,
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
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
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
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
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
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => print('Login Button Pressed'),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
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
                () => print('Login with Google'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       resizeToAvoidBottomPadding: true,
        body:SingleChildScrollView(
          child:
            Column(
              children: <Widget>[
               Column(
                  children: <Widget>[
                  Container(
                    color: MyColor.kj_red,
                    height: MediaQuery.of(context).size.height * 0.40,
                    width: double.maxFinite,
                    child: SafeArea(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsets.only(left: 40.0),
                              child: Image.asset("assets/images/logo.jpg",height: 40.0,),
                            ),
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.height * 0.13,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsets.only(right: 40.0, left:5.0, top:20.0 ),
                              child: Image.asset("assets/images/login_logo2.png",width: 10,),
                            ),
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.height * 0.13,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                  top: 200.0,
                  left: 10.0,
                  right: 10.0,
                  child: Card(
                    color: Colors.white,
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Center(
                              child: Text('Login',style: TextStyle(
                            fontSize: 20.0,
                            color: MyColor.som_blue,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                          ),)),
                          SizedBox(height: 20.0,),
                          _buildEmailTF(),
                          SizedBox(height: 20.0,),
                          _buildPasswordTF(),
                          SizedBox(height: 20.0,),
                          _buildRememberMeCheckbox(),
                          SizedBox(height: 20.0,),
                          _buildLoginBtn(),
                          SizedBox(height: 20.0,),
                          _buildSignInWithText(),
                          _buildSocialBtnRow(),
                        ],
                      ),
                    ),
                  )
              ),


//            _buildSignupBtn(),

            ],
          ),
        ));
  }
}
