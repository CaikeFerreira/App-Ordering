import 'package:flutter/material.dart';

import '../../../constants/attributes.dart';
import 'content_typre.dart';

class SnackBarContent extends StatelessWidget {
  final String message;
  final ContentType contentType;

  const SnackBarContent({
    super.key,
    required this.message,
    required this.contentType,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Spacer(flex: 1),
        Expanded(
          flex: 3,
          child: Container(
            height: size.height * 0.08,
            padding: const EdgeInsets.all(defaultPadding * 0.5),
            decoration: BoxDecoration(
              color: contentType.color,
              borderRadius: BorderRadius.circular(defaultRadiusBorder),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: defaultPadding * 0.5),
                  child: Icon(
                    iconType(contentType),
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                      fontSize: size.height * 0.02,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

IconData iconType(ContentType contentType) {
  switch (contentType) {
    case ContentType.failure:
      return Icons.error_outline;

    case ContentType.success:
      return Icons.check_circle_outline;

    case ContentType.warning:
      return Icons.warning_outlined;

    case ContentType.help:
      return Icons.help_outlined;

    default:
      return Icons.error_outline;
  }
}
