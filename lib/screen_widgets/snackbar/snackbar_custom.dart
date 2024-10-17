import 'package:flutter/material.dart';

import 'src/content_typre.dart';
import 'src/snackbar_content.dart';

snackBarCustom({
  required BuildContext context,
  required String title,
  required String message,
  required ContentType contentType,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: SnackBarContent(
            message: message,
            contentType: contentType,
          )),
    );
}

snackBarCustomError({
  required BuildContext context,
  required String message,
}) {
  snackBarCustom(
      context: context,
      title: 'Erro',
      message: 'Algo deu errado: ${message}',
      contentType: ContentType.failure);
}

snackBarCustomSucess({
  required BuildContext context,
  required String message,
}) {
  snackBarCustom(
      context: context,
      title: 'Sucesso',
      message: message,
      contentType: ContentType.success);
}

snackBarCustomWarning({
  required BuildContext context,
  required String message,
}) {
  snackBarCustom(
      context: context,
      title: 'Atenção',
      message: message,
      contentType: ContentType.warning);
}
