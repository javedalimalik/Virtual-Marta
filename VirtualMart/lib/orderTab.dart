import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hoja/OrderPages/completed.dart';
import 'package:hoja/OrderPages/inProgress.dart';
import 'OrderPages/new.dart';


class CustomSliverAppbar extends StatefulWidget {
  @override
  _CustomSliverAppbarState createState() => _CustomSliverAppbarState();
}

class _CustomSliverAppbarState extends State<CustomSliverAppbar>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text(
                "Order Dashboard",
              ),
              centerTitle: true,
              pinned: true,
              floating: true,
              bottom: TabBar(
                  indicatorColor: Colors.green,
                  labelPadding: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  controller: _tabController,
                  tabs: [
                    Text(" New "),
                    Text("In Progress"),
                    Text("Completed"),
                  ]),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            newOrderScreen(),
            InProgressScreen(),
            CompletedOrderScreen(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

