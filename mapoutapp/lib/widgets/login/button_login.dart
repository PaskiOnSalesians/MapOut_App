// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mapoutapp/screens/search/search.dart';
import 'package:mapoutapp/services/auth/login_state.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      height: 50,
      child: TextButton(
        onPressed: (){
          Provider.of<LoginState>(context).login();
          
          // *****************
          // Verify user
          // *****************
          
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen()));
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