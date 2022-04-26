
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CusNavBar extends StatelessWidget {
  const CusNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent.shade400,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 16.0),
        child: GNav(
            padding: const EdgeInsets.all(16.0),
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
            ]),
      ),
    );
  }
}