import 'package:flutter/material.dart';
import 'package:frocrypto/view/pages/markets_page.dart';
import 'package:frocrypto/view/pages/learns_page.dart';
import 'package:frocrypto/view/pages/settings_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  final _screenOption = [
    const HomePage(),
    const LearnPage(),
    const SettingPage(),
  ];

  final _itemsBar = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.stacked_line_chart),
      label: 'Markets',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.menu_book_rounded),
      label: 'Learns',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screenOption,
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: BottomNavigationBar(
          selectedFontSize: 12.0,
          iconSize: 20,
          items: _itemsBar,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
