import 'package:flutter/material.dart';

import '../constants/attributes.dart';

class Amount extends StatefulWidget {
  final TextEditingController controller;
  final Function(num count)? alterAmount;

  const Amount({super.key, required this.controller, this.alterAmount});
  @override
  State<Amount> createState() => _AmountState();
}

class _AmountState extends State<Amount> {
  num _count = 0;

  _AmountState();

  void _checkAmount() {
    var count = num.tryParse(widget.controller.text);
    if (count != null) {
      _count = count;
    }
  }

  void _updateAmount() {
    widget.controller.text = _count.toString();
  }

  void _alterAmount() {
    if (widget.alterAmount != null) widget.alterAmount!(_count);
  }

  void _incrementCount() {
    setState(() {
      _checkAmount();
      _count++;
      _updateAmount();
      _alterAmount();
    });
  }

  void _decrementCount() {
    setState(() {
      _checkAmount();
      if (_count >= 1) {
        _count--;
      } else if (_count > 0) {
        _count -= _count;
      }
      _updateAmount();
      _alterAmount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          IconButton(
            color: Theme.of(context).primaryColor,
            iconSize: 13,
            onPressed: _decrementCount,
            icon: const Icon(Icons.remove),
          ),
          SizedBox(
            width: 30,
            child: TextField(
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 15, left: 2.5),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(defaultRadiusBorder),
                  ),
                ),
              ),
              controller: widget.controller,
              keyboardType: TextInputType.number,
              onChanged: (text) {
                setState(() {
                  _checkAmount();
                  if (_count > 0) _alterAmount();
                });
              },
            ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
            iconSize: 13,
            onPressed: _incrementCount,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
