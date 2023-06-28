import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Container(
        height: 70,
        child: TabBar(
          controller: _tabController, // Assign the TabController
          indicatorWeight: 3,
          labelColor: Colors.lightBlueAccent,
          indicatorColor: Colors.lightBlueAccent,
          unselectedLabelColor: Colors.white,
          labelStyle: TextStyle(fontSize: 15),
          tabs: [
            Tab(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.add_alert_rounded,
                size: 30,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
