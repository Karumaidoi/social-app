import 'package:amerixapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ImageZoom extends StatelessWidget {
  final String image;
  const ImageZoom({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(child: Image(image: AssetImage('${image}'))),
    );
  }
}
