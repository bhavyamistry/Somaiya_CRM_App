import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:attedancerecordsystm/values/MyColor.dart';
import 'package:attedancerecordsystm/screens/Card_Wid.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:attedancerecordsystm/values/style.dart';
import 'package:random_string/random_string.dart';
import 'package:attedancerecordsystm/service/ApiCall.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:attedancerecordsystm/screens/AlertDialog.dart';

class Classroom extends StatefulWidget {
  @override
  Classroom_State createState() => Classroom_State();
}

class Classroom_State extends State<Classroom> {
  final _classname = TextEditingController();
  final _classsub = TextEditingController();
  final _classcode = TextEditingController();
  final _joinclasscode = TextEditingController();
  FocusNode myFocusNode = new FocusNode();
  final _formKey = GlobalKey<FormState>();
  final _joinformKey = GlobalKey<FormState>();

  var screen_size;
  bool _validate = false, _joinvalidate = false;
  List<String> section = [
    "General",
    "English & History",
    "Math & Science",
    "Arts",
    "Other",
  ];
  List<String> semester = [
    "1", "2", "3", "4", "6", "7", "8"
  ];
  List<String> dept = [
    "IT", "COMP", "EXTC", "AI-DS", "GENERAL"
  ];
  String ddown_section = null, ddown_sem = null, ddown_dept = null;
  String sec_select = "", sem_select = "", dept_select = "", user_svv = "", sem= "", department = "";
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences prefs;
  Future<void> _readAll() async {
    prefs = await _prefs;
    setState(() {
      user_svv = prefs.getString('svv');
      sem= prefs.getString('sem');
      department = prefs.getString('dept') ;

//      svv = prefs.getString('svv');
      // name = 'name';
      // email = 'email';
      // photoUrl = 'photoUrl';
    });
    // print(prefs.getString('email')+prefs.getString('name')+prefs.getString('photoUrl'));
  }

