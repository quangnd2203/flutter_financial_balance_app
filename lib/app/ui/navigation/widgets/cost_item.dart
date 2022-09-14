import 'package:flutter/material.dart';

import '../../widgets/formatters/number_input_formatter.dart';

class CostItem extends StatelessWidget {
  const CostItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 8,
              child: buildNameInput(),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 2,
              child: buildAmountInput(),
            ),
            const SizedBox(
              width: 8,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => null,
              color: Colors.red,
              icon: const Icon(Icons.remove_circle),
              splashRadius: 20,
              iconSize: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNameInput() {
    final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
    );
    return TextField(
      decoration: InputDecoration(
        border: border,
        contentPadding: const EdgeInsets.all(8),
        enabledBorder: border.copyWith(borderSide: border.borderSide.copyWith(width: 1.5)),
        hintText: 'Khoản chi',
      ),
    );
  }

  Widget buildAmountInput() {
    final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
    );
    return TextField(
      textAlign: TextAlign.center,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        border: border,
        contentPadding: const EdgeInsets.all(8),
        enabledBorder: border.copyWith(borderSide: border.borderSide.copyWith(width: 1.5)),
        hintText: '%',
      ),
    );
  }
}
