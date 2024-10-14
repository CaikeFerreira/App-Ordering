import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/models/abstrscts/bloccontainer.dart';

import '../../models/order.dart';
import 'widgets/body_screen.dart';
import '../../models/product.dart';
import '../../screen_widgets/progress.dart';
import '../home/Widgets/navigation_cart.dart';
import '../../models/abstrscts/state_screen.dart';
import '../../screen_widgets/centered_message.dart';
import '../../screen_models/order_screenmodels.dart';
import '../../screen_widgets/snackbar/snackbar_custom.dart';



@immutable
class LoadedCartState extends ScreenState {
  final List<Product> _products;
  const LoadedCartState(this._products);
}

@immutable
class FatalErrorCartState extends ScreenState {
  final String _message;
  const FatalErrorCartState(this._message);
}

List<Product> _products = [];
num _clientId = 0;

class CartCubit extends Cubit<ScreenState> {
  num clientId;
  CartCubit({required this.clientId}) : super(const InitScreenState());

  Future<void> load() async {
    try {
      emit(const LoadingScreenState());

      emit(LoadedCartState(_products));
    } on TimeoutException {
      emit(const FatalErrorCartState("Servidor não responde!"));
    } catch (e) {
      emit(FatalErrorCartState(e.toString()));
    }
  }

  Future<void> add(BuildContext context, Product product) async {
    try {
      Product? duplicityProduct = null;

      if (duplicityProduct == null) {
        _products.add(product);
      } else {
        duplicityProduct.amount += product.amount;
      }

      BlocProvider.of<NavigationCartCubit>(context)
          .updateAmount(_products.length);
    } on TimeoutException {
      emit(const FatalErrorCartState("Servidor não responde!"));
    } catch (e) {
      emit(FatalErrorCartState(e.toString()));
    }
  }

  void update(Product product) {
    try {
      //emit(const LoadingScreenState());

      //Atualiza o produto na base de dados

      _products.remove(product);
      _products.add(product);

      // emit(LoadedCartState(_products));
    } on TimeoutException {
      emit(const FatalErrorCartState("Servidor não responde!"));
    } catch (e) {
      emit(FatalErrorCartState(e.toString()));
    }
  }

  void delete(BuildContext context, Product product) {
    try {
      emit(const LoadingScreenState());

      _products.remove(product);

      emit(LoadedCartState(_products));

      BlocProvider.of<NavigationCartCubit>(context)
          .updateAmount(_products.length);
    } on TimeoutException {
      emit(const FatalErrorCartState("Servidor não responde!"));
    } catch (e) {
      emit(FatalErrorCartState(e.toString()));
    }
  }

  Future<void> uploadOrder() async {
    try {
      emit(const LoadingScreenState());

      if (!_products.isEmpty) {
        Order order = OrderScreenModels().createOrder(clientId, _products);

        await OrderScreenModels().add(order);

        _products = [];

        emit(const UploadScreenState());
      }

      emit(LoadedCartState(_products));
    } on TimeoutException {
      emit(const FatalErrorCartState("Servidor não responde!"));
    } catch (e) {
      emit(FatalErrorCartState(e.toString()));
    }
  }
}

class CartContainer extends BlocContainer {
  const CartContainer({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartCubit>(context).load();

    return MultiBlocProvider(providers: [
      BlocListener<CartCubit, ScreenState>(listener: (context, state) {
        if (state is FatalErrorCartState) {
          snackBarCustomError(
            context: context,
            message: state._message,
          );
        } else if (state is UploadScreenState) {
          snackBarCustomSucess(
            context: context,
            message: "Pedido Efetuado",
          );
        }
      })
    ], child: _CartScreen());
  }
}

class _CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, ScreenState>(
      builder: (context, state) {
        if (state is InitScreenState || state is LoadingScreenState) {
          return const Progress();
        }

        if (state is LoadedCartState) {
          return BodyScreen(products: state._products);
        }

        return const CenteredMessage(
          'Unknow error',
          icon: Icons.error_outline,
        );
      },
    );
  }
}
