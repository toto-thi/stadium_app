import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadium_app/features/firebase_auth/presentation/cubit/auth/auth_cubit.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Column(
          children: [
            const Text('This is Setting Page'),
            ElevatedButton(
            onPressed: () => {
              context.read<AuthCubit>().loggedOut(),
            },
            child: const Text('Sign Out'),
          )
          ],
        ),
      ),
    );
  }
}
