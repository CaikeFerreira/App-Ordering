import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_screen.dart';

class ProfileAction extends StatelessWidget {
  const ProfileAction({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (BuildContext context) {
        return {'Logout'}.map((String choice) {
          return PopupMenuItem(
            value: choice,
            child: Text(choice),
            onTap: () => BlocProvider.of<HomeCubit>(context).logout(),
          );
        }).toList();
      },
      icon: const Icon(Icons.person),
    );
  }
}
