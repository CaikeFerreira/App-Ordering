import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Widgets/bodyScreen.dart';
import '../../models/login.dart';
import '../login/login_screen.dart';
import '../../models/abstrscts/state_screen.dart';
import '../../models/abstrscts/bloccontainer.dart';
import '../../screen_widgets/snackbar/snackbar_custom.dart';

@immutable
class LoadedLoginState extends ScreenState {
  const LoadedLoginState();
}

@immutable
class LoadedHomeState extends ScreenState {
  final Login _login;

  const LoadedHomeState(this._login);
}

@immutable
class FatalErrorState extends ScreenState {
  final String _message;
  const FatalErrorState(this._message);
}

class HomeCubit extends Cubit<ScreenState> {
  HomeCubit() : super(const InitScreenState());

  void Logout() {
    try {
      emit(const LoadingScreenState());

      emit(const LoadedLoginState());
    } on TimeoutException {
      emit(const FatalErrorState("Servidor não responde!"));
    } catch (e) {
      emit(FatalErrorState(e.toString()));
    }
  }

  void SuccessLogin(Login login) {
    try {
      emit(const LoadingScreenState());

      emit(LoadedHomeState(login));
    } on TimeoutException {
      emit(const FatalErrorState("Servidor não responde!"));
    } catch (e) {
      emit(FatalErrorState(e.toString()));
    }
  }
}

class HomeContainer extends BlocContainer {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) {
            final cubit = HomeCubit();
            cubit.Logout();
            return cubit;
          },
        ),
        BlocListener<HomeCubit, ScreenState>(
          listener: (context, state) {
            if (state is FatalErrorState) {
              snackBarCustomError(
                context: context,
                message: state._message,
              );
            }
          },
        )
      ],
      child: _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, ScreenState>(
      builder: (context, state) {
        if (state is LoadedHomeState) {
          return BodyHomeContainer(state._login);
        }

        return const LoginContainer();
      },
    );
  }
}
