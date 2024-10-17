import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'button.dart';
import 'textfield.dart';
import '../login_screen.dart';
import '../../../models/login.dart';
import '../../home/home_screen.dart';
import '../../../constants/image_path.dart';

class LoginBody extends StatelessWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              SizedBox(width: 100, child: Imagez.logo),
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
              ButtonLogin(
                text: "Entrar",
                onTap: () {
                  BlocProvider.of<LoginCubit>(context).checkLogin(
                    context,
                    userController.text.toString(),
                    passwordController.text.toString(),
                  );
                },
              ),
              ButtonLogin(
                text: "Usuário Logado",
                onTap: () {
                  BlocProvider.of<HomeCubit>(context).successLogin(
                    Login(
                      id: 3,
                      clientTypeId: 1,
                      name: "Caike Ferreira",
                      user: "CaikeFerreira",
                      password: "123",
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
