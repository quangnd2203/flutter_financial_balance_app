import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../utils/app_utils.dart';
import '../ui.dart';
import 'widgets/calculate_result.dart';
import 'widgets/dialog_edit_cost.dart';

class NavigationController extends BaseController {

  int index = 1;

  RxInt money = 0.obs;

  RxList<Map<String, dynamic>> costItems = <Map<String, dynamic>>[].obs;

  final TextEditingController moneyController = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
  }


  Future<void> openDialogSettingCost(Map<String, dynamic> costItem) async {
    final Map<String, dynamic>? _ = await Get.dialog(DialogEditCost(costItem: costItem,));
    if(_ != null){
      final int offset = costItems.indexOf(costItem);
      costItems[offset] = _;
    }
  }

  Future<void> deleteCost(Map<String, dynamic> costItem) async {
    costItems.remove(costItem);
  }

  void addCostItem(){
    costItems.add(<String, dynamic>{
      'name': 'Khoản chi $index',
      'percent': double.parse('0'),
    });
    index+=1;
  }

  void submitMoney(){
    final String text = moneyController.text.replaceAll(',', '');
    money.value = int.tryParse(text) ?? 0;
  }

  void submitCalculate(){
    double totalPercent = 0;
    double totalMoney = 0;
    final List<Map<String, dynamic>> result = costItems.map<Map<String, dynamic>>((Map<String, dynamic> e){
      double percent = double.parse(e['percent'].toString());
      totalPercent += percent;
      e['money'] = money.value * percent / 100;
      totalMoney += double.parse(e['money'].toString());
      return e;
    }).toList();

    if(totalPercent > 100){
      AppUtils.toast('Tổng số phần trăm quá 100%');
    }else{
      Get.to(CalculateResult(
        remainder: money.value - totalMoney,
        costItems: result,
      ));
    }
  }
}
