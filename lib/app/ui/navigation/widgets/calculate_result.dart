import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_text_styles.dart';
import '../../../utils/app_utils.dart';

class CalculateResult extends StatelessWidget {
  const CalculateResult({Key? key, required this.remainder, required this.costItems, }) : super(key: key);

  final double remainder;
  final List<Map<String, dynamic>> costItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kết quả tính toán"),
        centerTitle: true,
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios), color: Colors.white, splashRadius: 20, iconSize: 20,),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List<Widget>.generate(costItems.length, (int index) => buildResultItem(costItems[index])) + <Widget>[
            if(remainder > 0)
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Số tiền còn lại', style: AppTextStyles.normalBold.copyWith(fontSize: 18, color: Colors.red),),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(AppUtils.numberFormat(remainder), style: AppTextStyles.normalBoldBlack.copyWith(fontSize: 20, color: Colors.red),),
                ],
              )
          ],
        ),
      ),
    );
  }

  Widget buildResultItem(Map<String, dynamic> item){
    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text('${item['name']}', style: AppTextStyles.normalBold.copyWith(fontSize: 16),),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(AppUtils.numberFormat(item['money']), style: AppTextStyles.normalBoldBlack.copyWith(fontSize: 18),),
          ],
        ),
      ),
    );
  }
}
