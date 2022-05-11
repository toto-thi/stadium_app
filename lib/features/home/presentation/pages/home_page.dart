import 'package:flutter/material.dart';
import 'package:stadium_app/widget/home_widget/custom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Stadium'),
        centerTitle: true,
      ),
      body: const Center(child: Text('This is Home Page')),
      bottomNavigationBar: const CusNavBar(),
    );
  }
}
