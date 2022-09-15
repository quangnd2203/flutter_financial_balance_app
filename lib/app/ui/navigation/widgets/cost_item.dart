import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_text_styles.dart';
import '../navigation.dart';

class CostItem extends StatelessWidget {

  const CostItem({Key? key, required this.item}) : super(key: key);

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 8,
              child: Text('${item['name']}', style: AppTextStyles.normalBoldBlack,),
            ),
            const SizedBox(
              width: 15,
            ),
            Text('${item['percent']} %', style: AppTextStyles.normalBold,),
            const SizedBox(
              width: 8,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => Get.find<NavigationController>().openDialogSettingCost(item),
              color: Colors.black,
              icon: const Icon(Icons.edit),
              splashRadius: 20,
              iconSize: 30,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => Get.find<NavigationController>().deleteCost(item),
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
}
