import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      width: MediaQuery.of(context).size.width / 4
    );
  }
}