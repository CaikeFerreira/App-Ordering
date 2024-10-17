import 'package:flutter/material.dart';

import '../constants/attributes.dart';

class SearchField extends StatelessWidget {
  final Function(BuildContext context, String text) onChanged;
  final TextEditingController _textSearch = TextEditingController();

  SearchField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _textSearch,
        textAlignVertical: TextAlignVertical.center,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          filled: true,
          hintText: "Pesquisa...",
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(defaultRadiusBorder),
            ),
          ),
          prefixIcon: IconButton(
            iconSize: 25,
            icon: const Icon(Icons.search),
            onPressed: () {
              onChanged(context, _textSearch.text);
            },
          ),
        ),
        onChanged: (String text) {
          onChanged(context, text);
        });
  }
}
