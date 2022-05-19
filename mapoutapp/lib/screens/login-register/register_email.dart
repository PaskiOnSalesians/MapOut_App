// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mapoutapp/screens/login-register/login.dart';
import 'package:mapoutapp/screens/search/search.dart';
import 'package:mapoutapp/utils/constants/login_type.dart';
import 'package:mapoutapp/widgets/others/logo_app.dart';
import 'package:mapoutapp/widgets/others/logo_separator_register.dart';
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

  final _auth = FirebaseAuth.instance;

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
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              height: 50,
              child: TextButton(
                onPressed: () async{
                  try {
                    if(isChecked){
                      final newUser = await _auth.createUserWithEmailAndPassword(
                        email: Globals.email, password: Globals.password
                      );

                      Globals.profile_pic = "https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png";
                      
                      LoginType.accessType = "Email";

                      userSetup(Globals.username, Globals.fullname, Globals.email, Globals.profile_pic);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchScreen()));
                    }
                  } catch (e) {
                    print(e);
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

  Future<void> userSetup(String displayName, String fullname, String email, String profilePic) async{
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();

    users.add({
      'displayName': displayName,
      'uid': uid,
      'fullname': fullname,
      'email': email,
      'profile_pic': profilePic
    });
    return;
  }
}