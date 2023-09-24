
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

const  colorRed=Color.fromRGBO(255, 99, 71,1);
const colorGreen=Color.fromRGBO(60, 179, 113,1);
const colorWhite=Color.fromRGBO(255,255,255,1);
const darkBlue=Color.fromRGBO(44,62,80,1);

InputDecoration AppInputDecoration(labeltext){
  return InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorGreen,width: 1),

    ),
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    filled: true,
    fillColor: colorWhite,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorWhite,width: 1),

    ),
    border: OutlineInputBorder(),
    labelText:labeltext,
  );
}

  SvgPicture screenBackground(context){
  return SvgPicture.asset('assets/image/background.svg',
  alignment: Alignment.center,
  fit: BoxFit.cover,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
  );

}

DecoratedBox DropDownButton (child){
  return DecoratedBox(decoration: BoxDecoration(
    color: colorWhite,borderRadius: BorderRadius.circular(4),
    border: Border.all(color: colorWhite),

  ),
  child: child,);
}
ButtonStyle appButtonstyle(){
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.all(0),
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
  );
}

Ink successButton(ButtonText){
  return Ink(
    decoration: BoxDecoration(
      color: colorGreen,
      borderRadius: BorderRadius.circular(6),

    ),child: Container(
    height: 45,
    alignment: Alignment.center,
    child: Text(ButtonText,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
  ),
  );
}

void ErrorToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

void SuccessToast(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}


