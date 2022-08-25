import 'package:flutter/material.dart';
import 'package:frocrypto/view/pages/empty_page.dart';
import 'package:frocrypto/view/pages/home_page.dart';
import 'package:frocrypto/view/pages/learn_page.dart';
import 'package:frocrypto/view/pages/setting_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  final _screenOption = [
    const HomePage(),
    const EmptyPage(),
    const EmptyPage(),
  ];

  final _itemsBar = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.menu_book_rounded),
      label: 'Learn',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Setting',
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
      bottomNavigationBar: BottomNavigationBar(
        items: _itemsBar,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
