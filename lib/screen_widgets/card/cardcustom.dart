import 'package:flutter/material.dart';

import '../../constants/attributes.dart';

class CardCustom extends StatelessWidget {
  final Widget? child;
  final double? height;

  const CardCustom({super.key, this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultRadiusBorder),
      ),
      elevation: 5,
      child: SizedBox(
        height: height,
        child: child,
      ),
    );
  }
}
