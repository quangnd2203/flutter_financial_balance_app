import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_text_styles.dart';

class CalculateResult extends StatelessWidget {
  const CalculateResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kết quả tính toán"),
        centerTitle: true,
        leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios), color: Colors.white, splashRadius: 20, iconSize: 20,),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            buildResultItem(),
            buildResultItem(),
            buildResultItem(),
            buildResultItem(),
            buildResultItem(),
            buildResultItem(),
            buildResultItem(),
          ],
        ),
      ),
    );
  }

  Widget buildResultItem(){
    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text("Khoản chi 1", style: AppTextStyles.normalBold.copyWith(fontSize: 16),),
            ),
            const SizedBox(
              width: 15,
            ),
            Text('6,000,000', style: AppTextStyles.normalBoldBlack.copyWith(fontSize: 18),),
          ],
        ),
      ),
    );
  }
}
