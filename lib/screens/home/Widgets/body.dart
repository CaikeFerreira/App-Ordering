import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'perfil_action.dart';
import 'navigation_cart.dart';
import '../../../models/login.dart';
import '../../cart/cart_screen.dart';
import '../../order/order_screen.dart';
import '../../../constants/image_path.dart';
import '../../product/product_screen.dart';
import '../../../models/abstrscts/bloccontainer.dart';

class BodyHomeContainer extends BlocContainer {
  final Login login;

  const BodyHomeContainer(this.login, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<CartCubit>(
        create: (context) {
          final cubit = CartCubit(clientId: login.id);
          cubit.load();
          return cubit;
        },
      ),
      BlocProvider<NavigationCartCubit>(
        create: (context) {
          final cubit = NavigationCartCubit();
          cubit.updateZero();
          return cubit;
        },
      ),
    ], child: _BodyHome(login: login));
  }
}

class _BodyHome extends StatefulWidget {
  final Login login;

  const _BodyHome({
    required this.login,
  });

  @override
  State<_BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<_BodyHome> {
  int currentPageIndex = 0;

  void updatePage(int index) {
    setState(
      () {
        currentPageIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: SizedBox(width: 35, child: Imagez.logo),
        actions: const [ProfileAction()],
      ),
      bottomNavigationBar: Container(
        color: currentPageIndex == 1
            ? Theme.of(context).secondaryHeaderColor
            : Theme.of(context).scaffoldBackgroundColor,
        child: Card(
          elevation: 5,
          child: NavigationBar(
            onDestinationSelected: (int index) {
              updatePage(index);
            },
            indicatorColor: Theme.of(context).primaryColorLight,
            selectedIndex: currentPageIndex,
            destinations: const [
              NavigationDestination(
                selectedIcon: Icon(Icons.paste_rounded),
                icon: Icon(Icons.paste_outlined),
                label: "Produtos",
              ),
              NavigationCartContainer(),
              NavigationDestination(
                selectedIcon: Icon(Icons.request_page_rounded),
                icon: Icon(Icons.request_page_outlined),
                label: "Pedidos",
              ),
            ],
          ),
        ),
      ),
      body: <Widget>[
        ProductContainer(
          clientTypeId: int.parse(widget.login.clientTypeId.toString()),
        ),
        const CartContainer(),
        OrderContainer(
          clientId: int.parse(widget.login.id.toString()),
        ),
      ][currentPageIndex],
    );
  }
}
