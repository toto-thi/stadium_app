import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:stadium_app/features/home/presentation/pages/home_page.dart';
import 'package:stadium_app/features/settings/presentation/pages/setting_page.dart';

class CusNavBar extends StatefulWidget {
  const CusNavBar({Key? key}) : super(key: key);

  @override
  State<CusNavBar> createState() => _CusNavBarState();
}

class _CusNavBarState extends State<CusNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text('ຄົ້ນຫາ'),
    Text('ລາຍການຈອງ'),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(''),
        elevation: 0,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: Colors.greenAccent.shade400,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: GNav(
            padding: const EdgeInsets.all(12.0),
            gap: 8.0,
            backgroundColor: Colors.greenAccent.shade400,
            color: Colors.white,
            activeColor: Colors.grey.shade500,
            tabBackgroundColor: Colors.greenAccent.shade100,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'ໜ້າຫຼັກ',
              ),
              GButton(
                icon: Icons.search,
                text: 'ຄົ້ນຫາ',
              ),
              GButton(
                icon: Icons.my_library_books,
                text: 'ລາຍການຈອງ',
              ),
              GButton(
                icon: Icons.settings,
                text: 'ຕັ້ງຄ່າ',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) => _selectedIndex = index,
          ),
        ),
      ),
    );
  }
}
