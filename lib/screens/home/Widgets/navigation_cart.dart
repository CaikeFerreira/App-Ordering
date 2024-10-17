import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/abstrscts/state_screen.dart';
import '../../../models/abstrscts/bloccontainer.dart';

@immutable
class LoadedNavigationState extends ScreenState {
  final int amount;

  const LoadedNavigationState(this.amount);
}

class NavigationCartCubit extends Cubit<ScreenState> {
  NavigationCartCubit() : super(const InitScreenState());

  void updateAmount(int amount) {
    emit(LoadedNavigationState(amount));
  }

  void updateZero() {
    emit(const LoadingScreenState());
  }
}

class NavigationCartContainer extends BlocContainer {
  const NavigationCartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return _NavigationDestinationCart();
  }
}

class _NavigationDestinationCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      selectedIcon: const Icon(Icons.shopping_cart_rounded),
      icon: BlocBuilder<NavigationCartCubit, ScreenState>(
        builder: (context, state) {
          if (state is LoadedNavigationState) {
            return Badge(
              isLabelVisible: state.amount > 0 ? true : false,
              label: Text(state.amount.toString()),
              child: const Icon(Icons.shopping_cart_outlined),
            );
          }

          return const Icon(Icons.shopping_cart_outlined);
        },
      ),
      label: "Carrinho",
    );
  }
}