  @override
  void initState() {
    _readAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    screen_size = size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(
          'Classroom',
          style: GoogleFonts.nunito(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: MyColor.kj_red,
      ),
      body: SingleChildScrollView(
          child: Container(
          width: size.width * 1.0,
//          height: size.height * 1.0,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Class_Card_Wid('Python Web Programming', '', ''),
                SizedBox(
                  height: size.height * 0.01,
                ),
                new Class_Card_Wid('Python Web Programming', '', ''),
                SizedBox(
                  height: size.height * 0.01,
                ),
                new Class_Card_Wid('Python Web Programming', '', ''),
                SizedBox(
                  height: size.height * 0.01,
                ),
                new Class_Card_Wid('Python Web Programming', '', ''),
                SizedBox(
                  height: size.height * 0.01,
                ),
                new Class_Card_Wid('Python Web Programming', '', ''),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: MyColor.kj_red,
        closeManually: true,
        child: Icon(Icons.account_circle),
        children: [
          SpeedDialChild(
            child: Icon(Icons.add),
            label: "Add",
            backgroundColor: MyColor.kj_red,
            onTap: () => _addClassroom()),
          SpeedDialChild(
              child: Icon(Icons.business),
              label: "Join",
              backgroundColor: MyColor.kj_red,
              onTap: () => _joinClassroom()),

        ],
      )

//      FloatingActionButton(
//        backgroundColor: MyColor.kj_red,
//        child: Icon(
//          Icons.add,
//          color: Colors.white,
//        ),
//      ),
    );
  }
//  void check_data()
//  {
//    setState(() {
//      _validate =  1;
//    });
//  }

  Future<void> createClass() async{
    Map class_details = new Map();
//    print("$ddown_dept,$ddown_section,$ddown_sem");
//    print("$sec_select,$sem_select,$dept_select");
    print(user_svv);
    class_details.addAll({
      'code': _classcode.text,
      'name': _classname.text,
      'sub': _classsub.text,
      'sec': sec_select,
      'sem': sem_select,
      'dept': dept_select,
      'id': user_svv,
      'u_type': 'student',
    });
    print(class_details);
    Classrooms add = new Classrooms();
    await add.addClass(class_details).then((value) {
      print("Value recieved:${value[0]}");
      var val = value[0];
//        print("Success Code:${val['success']} type:${val['success'].runtimeType}");
//        print("Message:${val['message']}");
      if(val['success']==1)
      {
        Navigator.of(context).pop();
      }
      Navigator.of(context).push(
          PageRouteBuilder(
              pageBuilder: (context, _, __) => openCustomDialog(context, val['message'],val['success']==1? MyColor.login_success : MyColor.login_fail),
              opaque: false));
//      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) { return openCustomDialog(context, val['message'],val['success']==1? MyColor.login_success : MyColor.login_fail); }));

    });
  }
  Future<void> joiningClass() async{
    Map joinclass_details = new Map();
//    print("$ddown_dept,$ddown_section,$ddown_sem");
    print("The code written is:${_joinclasscode.text}");
//    print("$sec_select,$sem_select,$dept_select");
    joinclass_details.addAll({
      'code': _joinclasscode.text,
      'sem': sem,
      'dept': department,
      'id': user_svv,
      'u_type': 'student',
    });
    print(joinclass_details);
    Classrooms join = new Classrooms();
    await join.joinClass(joinclass_details).then((value) {
      print("Value recieved:${value[0]}");
      var val = value[0];
//        print("Success Code:${val['success']} type:${val['success'].runtimeType}");
//        print("Message:${val['message']}");
      if(val['success']==1)
      {
        Navigator.of(context).pop();
      }
      Navigator.of(context).push(
          PageRouteBuilder(
              pageBuilder: (context, _, __) => openCustomDialog(context, val['message'],val['success']==1? MyColor.login_success : MyColor.login_fail),
              opaque: false));
    });
  }

  void _joinClassroom() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Join Classroom",textAlign: TextAlign.left,style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w500 ),),
            content: Form(
              key: _joinformKey,
              autovalidate: _joinvalidate,
              child: SingleChildScrollView(
                child: Container(
                  height: screen_size.height* 0.21,
                  child: Column(
                    children: <Widget>[
                      _textform("Classroom Code" , "Enter Classroom Code",_joinclasscode),
                      SizedBox(height: screen_size.height*0.02,),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FlatButton(
                              splashColor: MyColor.som_grey,

                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text("Join",style: GoogleFonts.roboto(fontSize: 16,color: MyColor.kj_red, fontWeight: FontWeight.w700,), textAlign: TextAlign.left,)
                              ),
                              onPressed: () async{
                                if (_joinformKey.currentState.validate()) {
                                  print("All Validating");
                                  await joiningClass();
                                }
                                else {
                                  setState(() {
                                    _joinvalidate = true;
                                  });
                                }
                              },
                            ),
                            FlatButton(
                              splashColor: MyColor.som_grey,
                              child: Text("Cancel",style: GoogleFonts.roboto(fontSize: 16,color: MyColor.som_grey, fontWeight: FontWeight.w700),),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                            ),
                          ])
                    ],
                  ),
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
          );
        }
    );
  }
  void _addClassroom() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("New Classroom",textAlign: TextAlign.left,style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w500 ),),
            content: Form(
              key: _formKey,
              autovalidate: _validate,
              child: SingleChildScrollView(
                child: Container(
                  height: screen_size.height* 0.87,
                  child: Column(
                    children: <Widget>[
                      _textform("Class Name" , "Enter Class Name",_classname),
                      SizedBox(height: screen_size.height* 0.02,),
                      _textform("Subject" , "Enter Subject Name",_classsub),
                      SizedBox(height: screen_size.height* 0.02,),
//                      _textform("Section" , "Enter Section"),
                      _DropDownField("Section",section,ddown_section,sec_select,1),
                      SizedBox(height: screen_size.height* 0.02,),
                      _DropDownField("Semester",semester,ddown_sem,sem_select,2),
                      SizedBox(height: screen_size.height* 0.02,),
                      _DropDownField("Department",dept,ddown_dept,dept_select,3),
                      SizedBox(height: screen_size.height* 0.02,),
                      _textform("Room Code" , "Enter Code",_classcode),
                      SizedBox(height: screen_size.height* 0.02,),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FlatButton(
                              splashColor: MyColor.som_grey,

                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text("Create",style: GoogleFonts.roboto(fontSize: 16,color: MyColor.kj_red, fontWeight: FontWeight.w700,), textAlign: TextAlign.left,)
                              ),
                              onPressed: () async{
                                if (_formKey.currentState.validate()) {
                                  print("All Validating");
                                  await createClass();
                                }
                                else {
                                  setState(() {
                                    _validate = true;
                                  });
                                }
                              },
                            ),
                            FlatButton(
                              splashColor: MyColor.som_grey,
                              child: Text("Cancel",style: GoogleFonts.roboto(fontSize: 16,color: MyColor.som_grey, fontWeight: FontWeight.w700),),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                            ),
                          ])
                    ],
                  ),
                ),
              ),
            ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
          );
        }
    );
  }
  bool _obscureText = true;
  void _toggle() {
    print(_obscureText);
    setState(() {
      if(_obscureText)
        _classcode.text = randomAlphaNumeric(7);
      else{
        _classcode.text = "";
      }
      _obscureText = !_obscureText;
    });
  }
  Widget _textform(String label, String hint, TextEditingController editingController)
  {
    return Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,

          height: screen_size.height*0.1,
          child: Flexible(
            fit: FlexFit.tight,
            child: TextFormField(
                controller: editingController,
                autofocus: false,
                maxLines: 1,
                minLines: 1,
                textInputAction: TextInputAction.next,
                style: GoogleFonts.openSans(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 15
                ),
                maxLength: editingController==_classcode? 7 : 30,
                decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10.0)),
                border: InputBorder.none,
                labelText: label,
                labelStyle: GoogleFonts.openSans(fontWeight: FontWeight.bold,color: MyColor.kj_red, fontSize: 18),
                contentPadding: EdgeInsets.only(top: 0.0, bottom: 5.0,left: 10.0),
                hintText: hint,
                hintStyle: kHintTextStyle,
                counterText: '',
                suffixIcon: editingController==_classcode? IconButton(
                  iconSize: 16.0,
                  padding: EdgeInsets.only(left:4,right:4,top:0),
                  icon: _obscureText ==true ?
                      Icon(Icons.build):Icon(Icons.clear),
                  onPressed: _toggle,
                  color: Colors.grey[800],
                ): null,
//              errorText:  _validate == 1 ? emptyField(editingController.text) : null,
                errorStyle: GoogleFonts.roboto(color: Colors.red, fontWeight: FontWeight.bold, height: 0.5),
                ),
                validator: (value)  {
                  if (value.length ==0) {
                  return "*Required";
                  } else {
                  return null;
                  }
                }
            ),
          ),
    );
  }
  Widget _DropDownField(String name,List<String> list, String selected, String prev, int n)
  {
    return DropdownButtonFormField<String>(
      value: selected,
      hint: Text(name,style: GoogleFonts.roboto(fontSize: 18, color: MyColor.kj_red, fontWeight: FontWeight.bold),),
      onChanged: (String newValue) {
        setState(() {
          if(n==1) {
            sec_select = newValue;
          }
          else if(n==2) {
            sem_select = newValue;
          }
          else if(n==3) {
            dept_select = newValue;
          }
        });
      },
      validator: (String value) {
        if (value?.isEmpty ?? true) {
          return '*Required';
        }
      },
      items: list
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onSaved: (val) => setState(() => prev = val),
    );
  }
  String emptyField(String value) {
    print(value);
    if (value.isEmpty) {
      return "Field Compulsory";
    }
    return null;
  }
}
