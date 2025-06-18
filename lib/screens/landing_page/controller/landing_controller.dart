import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxInt selectedIndex = 0.obs;
  var selectedType = 0.obs;
  var selectedMonth = 0.obs;
  var hoveredIndex = (-1).obs;
  var isChecked = false.obs;
  var isChecked1 = false.obs;
  var isDonateSelected = false.obs;
  RxDouble selectedAmount = 50.0.obs;

  var isMonthly = true.obs;

  void selectMonthly() => isMonthly.value = true;
  void selectYearly() => isMonthly.value = false;

  void changeIndex(int index) {
    selectedIndex.value = index;
    isDonateSelected.value = false;
  }

  void setSelected(int index) {
    selectedType.value = index;
  }
  void setSelectedMonth(int index) {
    selectedMonth.value = index;
  }
}