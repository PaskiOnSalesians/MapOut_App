// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mapoutapp/widgets/login/login_correo.dart';
import 'package:mapoutapp/widgets/others/login_register_separator.dart';
import 'package:mapoutapp/widgets/others/logo_app.dart';
import 'package:mapoutapp/widgets/others/logo_separator_main.dart';
import 'package:mapoutapp/widgets/register/register_correo.dart';
import 'package:mapoutapp/widgets/register/register_facebook.dart';
import 'package:mapoutapp/widgets/register/register_google.dart';
import 'package:mapoutapp/widgets/register/register_twitter.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SeparatorLogoMain(),
          LogoApp(),
          SizedBox(height: 40),
          RegisterGoogle(),
          SizedBox(height: 20),
          RegisterFacebook(),
          SizedBox(height: 20),
          RegisterTwitter(),
          SizedBox(height: 20),
          LoginCorreo(),
          SizedBox(height: 20),
          LoginRegisterSeparator(),
          SizedBox(height: 20),
          RegisterCorreo(),
        ],
      )
    );
  }
}