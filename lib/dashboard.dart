import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home.dart'; // Pastikan untuk mengimpor home.dart

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(), // Menambahkan Home sebagai halaman pertama
    Text('Favorite Page'),
    Text('Search Page'),
    Text('Settings Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: GNav(
        gap: 8,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        tabBorderRadius: 15,
        activeColor: Colors.white,
        color: Colors.black,
        backgroundColor: Color(0xFF6C7E46),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.book_rounded,
            text: 'Recipes',
          ),
          GButton(
            icon: Icons.calculate_rounded,
            text: 'Calories',
          ),
          GButton(
            icon: Icons.create,
            text: 'Create',
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: _onItemTapped,
      ),
    );
  }
}
