import 'package:flutter/material.dart';

class SeparatorLogoArea extends StatelessWidget {
  const SeparatorLogoArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height / 20);
  }
}