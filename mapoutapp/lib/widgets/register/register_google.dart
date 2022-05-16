// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mapoutapp/screens/search/search.dart';
import 'package:mapoutapp/services/res_google_signin_model.dart';
import 'package:mapoutapp/utils/constants/key_constants.dart';
import 'package:mapoutapp/utils/constants/login_type.dart';

class RegisterGoogle extends StatefulWidget {
  const RegisterGoogle({super.key});

  @override
  State<RegisterGoogle> createState() => _RegisterGoogleState();
}

class _RegisterGoogleState extends State<RegisterGoogle> {
  //late String accessType;

  late GoogleSignInAccount? googleUser;
  late GoogleSignInAuthentication googleAuth;
  late ResGoogleSignInModel googleUserModel;

  Future<UserCredential> signInWithGoogle() async{
    LoginType.accessType = "Google";

    googleUser = await GoogleSignIn().signIn();
    googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: MediaQuery.of(context).size.width - 125,
      child: TextButton(
        onPressed: () async{
          await signInWithGoogle();

          KeyConstants.googleDisplayName = googleUser!.displayName!;
          KeyConstants.googlePhotoUrl = googleUser!.photoUrl!;

          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchScreen()));
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