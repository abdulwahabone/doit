import 'package:doit/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginHeaderImager extends StatelessWidget {
  const LoginHeaderImager({Key? key}) : super(key: key);
  final double lottieHeight = 300;
  final double lottieWidth = 300;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: lottieWidth,
        height: lottieHeight,
        child: Lottie.asset(loginHeaderLottie),
      ),
    );
  }
}
