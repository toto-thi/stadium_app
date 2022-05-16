import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:stadium_app/features/firebase_auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:stadium_app/features/firebase_auth/presentation/page/sing_in_page.dart';
import 'package:stadium_app/features/home/presentation/pages/home_page.dart';
import 'package:stadium_app/features/settings/presentation/pages/setting_page.dart';
import 'package:stadium_app/widget/base_widget/loadingScreen.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  // ignore: prefer_final_fields
  final _widgetOptions = [
    // homepage
    BlocBuilder<AuthCubit, AuthState>(
      builder: (context, authState) {
        if (authState is AuthLoading) {
          return buildLoadingScreen();
        } else if (authState is Authenticated) {
          return HomePage(
            uid: authState.uid,
          );
        }
        return const SignInPage();
      },
    ),
    const Text('ຄົ້ນຫາ'),
    const Text('ລາຍການຈອງ'),
    
    const SettingPage(uid: 'fdasdf'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _bottomNav(),
    );
  }

  _bottomNav() {
    return Scaffold(
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
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
