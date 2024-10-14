import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/screens/login/login_screen.dart';

import 'textfield.dart';

class LoginBody extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Column(
          children: [
            Image.asset(
              "assets/images/logo256x256.png",
              width: 100,
            ),
            Text(
              "Bem Vindo!",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            Text(
              "Faça login da sua conta",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 30),
            TextFormFielLogin(
              labelTex: "Usuário",
              controller: userController,
            ),
            const SizedBox(height: 20),
            TextFormFielLogin(
              labelTex: "Senha",
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(height: 30),
            FilledButton(
              onPressed: () {
                BlocProvider.of<LoginCubit>(context).checkLogin(
                  context,
                  userController.text.toString(),
                  passwordController.text.toString(),
                );
              },
              child: Container(
                  width: 100,
                  alignment: Alignment.center,
                  child: const Text("Entrar")),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
