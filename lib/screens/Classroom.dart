import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:attedancerecordsystm/values/MyColor.dart';
import 'package:attedancerecordsystm/screens/Card_Wid.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:attedancerecordsystm/values/style.dart';
import 'package:random_string/random_string.dart';

class Classroom extends StatefulWidget {
  @override
  Classroom_State createState() => Classroom_State();
}

class Classroom_State extends State<Classroom> {
  final _classname = TextEditingController();
  final _classsub = TextEditingController();
  final _classcode = TextEditingController();
  FocusNode myFocusNode = new FocusNode();
  final _formKey = GlobalKey<FormState>();

  var screen_size;
  bool _validate = false;
  List<String> typeNeg = [
    "General",
    "English & History",
    "Math & Science",
    "Arts",
    "Other",
  ];
  String dropdownValue = null;
  String select = "";
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
              onTap: () => print("Join Classroom")),

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



  void _addClassroom()
  {
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
                  height: screen_size.height* 0.64,
                  child: Column(
                    children: <Widget>[
                      _textform("Class Name" , "Enter Class Name",_classname),
                      SizedBox(height: 20,),
                      _textform("Subject" , "Enter Subject Name",_classsub),
                      SizedBox(height: 20,),
//                    _textform("Section" , "Enter Section"),
                      DropdownButtonFormField<String>(
                        value: dropdownValue,
                        hint: Text("Section",style: GoogleFonts.roboto(fontSize: 18, color: MyColor.kj_red, fontWeight: FontWeight.bold),),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        validator: (String value) {
                          if (value?.isEmpty ?? true) {
                            return '*Required';
                          }
                        },
                        items: typeNeg
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onSaved: (val) => setState(() => select = val),
                      ),
                      SizedBox(height: 20,),
                      _textform("Room Code" , "Enter Code",_classcode),
                      SizedBox(height: 20,),
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
                maxLength: 30,
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
                errorStyle: GoogleFonts.roboto(color: Colors.red, fontWeight: FontWeight.bold),
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
  String emptyField(String value) {
    print(value);
    if (value.isEmpty) {
      return "Field Compulsory";
    }
    return null;
  }
}
