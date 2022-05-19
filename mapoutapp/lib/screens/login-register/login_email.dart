// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mapoutapp/screens/login-register/login.dart';
import 'package:mapoutapp/screens/search/search.dart';
import 'package:mapoutapp/utils/constants/login_type.dart';
import 'package:mapoutapp/widgets/others/logo_app.dart';
import 'package:mapoutapp/widgets/others/logo_separator.dart';
import 'package:mapoutapp/widgets/register/global/global_variables.dart';

class LoginEmail extends StatefulWidget {
  const LoginEmail({ Key? key }) : super(key: key);

  @override
  State<LoginEmail> createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  bool _isObscure = true;

  final db = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email, password;

  Future<User?> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      throw Fluttertoast.showToast(msg: e.toString(), backgroundColor: Colors.red, textColor: Colors.white);
    }
  }

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
                      email = value;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Correo electrónico",
                      fillColor: Color(0xFFF0F0F0),
                      prefixIcon: Icon(Icons.mail, color: Color(0xFF50C3CB)),
                      contentPadding: EdgeInsets.fromLTRB(0,4,0,8),
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
            ),
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
                    onChanged: (value){
                      password = value;
                    },
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
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: 50,
              child: TextButton(
                onPressed: () async{
                  try{
                    await signInWithEmailAndPassword(email: email, password: password);

                    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users').get();

                    for (var f in snapshot.docs) {
                      if(f['email'] == email){
                        Globals.fullname = f['fullname'].toString();
                        Globals.profile_pic = f['profile_pic'].toString();
                        LoginType.accessType = "Email";
                      }
                    }

                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchScreen()));
                  }catch(e){
                    Fluttertoast.showToast(msg: e.toString(), backgroundColor: Colors.red, textColor: Colors.white);
                  }
                },
                style: ButtonStyle(
                  backgroundColor:  MaterialStateProperty.all(Color(0xFFEB7C25)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ENTRAR',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 18,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ],
                )
              ),
            )
          ],
        ),
      )
    );
  }
}