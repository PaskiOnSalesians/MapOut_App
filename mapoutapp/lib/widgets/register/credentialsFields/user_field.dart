// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mapoutapp/widgets/register/global/global_variables.dart';

class UserField extends StatelessWidget {
  const UserField({
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
              Globals.username = value;
            },
            decoration: InputDecoration(
              filled: true,
              hintText: "Nombre de usuario",
              prefixIcon: Icon(Icons.person, color: Color(0xFF50C3CB)),
              fillColor: Color(0xFFF0F0F0),
              contentPadding: EdgeInsets.fromLTRB(0,4,0,8),
              border: InputBorder.none
            ),
          ),
        ),
      ),
    );
  }
}