import 'package:flutter/material.dart';

import '../../../screen_widgets/centered_message.dart';

class EmptyOrder extends StatelessWidget {
  const EmptyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return const CenteredMessage(
      "Empty Request!",
      icon: Icons.request_page_outlined,
    );
  }
}
