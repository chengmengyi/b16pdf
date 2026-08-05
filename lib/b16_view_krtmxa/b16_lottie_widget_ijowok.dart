import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class B16LottieWidgetIjowok extends StatelessWidget{
  String name;
  double? width;
  double? height;
  BoxFit? boxFit;
  bool? repeat;
  B16LottieWidgetIjowok({
    required this.name,
    this.width,
    this.height,
    this.repeat,
});

  @override
  Widget build(BuildContext context) => Lottie.asset(
    "assets/b16_pdf_lottie_fjiwjiw/$name.json",
    width: width,
    height: height,
    fit: boxFit,
    repeat: repeat??false,
  );
}