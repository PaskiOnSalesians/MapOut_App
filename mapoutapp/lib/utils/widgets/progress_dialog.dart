// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProgressDialogUtils {
  static final ProgressDialogUtils _instance = ProgressDialogUtils.internal();
  static bool _isLoading = false;

  ProgressDialogUtils.internal();

  factory ProgressDialogUtils() => _instance;

  static BuildContext? _context;

  static void dismissProgressDialog() {
    if (_isLoading) {
      Navigator.of(_context!).pop();
      _isLoading = false;
    }
  }

  static void showProgressDialog(BuildContext context) async {
    _context = context;
    _isLoading = true;
    await showDialog(
    context: _context!,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: SimpleDialog(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          children: const <Widget>[
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            )
          ],
        ),
      );
    });
  }
}