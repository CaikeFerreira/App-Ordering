import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/screen_widgets/progress.dart';
import 'package:front_end/screen_widgets/background.dart';
import 'package:front_end/screens/login/widgets/body.dart';
import 'package:front_end/models/abstrscts/bloccontainer.dart';

import '../../models/login.dart';
import '../home/home_screen.dart';
import '../../models/abstrscts/state_screen.dart';
import '../../screen_models/login_screenmodels.dart';
import '../../screen_widgets/snackbar/snackbar_custom.dart';

@immutable
class LoginInvalidState extends ScreenState {
  const LoginInvalidState();
}

class LoginSuccessState extends ScreenState {
  final Login _login;
  const LoginSuccessState(this._login);
}

@immutable
class FatalErrorState extends ScreenState {
  final String _message;
  const FatalErrorState(this._message);
}

class LoginCubit extends Cubit<ScreenState> {
  LoginCubit() : super(const InitScreenState());

  Future<void> checkLogin(
      BuildContext context, String user, String password) async {
    try {
      emit(const LoadingScreenState());

      final Login login =
          Login(id: 0, clientTypeId: 0, name: '', user: '', password: '');

      login.user = user;
      login.password = password;

      Login newLogin = await LoginScreenModels().findLogin(login);

      if (newLogin.id <= 0) {
        emit(const LoginInvalidState());

        return;
      } else {
        emit(LoginSuccessState(newLogin));
      }
    } on TimeoutException {
      emit(const FatalErrorState("Servidor não responde!"));
    } catch (e) {
      emit(FatalErrorState(e.toString()));
    }
  }
}

class LoginContainer extends BlocContainer {
  const LoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) {
            return LoginCubit();
          },
        ),
        BlocListener<LoginCubit, ScreenState>(
          listener: (context, state) {
            if (state is FatalErrorState) {
              snackBarCustomError(
                context: context,
                message: state._message,
              );
            }

            if (state is LoginInvalidState) {
              snackBarCustomWarning(
                context: context,
                message: "Usuario ou Senha Incorreta!",
              );
            }

            if (state is LoginSuccessState) {
              BlocProvider.of<HomeCubit>(context).SuccessLogin(state._login);
            }
          },
        ),
      ],
      child: _LoginScreen(),
    );
  }
}

class _LoginScreen extends StatelessWidget {
  final Login login =
      Login(id: 0, clientTypeId: 0, name: '', user: '', password: '');

  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  _LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: BlocBuilder<LoginCubit, ScreenState>(
          builder: (context, state) {
            if (state is LoadingScreenState) {
              return const Progress();
            }

            return LoginBody();
          },
        ),
      ),
    );
  }
}
