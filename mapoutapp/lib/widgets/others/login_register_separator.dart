// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginRegisterSeparator extends StatelessWidget {
  const LoginRegisterSeparator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        '- o -',
        style: TextStyle(
          decoration: TextDecoration.none,
          color: Colors.black,
          fontSize: 12,
        ),
      ),
    );
  }
}