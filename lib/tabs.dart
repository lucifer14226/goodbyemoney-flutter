import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './pages/expenses.dart';
import './pages/reports.dart';
import './pages/add.dart';
import './pages/settings.dart';


class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _Navigation();
}

class _Navigation extends State<Navigation> with TickerProviderStateMixin {
  PageController pageController = PageController(
    initialPage: 0,
  );
  // late TabController _tabController;

  int _selectedIndex = 0;

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 10), curve: Curves.bounceIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (val) {
          onTapped(val);
        },
        children: const [
          // const MainChatScreen(),
          Expenses(),
          Reports(),
          Add(),
          Settings(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.tray_arrow_up),
              label: 'Expenses',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chart_bar_fill),
              label: 'Reports',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.add),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.gear_solid),
              label: 'Settings',
            ),
          ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: onTapped,
      ),
    );
  }
}
