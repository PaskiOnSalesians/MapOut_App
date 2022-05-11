// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mapoutapp/screens/login-register/login.dart';
import 'package:mapoutapp/widgets/login/button_login.dart';
import 'package:mapoutapp/widgets/login/credentialFields/user_field.dart';
import 'package:mapoutapp/widgets/others/logo_app.dart';
import 'package:mapoutapp/widgets/others/logo_separator.dart';

class LoginEmail extends StatefulWidget {
  const LoginEmail({ Key? key }) : super(key: key);

  @override
  State<LoginEmail> createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Color(0xFFEB7C25),
                    ),
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
                    },
                  ),
                ),
              ],
            ),
            SeparatorLogoArea(),
            LogoApp(),
            SizedBox(height: 40),
            UserField(),
            SizedBox(height: 30),
            Container(
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
                  decoration: InputDecoration(
                      filled: true,
                      hintText: "Contraseña",
                      fillColor: Color(0xFFF0F0F0),
                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        padding: EdgeInsets.fromLTRB(0,0,0,0),
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Color(0xFF50C3CB)
                        )
                      ),  
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xFF50C3CB)
                      ),
                      contentPadding: EdgeInsets.fromLTRB(0,4,0,8),
                      border: InputBorder.none
                    ),
                    obscureText: _isObscure,
                  ),
                ),
              )
            ),
            SizedBox(height: 50),
            LoginButton()
          ],
        ),
      )
    );
  }
}