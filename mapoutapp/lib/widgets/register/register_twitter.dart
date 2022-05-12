// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mapoutapp/screens/search/search.dart';
import 'package:mapoutapp/utils/constants/social_keys.dart';
import 'package:mapoutapp/utils/log_utils.dart';
import 'package:mapoutapp/utils/widgets/progress_dialog.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:twitter_login/twitter_login.dart';

class RegisterTwitter extends StatelessWidget {
  const RegisterTwitter({
    Key? key,
  }) : super(key: key);

  void _twitterSignInProcess(BuildContext context) async {
    TwitterLogin twitterLogin = TwitterLogin(
      apiKey: SocialKeys.twitterApiKey,
      apiSecretKey: SocialKeys.twitterApiSecretKey,
      redirectURI: SocialKeys.twitterRedirectUri,
    );
    AuthResult authResult = await twitterLogin.login();
    ProgressDialogUtils.showProgressDialog(context);
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        ProgressDialogUtils.dismissProgressDialog();
        LogUtils.showLog("${authResult.authToken}");
        Fluttertoast.showToast(
          msg: authResult.user!.email.toString(),
          backgroundColor: Colors.blue,
          textColor: Colors.white);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchScreen()));
        break;
      case TwitterLoginStatus.cancelledByUser:
        _showFailureResult(authResult);
        break;
      case TwitterLoginStatus.error:
        _showFailureResult(authResult);
        break;
      case null:
        _showFailureResult(authResult);
        break;
    }
  }

  // Common Failure Result Method
  void _showFailureResult(AuthResult authResult) {
  ProgressDialogUtils.dismissProgressDialog();
  LogUtils.showLog("${authResult.status}");
  Fluttertoast.showToast(
    msg: authResult.status.toString(),
    backgroundColor: Colors.blue,
    textColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 125,
      child: TextButton(
        onPressed: (){
          _twitterSignInProcess(context);
        },
        style: ButtonStyle(
          backgroundColor:  MaterialStateProperty.all(Color(0xff06B0E8)),
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
              'assets/images/twitter_logo.svg',
              width: 25,
              height: 25,
            ),
            SizedBox(width: 10),
            Text(
              'CONTINUAR CON TWITTER',
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