import 'dart:async';
import 'package:get/get.dart';
import '../ui.dart';

class NavigationController extends BaseController {

  // RxList<TestModel> raw = <TestModel>[].obs;
  //
  // RxInt count = 0.obs;

  RxList<Map<String, dynamic>> costItems = <Map<String, dynamic>>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

}
