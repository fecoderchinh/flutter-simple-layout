import 'package:flutter/foundation.dart';

enum LayoutGroup {
  nonScrollable,
  scrollable,
}

abstract class HasLayoutGroup {
  LayoutGroup get layoutGroup;
  VoidCallback get onLayoutToggle;
}

enum LayoutType {
  homeView,
  homeOtherView,
  pageView,
  listView,
}

Map<LayoutType, String> layoutNames = {
  LayoutType.homeView: 'Home',
  LayoutType.homeOtherView: 'Home Other',
  LayoutType.pageView: 'Page',
  LayoutType.listView: 'List',
};