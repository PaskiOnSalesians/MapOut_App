// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mapoutapp/screens/main_screen.dart';
import 'package:mapoutapp/utils/constants/key_constants.dart';
import 'package:mapoutapp/utils/log_utils.dart';
import 'package:mapoutapp/utils/widgets/progress_dialog.dart';

class RegisterFacebook extends StatelessWidget {
  const RegisterFacebook({
    Key? key,
  }) : super(key: key);

  void _facebookSignInProcess(BuildContext context) async {
    try{
      LoginResult result = await FacebookAuth.instance.login();
      ProgressDialogUtils.showProgressDialog(context);
      if (result.status == LoginStatus.success) {
        AccessToken accessToken = result.accessToken!;
        Map<String, dynamic> userData = await FacebookAuth.i.getUserData(
          fields: KeyConstants.facebookUserDataFields,
        );
        ProgressDialogUtils.dismissProgressDialog();
        Fluttertoast.showToast(
            msg: userData[KeyConstants.emailKey],
            backgroundColor: Colors.blue,
            textColor: Colors.white);
        LogUtils.showLog(accessToken.userId);
        LogUtils.showLog("$userData");
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainScreen()));
      } else {
        ProgressDialogUtils.dismissProgressDialog();
      }
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
          _facebookSignInProcess(context);
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