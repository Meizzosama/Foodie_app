import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}
class _TabsScreenState extends State<TabsScreen> {
   final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'label': 'Categories',
    },
    {
      'page': FavoritesScreen(),
      'label': 'Your Favorite',
    },];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
        title:
        Text(_pages[_selectedPageIndex]['label'] as String)
      ),
      drawer: MainDrawer(),
      body:
      _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.lightGreenAccent,
        unselectedItemColor: Colors.purple,
        selectedItemColor: Colors.teal,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category_sharp),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.star_purple500_outlined),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
