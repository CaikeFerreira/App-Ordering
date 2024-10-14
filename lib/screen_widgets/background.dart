import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

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
            "assets/images/top1.png",
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset(
            "assets/images/top2.png",
            width: size.width,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            "assets/images/bottom1.png",
            width: size.width,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            "assets/images/bottom2.png",
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
