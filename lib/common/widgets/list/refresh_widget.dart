import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:nft_flutter/app/data/all_bindings.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';


mixin RefreshWidget {
  final EasyRefreshController refreshController =
  EasyRefreshController(controlFinishRefresh: true,
    controlFinishLoad: false,);

  int pageNum = 1;

  buildWidget({required Widget child}) {
    return EasyRefresh(
      header: const ClassicHeader(
        clamping: true,
        showMessage: false,
        showText: false,
        dragText: '下拉刷新',
        armedText: '松开刷新',
        readyText: '刷新中',
        processingText: '刷新中',
        processedText: 'Succeeded',
        noMoreText: 'No more',
      ),
      footer: const ClassicFooter(

        showMessage: false,
        showText: false,
        dragText: 'Pull to load',
        armedText: 'Release ready',
        readyText: 'Loading...',
        processingText: 'Loading...',
        processedText: 'Succeeded',
        noMoreText: 'No more',
        failedText: 'Failed',
        messageText: 'Last updated at %T',
        noMoreIcon: Text('no more')
      ),
      controller: refreshController,
      onRefresh: () {
        pageNum = 1;
        onRefresh();
      },
      // onLoad: () {
      //   pageNum += 1;
      //   onLoading();
      // },
      child: child,
    );
  }

  void onRefresh();

  // void onLoading();

  Future<void> didRefresh(bool isNoData) async {
    refreshController.finishRefresh(IndicatorResult.success);
    refreshController.resetFooter();
    // if (!isNoData) {
    //   refreshController.finishRefresh(IndicatorResult.success);
    // } else {
    //   refreshController.finishRefresh(IndicatorResult.success);
    //   refreshController.finishLoad(IndicatorResult.noMore);
    // }
  }

  Future<void> didLoadMore(bool isNoData) async {

    if (!isNoData) {
      refreshController.finishLoad(IndicatorResult.success);
    } else {
      refreshController.finishLoad(IndicatorResult.noMore);
    }
  }
}