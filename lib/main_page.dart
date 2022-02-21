import 'package:flutter/material.dart';
import 'package:layout_test/layout_type.dart';
import 'package:layout_test/pages/home_page.dart';
import 'package:layout_test/pages/page_view_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  LayoutGroup _layoutGroup = LayoutGroup.nonScrollable;
  final LayoutType _layoutSelection1 = LayoutType.homeView;
  final LayoutType _layoutSelection2 = LayoutType.pageView;
  LayoutType get _layoutSelection => _layoutGroup == LayoutGroup.nonScrollable ? _layoutSelection1 : _layoutSelection2;

  void _onLayoutGroupToggle() {
    setState(() {
      _layoutGroup = _layoutGroup == LayoutGroup.nonScrollable ? LayoutGroup.scrollable : LayoutGroup.nonScrollable;
    });
  }

  void _onLayoutSelected(LayoutType selection) {
    setState(() {
      selection = _layoutGroup == LayoutGroup.nonScrollable ? _layoutSelection1 : _layoutSelection2;
    });
  }

  void _onSelectTab(int index) {
    if(_layoutGroup == LayoutGroup.nonScrollable) {
      _onLayoutSelected(LayoutType.values[index]);
    } else {
      _onLayoutSelected(LayoutType.values[index + 2]);
    }
  }

  Color _colorTabMatching({LayoutType? layoutSelection}) {
    if(_layoutGroup == LayoutGroup.nonScrollable) {
      return _layoutSelection1 == layoutSelection ? Colors.orange : Colors.green;
    } else {
      return _layoutSelection2 == layoutSelection ? Colors.orange : Colors.green;
    }
  }

  BottomNavigationBarItem _buildItem({IconData? icon, LayoutType? layoutSelection}) {
    String text = layoutNames[layoutSelection].toString();
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(layoutSelection: layoutSelection),
      ),
      label: text,
    );
  }

  Widget _buildBody() {
    return <LayoutType, WidgetBuilder>{
      LayoutType.homeView: (_) => HomePage(layoutGroup: _layoutGroup, onLayoutToggle: _onLayoutGroupToggle),
      LayoutType.pageView: (_) => PageViewPage(layoutGroup: _layoutGroup, onLayoutToggle: _onLayoutGroupToggle),
    }[_layoutSelection]!(context);
  }

  Widget _buildBottomNavigationBar() {
    if(_layoutGroup == LayoutGroup.nonScrollable) {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          _buildItem(
            icon: Icons.view_headline, layoutSelection: LayoutType.homeView,
          ),
          _buildItem(
            icon: Icons.view_headline, layoutSelection: LayoutType.homeOtherView,
          ),
        ],
        onTap: _onSelectTab,
      );
    } else {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          _buildItem(
            icon: Icons.view_week, layoutSelection: LayoutType.pageView,
          ),
          _buildItem(
            icon: Icons.view_week, layoutSelection: LayoutType.listView,
          ),
        ],
        onTap: _onSelectTab,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

}