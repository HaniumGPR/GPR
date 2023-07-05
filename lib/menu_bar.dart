import 'package:flutter/material.dart';

// navigation bar

// TODO
// 탭 클릭 시 페이지 이동

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

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
      color: Colors.black26,
      height: 65,
      child: TabBar(
        controller: _tabController, // Assign the TabController
        indicatorWeight: 3,
        labelColor: Colors.blue,
        indicatorColor: Colors.blue,
        unselectedLabelColor: Colors.black,
        labelStyle: TextStyle(fontSize: 15),
        tabs: [
          // 탭 구성
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
              Icons.person,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
