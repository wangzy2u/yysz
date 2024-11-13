import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nft_flutter/app/data/global_service.dart';
import 'package:nft_flutter/common/extensions/ex_num.dart';
import 'package:nft_flutter/common/extensions/ex_widget.dart';

import '../../../../../common/index.dart';
import '../../../main_tab/bean/city_bean.dart';

class CityPicker extends StatefulWidget {
  const CityPicker({super.key, required this.dataList});

  final List<CityBean> dataList;

  @override
  State<CityPicker> createState() => _CityPickerState();
}

class _CityPickerState extends State<CityPicker> {
  List<Widget> selectTab = [];

// 解析后的数据
  List<CityBean> allData = [];
  List<CityBean> currentList = []; // 当前显示的列表内容
  String? currentParentCode = "0"; // 初始为顶级省的 parentCode

  // 当前选择的各级区域
  CityBean? selectedProvince;
  CityBean? selectedCity;
  CityBean? selectedDistrict;
  CityBean? selectedStreet;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.dataList.isNotEmpty) {
      parseJsonData();

      updateList();
    }
  }

  // 解析 JSON 数据
  void parseJsonData() {
    allData = widget.dataList;

    currentParentCode = allData.first.parent;
  }

  // 更新当前显示的列表
  void updateList() {
    currentList = widget.dataList
        .where((item) => item.parent == currentParentCode)
        .toList();
    setState(() {});
  }

  // 选择省、市、区、街道后的操作
  void selectItem(CityBean item) {
    selectTab.clear();
    switch (item.level) {
      case 1:
        selectedProvince = item;
        selectedCity = null;
        selectedDistrict = null;
        selectedStreet = null;

        selectTab.add(buildTitle(item));
        break;
      case 2:
        selectedCity = item;
        selectedDistrict = null;
        selectedStreet = null;

        selectTab.add(buildTitle(selectedProvince));
        selectTab.add(buildTitle(item));

        break;
      case 3:
        selectedDistrict = item;
        selectedStreet = null;

        selectTab.add(buildTitle(selectedProvince));
        selectTab.add(buildTitle(selectedCity));
        selectTab.add(buildTitle(item));

        break;
      case 4:
        selectedStreet = item;
        selectTab.add(buildTitle(selectedProvince));
        selectTab.add(buildTitle(selectedCity));
        selectTab.add(buildTitle(selectedDistrict));
        selectTab.add(buildTitle(item));
        break;
    }

    currentParentCode = item.code;

    if (item.level != 4) {
      updateList(); // 更新列表显示下一级内容
    }

    setState(() {});
  }


  void clickTab(CityBean item){

    print(  '${item.name} ${item.level}');


    selectTab.clear();
    switch (item.level) {
      case 1:
        selectedProvince = item;
        selectedCity = null;
        selectedDistrict = null;
        selectedStreet = null;

        selectTab.add(buildTitle(item));

        break;
      case 2:
        selectedCity = item;
        selectedDistrict = null;
        selectedStreet = null;

        selectTab.add(buildTitle(selectedProvince));
        selectTab.add(buildTitle(item));


        break;
      case 3:
        selectedDistrict = item;
        selectedStreet = null;

        selectTab.add(buildTitle(selectedProvince));
        selectTab.add(buildTitle(selectedCity));
        selectTab.add(buildTitle(item));



        break;
      case 4:
        selectedStreet = item;
        selectTab.add(buildTitle(selectedProvince));
        selectTab.add(buildTitle(selectedCity));
        selectTab.add(buildTitle(selectedDistrict));
        selectTab.add(buildTitle(item));


        break;
    }

    if(item.level == 1){
      currentParentCode = "0";
    }else{
      String? parentCode = allData
          .firstWhere((element) => element.code == item.parent).code;
      currentParentCode = parentCode;
    }


    if (item.level != 4) {
      updateList(); // 更新列表显示下一级内容
    }

    setState(() {});
  }


  buildTitle(CityBean? city) {
    if (city != null) {
      return Text(city.name ?? '').padding(right: 15.w).onTap((){

        clickTab(city);
        // selectItem(city);
      });
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: 2.skColor,
      height: 1.sw,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: selectTab,
              ),
              InkWell(
                onTap: (){
                  String result = '${selectedProvince?.name ?? ''}${selectedCity?.name ?? ''}${selectedDistrict?.name ?? ''}${selectedStreet?.name ?? ''}';

                  Get.back(result: result);
                },
                child: Text(
                  '确认',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: 0.skColor,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: currentList.length,
              itemBuilder: (context, index) {
                var item = currentList[index];

                return ListTile(
                  title: Text(
                    item.name ?? '',
                    style: TextStyle(color: buildColor(item)),
                  ),
                  onTap: () => selectItem(item),
                );
              },
            ),
          ),
        ],
      ),
    ).clipRRect(topRight: 16.w, topLeft: 16.w);
  }

  buildColor(CityBean item) {
    switch (item.level) {
      case 1:
        if (selectedProvince == null) {
          return 1.skColor;
        } else {
          if (item.name == selectedProvince?.name) {
            return 0.skColor;
          } else {
            return 1.skColor;
          }
        }
        break;
      case 2:
        if (selectedCity == null) {
          return 1.skColor;
        } else {
          if (item.name == selectedCity?.name) {
            return 0.skColor;
          } else {
            return 1.skColor;
          }
        }
        break;
      case 3:
        if (selectedDistrict == null) {
          return 1.skColor;
        } else {
          if (item.name == selectedDistrict?.name) {
            return 0.skColor;
          } else {
            return 1.skColor;
          }
        }
        break;
      case 4:
        if (selectedStreet == null) {
          return 1.skColor;
        } else {
          if (item.name == selectedStreet?.name) {
            return 0.skColor;
          } else {
            return 1.skColor;
          }
        }
        break;

      default:
        return 1.skColor;
    }
  }
}
