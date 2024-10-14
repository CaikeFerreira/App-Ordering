import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/screen_widgets/progress.dart';
import 'package:front_end/models/abstrscts/bloccontainer.dart';
import 'package:front_end/screen_widgets/centered_message.dart';
import 'package:front_end/screen_models/product_screenmodels.dart';
import 'package:front_end/screen_widgets/snackbar/snackbar_custom.dart';

import 'widgets/load_product.dart';
import '../../models/product.dart';
import '../../screen_widgets/search_field.dart';
import '../../models/abstrscts/state_screen.dart';

class LoadedProductState extends ScreenState {
  final List<Product> _products;
  const LoadedProductState(this._products);
}

class FatalErrorProductState extends ScreenState {
  final String _message;
  const FatalErrorProductState(this._message);
}

List<Product> _products = [];

class ProductCubit extends Cubit<ScreenState> {
  int clientTypeId = 0;

  ProductCubit({required this.clientTypeId}) : super(const InitScreenState());

  Future<void> load() async {
    try {
      emit(const LoadingScreenState());

      List<Product> products =
          await ProductScreenModels().findAll(clientTypeId);
      _products = products;

      emit(LoadedProductState(products));
    } on TimeoutException {
      emit(const FatalErrorProductState("Servidor não responde!"));
    } catch (e) {
      emit(FatalErrorProductState(e.toString()));
    }
  }

  void relaod(List<Product> products) {
    emit(const LoadingScreenState());
    emit(LoadedProductState(products));
  }
}

class ProductContainer extends BlocContainer {
  final int clientTypeId;

  const ProductContainer({
    super.key,
    required this.clientTypeId,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            final cubit = ProductCubit(clientTypeId: clientTypeId);
            cubit.load();
            return cubit;
          },
        ),
        BlocListener<ProductCubit, ScreenState>(
          listener: (context, state) {
            if (state is FatalErrorProductState) {
              snackBarCustomError(
                context: context,
                message: state._message,
              );
            }
          },
        )
      ],
      child: _ProductScreen(),
    );
  }
}

class _ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<ProductCubit, ScreenState>(
          builder: (context, state) {
            if (state is InitScreenState || state is LoadingScreenState) {
              return const Progress();
            }

            if (state is LoadedProductState) {
              return LoadProduct(context, state._products);
            }

            return const CenteredMessage(
              'Unknow error',
              icon: Icons.error_outline,
            );
          },
        ),
        SearchField(
          onChanged: _findProduct,
        ),
      ],
    );
  }
}

void _findProduct(BuildContext context, String text) {
  List<Product> products = [];

  if (text.isEmpty) {
    products = _products;
    context.read<ProductCubit>().relaod(products);
    return;
  }

  text = text.trim().toUpperCase();

  if (int.tryParse(text) != null) {
    products = _products
        .where(
          (product) => product.ean.toString().trim().contains(text),
        )
        .toList();
  } else {
    products = _products
        .where((product) => product.name.trim().toUpperCase().contains(text))
        .toList();
  }

  context.read<ProductCubit>().relaod(products);
}
