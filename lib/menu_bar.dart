import 'package:flutter/material.dart';
import 'package:hanium_gpr/main_page/main_page.dart';
import 'package:hanium_gpr/cart_page/my_cart.dart';
import 'package:hanium_gpr/mypage.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    } else if (index == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyCart()));
    } else if (index == 2) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyPage()));
    } else if (index == 3) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black26,
        height: 60,
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
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
              onTap: _handleTabChange,
            ),
          ],
        ));
  }
}
