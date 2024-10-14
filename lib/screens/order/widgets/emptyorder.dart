import 'package:flutter/material.dart';
import 'package:front_end/screen_widgets/centered_message.dart';

class EmptyOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CenteredMessage(
      "Empty Request!",
      icon: Icons.request_page_outlined,
    );
  }
}
