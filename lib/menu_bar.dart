import 'package:flutter/material.dart';
//import 'package:hanium_gpr/main_page.dart';
//import 'package:hanium_gpr/my_cart.dart';

// navigation bar

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [MainPage(), MyCart(), MainPage()],
      ),
      bottomNavigationBar: Container(
          color: Colors.black26,
          height: 65,
          child: Column(
            children: [
              TabBar(
                controller: _tabController, // Assign the TabController
                indicatorWeight: 3,
                labelColor: Colors.blue,
                indicatorColor: Colors.blue,
                unselectedLabelColor: Colors.black,
                labelStyle: TextStyle(fontSize: 15),
                onTap: _onItemTapped,
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
            ],
          )),
    );
    */
    return Container(
        color: Colors.black26,
        height: 65,
        child: Column(
          children: [
            //_buildTapView(),
            TabBar(
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
          ],
        ));
  }
}
