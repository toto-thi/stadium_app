// ignore_for_file: prefer_const_constructors, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadium_app/features/firebase_auth/data/models/user_model.dart';
import 'package:stadium_app/features/firebase_auth/domain/entities/user_entity.dart';
import 'package:stadium_app/features/firebase_auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:stadium_app/widget/base_widget/loadingScreen.dart';

class SettingPage extends StatefulWidget {
  final String uid;
  const SettingPage({Key? key, required this.uid}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: FutureBuilder<UserEntity?>(
          future: getUserById(widget.uid),
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Something went wrong ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              final user = snapshot.data;

              return user == null
                  ? Center(child: Text('No User'))
                  : _bodySettings(user);
            }
            return Center(
              child: buildLoadingScreen(),
            );
          }),
        ),
      ),
    );
  }

  _bodySettings(UserEntity user) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // profile container
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: _profileCard(user),
          ),

          //setting menu
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: _settingMenu(),
          ),

          //sign out button
          const SizedBox(height: 18.0),
          _signOutButton(),
        ],
      ),
    ));
  }

  _settingMenu() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            Text('General'),
            ListTile(
              leading: Icon(
                Icons.edit,
                color: Colors.green,
                size: 32,
              ),
              title: Text('Manage Football Field'),
            ),
            ListTile(
              leading: Icon(
                Icons.manage_accounts,
                color: Colors.green,
                size: 32,
              ),
              title: Text('Edit Account'),
            )
          ],
        ),
      ),

      //field owner permission
      //1. edit football field detail
      //4. edit profile

      //member permission
      //1. edit profile
    );
  }

  _profileCard(UserEntity user) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      //profile pic on the right
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //profile pic
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    'assets/images/default-profile.png',
                    height: 150.0,
                  ),
                ),

                //role under profile
                Text(
                  '${user.role}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // firstname + surname on the left
                  Text(
                    '${user.firstName} ${user.surName}',
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),

                  //email under name and surname
                  Text(
                    '${user.email}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _signOutButton() {
    return GestureDetector(
      onTap: () => context.read<AuthCubit>().loggedOut(),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: const Center(
          child: Text(
            'Sign Out',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Future<UserEntity?> getUserById(String uid) async {
    final userCollection =
        FirebaseFirestore.instance.collection("users").doc(uid);
    final snapShot = await userCollection.get();

    if (snapShot.exists) {
      return UserModel.fromSnapshot(snapShot);
    }
  }
}
