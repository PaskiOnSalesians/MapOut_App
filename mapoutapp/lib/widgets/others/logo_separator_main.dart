import 'package:flutter/material.dart';

class SeparatorLogoMain extends StatelessWidget {
  const SeparatorLogoMain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height / 6);
  }
}