// ignore_for_file: use_key_in_widget_constructors, flutter_style_todos

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constants/app_text_styles.dart';
import '../ui.dart';
import '../widgets/formatters/number_input_formatter.dart';
import 'widgets/calculate_result.dart';
import 'widgets/cost_item.dart';

class NavigationScreen extends BaseScreen<NavigationController> {
  @override
  Widget? builder() {
    // TODO: implement builder
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(top: 50),
            child: buildTop(),
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(thickness: 1.5),
          buildCostItems(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: ElevatedButton(
              onPressed: () => Get.to(const CalculateResult()),
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
              child: const Text('Tính toán'),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCostItems() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
              const Text(
                'Lưu ý: Tổng số % không thể quá 100%',
                style: TextStyle(color: Colors.red),
              ),
              const SizedBox(
                height: 16,
              ),
            ] +
            const <Widget>[
              CostItem(),
              CostItem(),
              CostItem(),
            ] +
            <Widget>[
              const SizedBox(
                height: 8,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () => null,
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(8),
                      minimumSize: const Size(100, 50),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                  child: const Text('Thêm khoản chi', style: TextStyle(decoration: TextDecoration.underline, fontSize: 16),),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(thickness: 1.5),
            ],
      ),
    );
  }

  Widget buildTop() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(child: buildInput()),
            const SizedBox(
              width: 15,
            ),
            ElevatedButton(
              onPressed: () => null,
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                  minimumSize: const Size(100, 60),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
              child: const Text('Xác nhận số tiền'),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          'Số tiền của bạn là: 600,000,000',
          style: AppTextStyles.normalBoldBlack.copyWith(color: Colors.blue),
        )
      ],
    );
  }

  Widget buildInput() {
    final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
    );
    return TextField(
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        NumberInputFormatter(),
      ],
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        border: border,
        enabledBorder: border.copyWith(borderSide: border.borderSide.copyWith(width: 1.5)),
        hintText: 'Nhập số tiền',
      ),
    );
  }
}
