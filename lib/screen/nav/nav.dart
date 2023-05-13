import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knowitall/screen/home/home.dart';
import 'package:knowitall/screen/profile/profile.dart';
import 'package:knowitall/screen/screen.dart';

class Nav extends StatefulWidget {
  static String routeName = '/nav';

  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _currentIndex = 0;

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final _pages = [const HomeScreen(), const RatingScreen(), const ProfileScreen(), ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(0.0, 1.0))]
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: changePage,
          backgroundColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: Color(0xffa29f9d),
              ),
              activeIcon: Icon(
                Icons.home_rounded,
                color: Color(0xFF35363a),
              ),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.insert_chart_outlined_rounded,
                  color: Color(0xffa29f9d),
                ),
                activeIcon: Icon(Icons.insert_chart_rounded),
                label: 'Рейтинг'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_rounded,
                color: Color(0xffa29f9d),
              ),
              activeIcon: Icon(Icons.person_rounded),
              label: 'Профиль',
            ),
          ],
          selectedLabelStyle: GoogleFonts.nunito(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
          selectedItemColor: const Color(0xFF212121),
          unselectedLabelStyle: GoogleFonts.nunito(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
          unselectedItemColor: const Color(0xffa29f9d),
        ),
      ),
    );
  }
}
