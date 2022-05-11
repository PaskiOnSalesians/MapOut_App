// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mapoutapp/screens/login-register/register_email.dart';

class RegisterCorreo extends StatelessWidget {
  const RegisterCorreo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 125,
      child: TextButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterEmail()));
        },
        style: ButtonStyle(
          backgroundColor:  MaterialStateProperty.all(Color(0xFFF0F0F0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            Icon(
              Icons.mail_outline_rounded,
              color: Colors.black
            ),
            SizedBox(width: 15),
            Text(
              'REGISTRARSE CON EMAIL',
              style: TextStyle(
                color: Color(0xFF000000),
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        )
      ),
    );
  }
}