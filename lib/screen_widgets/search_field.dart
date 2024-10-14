import 'package:flutter/material.dart';
import 'package:front_end/constants/attributes.dart';

class SearchField extends StatelessWidget {
  final Function(BuildContext context, String text) onChanged;
  final TextEditingController _textSearch = TextEditingController();

  SearchField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      height: 50,
      child: TextField(
          controller: _textSearch,
          textAlignVertical: TextAlignVertical.bottom,
          style: Theme.of(context).textTheme.bodySmall,
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
              iconSize: 20,
              icon: const Icon(Icons.search),
              onPressed: () {
                onChanged(context, _textSearch.text);
              },
            ),
          ),
          onChanged: (String text) {
            onChanged(context, text);
          }),
    );
  }
}
