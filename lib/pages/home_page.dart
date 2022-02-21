import 'package:flutter/material.dart';
import 'package:layout_test/layout_type.dart';
import 'package:layout_test/pages/main_app_bar.dart';

class HomePage extends StatelessWidget implements HasLayoutGroup {

  @override
  final LayoutGroup layoutGroup;
  @override
  final VoidCallback onLayoutToggle;

  const HomePage({Key? key, required this.layoutGroup, required this.onLayoutToggle}) : super(key: key);

  Widget _buildPage({String? index, Color? color}) {
    return Container(
      alignment: AlignmentDirectional.center,
      color: color,
      child: Text(
        index!,
        style: const TextStyle(
          fontSize: 100.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return PageView(
      children: [
        _buildPage(index: 'Welcome!', color: Colors.green),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        layoutGroup: layoutGroup,
        layoutType: LayoutType.homeView,
        onLayoutToggle: onLayoutToggle,
      ),
      body: _buildPageView(),
    );
  }
}