import 'package:flutter/material.dart';

import '../../../constants/image_path.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Image.asset(
            Imagez.loginTop,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(
            Imagez.loginTop2,
            width: size.width,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            Imagez.loginBottom,
            width: size.width,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            Imagez.loginBottom2,
            width: size.width,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            child,
          ],
        )
      ],
    );
  }
}
