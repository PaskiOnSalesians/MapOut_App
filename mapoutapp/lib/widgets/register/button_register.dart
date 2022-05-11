// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mapoutapp/screens/main_screen.dart';
import 'package:mapoutapp/widgets/register/global/global_variables.dart';

class RegisterButton extends StatelessWidget {
  RegisterButton({
    Key? key,
  }) : super(key: key);

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      height: 50,
      child: TextButton(
        onPressed: () async{
          try {
            final newUser = await _auth.createUserWithEmailAndPassword(
                email: Globals.email, password: Globals.password);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainScreen()));
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
    );
  }
}