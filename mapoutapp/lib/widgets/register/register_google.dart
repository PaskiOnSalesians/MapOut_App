// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mapoutapp/screens/main_screen.dart';
import 'package:mapoutapp/services/res_google_signin_model.dart';
import 'package:mapoutapp/utils/log_utils.dart';

class RegisterGoogle extends StatelessWidget {
  const RegisterGoogle({
    Key? key,
  }) : super(key: key);

  void _googleSignInProcess(BuildContext context) async {
    try{
      GoogleSignIn _googleSignIn = GoogleSignIn();
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      String? token = googleAuth?.idToken;
      ResGoogleSignInModel _socialGoogleUser = ResGoogleSignInModel(
        displayName: googleUser?.displayName,
        email: googleUser?.email,
        photoUrl: googleUser?.photoUrl,
        id: googleUser?.id,
        token: token);
      Fluttertoast.showToast(
        msg: googleUser!.email,
        backgroundColor: Colors.blue,
        textColor: Colors.white);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainScreen()));
      LogUtils.showLog("${_socialGoogleUser.toJson()}");
    } on Exception catch (e){
      LogUtils.showLog("$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 125,
      child: TextButton(
        onPressed: (){
          _googleSignInProcess(context);
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
            Image.asset(
              'assets/images/google_logo.png',
              width: 25,
              height: 25,
            ),
            SizedBox(width: 13),
            Text(
              'CONTINUAR CON GOOGLE',
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