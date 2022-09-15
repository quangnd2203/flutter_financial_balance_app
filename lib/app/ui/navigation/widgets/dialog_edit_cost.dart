import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_valid.dart';

class DialogEditCost extends StatelessWidget {
  DialogEditCost({Key? key, required this.costItem}) : super(key: key);

  final Map<String, dynamic> costItem;
  final GlobalKey<FormState> formKey = GlobalKey();

  late final TextEditingController nameController = TextEditingController(text: '${costItem['name']}');
  late final TextEditingController percentController = TextEditingController(text: '${costItem['percent']}');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          child: Form(
            key: formKey,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: buildNameInput(),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: 70,
                          child: buildAmountInput(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.check),
                            label: const Text('Done'),
                            onPressed: () {
                              if(formKey.currentState!.validate())
                                Get.back(result: <String, dynamic>{
                                  'name': nameController.text,
                                  'percent': double.tryParse(percentController.text) ?? 0,
                                });
                            },
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(8),
                                minimumSize: const Size(double.infinity, 40),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999))),
                          ),
                        ),
                        const SizedBox(width: 16,),
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.close),
                            label: const Text('Close'),
                            onPressed: () => Get.back(),
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(8),
                                backgroundColor: Colors.red,
                                minimumSize: const Size(double.infinity, 40),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999))),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNameInput() {
    final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    );
    return TextFormField(
      controller: nameController,
      validator: AppValid.validateRequired(),
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
      borderRadius: BorderRadius.circular(8),
    );
    return TextFormField(
      controller: percentController,
      validator: AppValid.validateRequired(),
      textAlign: TextAlign.right,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        border: border,
        suffixText: '%',
        contentPadding: const EdgeInsets.all(8),
        enabledBorder: border.copyWith(borderSide: border.borderSide.copyWith(width: 1.5)),
      ),
    );
  }
}
