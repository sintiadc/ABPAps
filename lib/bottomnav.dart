import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home.dart'; // Pastikan untuk mengimpor home.dart
import 'recipes.dart';
import 'calories.dart';
import 'create.dart';

class HomeNav extends StatefulWidget {
  final int userId; // Tambahkan parameter userId

  const HomeNav({Key? key, required this.userId}) : super(key: key);

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      Home(userId: widget.userId), // Berikan userId ke Home
      Recipes(), // Berikan userId ke Recipes
      Calories(), // Berikan userId ke Calories
      Create(), // Berikan userId ke Create
    ];
  }

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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        tabBorderRadius: 15,
        activeColor: Colors.white,
        color: Colors.black,
        backgroundColor: const Color(0xFF6C7E46),
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
