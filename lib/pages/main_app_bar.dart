import 'package:flutter/material.dart';
import 'package:layout_test/layout_type.dart';

class MainAppBar extends AppBar {
  MainAppBar({Key? key,
    LayoutGroup? layoutGroup,
    LayoutType? layoutType,
    PreferredSize? bottom,
    VoidCallback? onLayoutToggle,
  }) : super(key: key,
    leading: IconButton(
        onPressed: onLayoutToggle,
        icon: Icon(layoutGroup == LayoutGroup.nonScrollable ? Icons.filter_1 : Icons.filter_2),
    ),
    title: Text(layoutNames[layoutType].toString()),
    elevation: 1.0,
    bottom: bottom,
  );
}