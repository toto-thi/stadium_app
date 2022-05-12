import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadium_app/features/firebase_auth/presentation/cubit/auth/auth_cubit.dart';
// import 'package:stadium_app/widget/home_widget/custom_nav.dart';

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
      body: Center(child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return Column(
              children: [
                const Text('This is Home Page'),
                ElevatedButton(
                  onPressed: () => {
                    context.read<AuthCubit>().loggedOut(),
                  },
                  child: const Text('Sign Out'),
                )
              ],
            );
          }
          return const CircularProgressIndicator();
        },
      )),
      // bottomNavigationBar: const CusNavBar(),
    );
  }
}
