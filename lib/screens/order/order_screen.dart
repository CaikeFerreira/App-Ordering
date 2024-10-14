import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/screens/order/widgets/loadorders.dart';

import '../../models/order.dart';
import '../../screen_widgets/progress.dart';
import '../../models/abstrscts/state_screen.dart';
import '../../models/abstrscts/bloccontainer.dart';
import '../../screen_widgets/centered_message.dart';
import '../../screen_models/order_screenmodels.dart';
import '../../screen_widgets/snackbar/snackbar_custom.dart';

class LoadedOrderState extends ScreenState {
  final List<Order> _orders;
  const LoadedOrderState(this._orders);
}

class FatalErrorOrderState extends ScreenState {
  final String _message;
  const FatalErrorOrderState(this._message);
}

List<Order> _orders = [];

class OrderCubit extends Cubit<ScreenState> {
  int clientId = 0;

  OrderCubit({required this.clientId}) : super(const InitScreenState());

  Future<void> load() async {
    try {
      emit(const LoadingScreenState());

      List<Order> orders = await OrderScreenModels().findAll(clientId);
      _orders = orders;

      emit(LoadedOrderState(orders));
    } on TimeoutException {
      emit(const FatalErrorOrderState("Servidor não responde!"));
    } catch (e) {
      emit(FatalErrorOrderState(e.toString()));
    }
  }

  void relaod(List<Order> orders) {
    emit(const LoadingScreenState());
    emit(LoadedOrderState(orders));
  }
}

class OrderContainer extends BlocContainer {
  final int clientId;

  const OrderContainer({
    super.key,
    required this.clientId,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            final cubit = OrderCubit(clientId: clientId);
            cubit.load();
            return cubit;
          },
        ),
        BlocListener<OrderCubit, ScreenState>(
          listener: (context, state) {
            if (state is FatalErrorOrderState) {
              snackBarCustomError(
                context: context,
                message: state._message,
              );
            }
          },
        )
      ],
      child: _OrderScreen(),
    );
  }
}

class _OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, ScreenState>(
      builder: (context, state) {
        if (state is InitScreenState || state is LoadingScreenState) {
          return const Progress();
        }

        if (state is LoadedOrderState) {
          return LoadOrders(orders: state._orders);
        }

        return const CenteredMessage(
          'Unknow error',
          icon: Icons.error_outline,
        );
      },
    );
  }
}
