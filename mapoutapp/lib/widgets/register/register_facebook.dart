// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mapoutapp/screens/error/error.dart';
import 'package:mapoutapp/utils/constants/key_constants.dart';
import 'package:mapoutapp/utils/constants/login_type.dart';

class RegisterFacebook extends StatelessWidget {
  const RegisterFacebook({
    Key? key,
  }) : super(key: key);

  Future<UserCredential> signInWithFacebook() async{
    LoginType.accessType = "Facebook";

    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: ['name','email','picture.width(200)','birthday']
    );
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
    
    KeyConstants.facebookUserDataFields = await FacebookAuth.instance.getUserData();
    
    KeyConstants.facebookEmail = KeyConstants.facebookUserDataFields["email"];

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 125,
      child: TextButton(
        onPressed: (){
          //signInWithFacebook();
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ErrorScreen()));
        },
        style: ButtonStyle(
          backgroundColor:  MaterialStateProperty.all(Color(0xff1877F2)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            SvgPicture.asset(
              'assets/images/facebook_logo.svg',
              width: 25,
              height: 25,
            ),
            SizedBox(width: 13),
            Text(
              'CONTINUAR CON FACEBOOK',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        )
      ),
    );
  }
}


// try{
//   LoginResult result = await FacebookAuth.instance.login();
//   ProgressDialogUtils.showProgressDialog(context);
//   if (result.status == LoginStatus.success) {
//     AccessToken accessToken = result.accessToken!;
//     Map<String, dynamic> userData = await FacebookAuth.i.getUserData(
//       fields: KeyConstants.facebookUserDataFields,
//     );
//     ProgressDialogUtils.dismissProgressDialog();
//     Fluttertoast.showToast(
//         msg: userData[KeyConstants.emailKey],
//         backgroundColor: Colors.blue,
//         textColor: Colors.white);
//     LogUtils.showLog(accessToken.userId);
//     LogUtils.showLog("$userData");
//     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchScreen()));
//   } else {
//     ProgressDialogUtils.dismissProgressDialog();
//   }
// } on Exception catch (e){
//   LogUtils.showLog("$e");
// }