import 'package:flutter/material.dart';

class AmerixIcon extends StatelessWidget {
  const AmerixIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/Amerix.png',
          height: 20,
        ),
      ],
    );
  }
}
