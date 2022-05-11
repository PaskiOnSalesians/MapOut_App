// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mapoutapp/widgets/register/global/global_variables.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          width: 10, 
          color: Color(0xFFF0F0F0),
          style: BorderStyle.solid
        )
      ),
      child: Container(
        color: Color(0xFFF0F0F0),
        child: SizedBox(
          child: TextField(
            onChanged: (value){
              Globals.email = value;
            }, 
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              hintText: "Email",
              fillColor: Color(0xFFF0F0F0),
              prefixIcon: Icon(Icons.mail, color: Color(0xFF50C3CB)),
              contentPadding: EdgeInsets.fromLTRB(0,4,0,8),
              border: InputBorder.none
            ),
          ),
        ),
      ),
    );
  }
}