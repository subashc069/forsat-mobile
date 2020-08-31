import 'package:flutter/material.dart';
import 'package:forsat/presentation/auth/account_page.dart';
import 'package:forsat/presentation/favourites/favourites_page.dart';
import 'package:forsat/presentation/forum/questions_page.dart';
import 'package:forsat/presentation/opportunities/opportunities_page.dart';
import 'package:forsat/values/branding_color.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  List<Widget> _screens = [
    OpportunitiesPage(),
    QuestionsPage(),
    FavouritesPage(),
    AccountPage()
  ];
  int _selectedIndex = 0;
  void _onPageChanged(int pageIndex) {
    setState(() {
      _selectedIndex = pageIndex;
    });
  }

  void _onItemTapped(int itemIndex) {
    _pageController.jumpToPage(itemIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _screens,
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                title: Text(
                  "Opportunities",
                  style: TextStyle(
                      color: _selectedIndex == 0 ? brandingColor : Colors.grey),
                ),
                icon: Icon(Icons.home,
                    color: _selectedIndex == 0 ? brandingColor : Colors.grey)),
            BottomNavigationBarItem(
                title: Text(
                  "Forum",
                  style: TextStyle(
                      color: _selectedIndex == 1 ? brandingColor : Colors.grey),
                ),
                icon: Icon(Icons.chat,
                    color: _selectedIndex == 1 ? brandingColor : Colors.grey)),
            BottomNavigationBarItem(
                title: Text(
                  "Favourites",
                  style: TextStyle(
                      color: _selectedIndex == 2 ? brandingColor : Colors.grey),
                ),
                icon: Icon(Icons.favorite,
                    color: _selectedIndex == 2 ? brandingColor : Colors.grey)),
            BottomNavigationBarItem(
                title: Text(
                  "Account",
                  style: TextStyle(
                      color: _selectedIndex == 3 ? brandingColor : Colors.grey),
                ),
                icon: Icon(Icons.person,
                    color: _selectedIndex == 3 ? brandingColor : Colors.grey)),
          ]),
    );
  }
}
