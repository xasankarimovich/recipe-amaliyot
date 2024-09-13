import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
class AppLogo extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit? fit;
  const AppLogo({
    super.key,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Images.logo,
      width: width ?? 178,
      height: height ?? 173,
      fit: fit,
    );
  }
}
