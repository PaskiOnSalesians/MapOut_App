import 'package:flutter/material.dart';

class SeparatorSection extends StatelessWidget {
  const SeparatorSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 2,
        color: const Color.fromARGB(113, 198, 198, 198)
      ),
    );
  }
}