import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/models/abstrscts/bloccontainer.dart';

import '../../../models/login.dart';
import '../../cart/cart_screen.dart';
import '../../order/order_screen.dart';
import '../../product/product_screen.dart';
import 'navigation_cart.dart';
import 'perfil_action.dart';

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
    super.key,
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
        title: Image.asset("assets/images/logo256x256.png", width: 35),
        centerTitle: true,
        actions: [
          ProfileAction(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
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
      body: <Widget>[
        ProductContainer(
          clientTypeId: int.parse(widget.login.clientTypeId.toString()),
        ),
        CartContainer(),
        OrderContainer(
          clientId: int.parse(widget.login.id.toString()),
        ),
      ][currentPageIndex],
    );
  }
}
