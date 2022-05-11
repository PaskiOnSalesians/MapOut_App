// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mapoutapp/screens/login-register/login.dart';
import 'package:mapoutapp/widgets/others/logo_app.dart';
import 'package:mapoutapp/widgets/others/logo_separator_register.dart';
import 'package:mapoutapp/widgets/register/button_register.dart';
import 'package:mapoutapp/widgets/register/credentialsFields/email_field.dart';
import 'package:mapoutapp/widgets/register/credentialsFields/name_field.dart';
import 'package:mapoutapp/widgets/register/credentialsFields/user_field.dart';
import 'package:mapoutapp/widgets/register/global/global_variables.dart';

class RegisterEmail extends StatefulWidget {
  const RegisterEmail({ Key? key }) : super(key: key);

  @override
  State<RegisterEmail> createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  bool isChecked = false;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40,),
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
            SeparatorLogoAreaRegister(),
            LogoApp(),
            SizedBox(height: 40),
            UserField(),
            SizedBox(height: 20),
            UserNameField(),
            SizedBox(height: 20),
            EmailField(),
            SizedBox(height: 20),
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
                    onChanged: (value){
                      Globals.password = value;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Contraseña",
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
                      fillColor: Color(0xFFF0F0F0),
                      contentPadding: EdgeInsets.fromLTRB(0,4,0,8),
                      border: InputBorder.none
                    ),
                    obscureText: _isObscure,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Aceptas los términos y condiciones\nrelacionados con MapOut'
                ),
                SizedBox(width: 10),
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.all(Color(0xFF50C3CB)),
                  value: isChecked,
                  onChanged: (bool? value){
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 50),
            RegisterButton()
          ],
        ),
      )
    );
  }
}