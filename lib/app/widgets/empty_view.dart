

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nft_flutter/app/module/brand_details/item/item_brand_collection.dart';
import 'package:nft_flutter/common/extensions/ex_string.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';
import 'package:nft_flutter/common/index.dart';
import 'package:nft_flutter/common/widgets/image_x.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key, this.icon, this.title, this.iconHeight, this.minHeight});

  final String? icon;
  final String? title;
  final double? iconHeight;
  final double? minHeight;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageX(
            type: ImageType.asset,
            image: icon ?? 'icon_empty.png'.imagePath,
            height:iconHeight ??  130.w,
          ),
          (title ?? '这里是空的').contentText,
        ],
      ),
    ).constrained(minHeight: minHeight ?? 0.95.sw);
  }
}
