import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'TabPages/profile.dart';
import 'orderTab.dart';
import 'productTab.dart';


class tbScreen extends StatefulWidget {
  tbScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _tbScreenState createState() => _tbScreenState();
}

class _tbScreenState extends State<tbScreen> with TickerProviderStateMixin {
  MotionTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = MotionTabController(initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MotionTabBar(
          labels: [
            "Products","Orders","profile"
          ],
          initialSelectedTab: "Orders",
          tabIconColor: Colors.green,
          tabSelectedColor: Colors.red,
          onTabItemSelected: (int value){
            print(value);
            setState(() {
              _tabController.index = value;
            });
          },
          icons: [
            Icons.menu,Icons.business_center,Icons.account_circle
          ],
          textStyle: TextStyle(color: Colors.red),
        ),
        body: MotionTabBarView(
          controller: _tabController,
          children: <Widget>[
            productTab(),
            CustomSliverAppbar(),
            ProfileScreen(),
          ],
        ));
  }
}