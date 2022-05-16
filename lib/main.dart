import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stadium_app/core/utils/constants.dart';
import 'package:stadium_app/features/firebase_auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:stadium_app/features/firebase_auth/presentation/cubit/user/user_cubit.dart';
import 'package:stadium_app/features/firebase_auth/presentation/page/sing_in_page.dart';
import 'package:stadium_app/features/home/presentation/pages/home_page.dart';
import 'package:stadium_app/firebase_options.dart';
import 'package:stadium_app/service_locator.dart';
import 'service_locator.dart' as di;
import 'core/utils/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider(
          create: (_) => sl<UserCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'NotoSansLao',
        ),
        onGenerateRoute: OnGenerateRoute.route,
        initialRoute: SIGN_IN_ROUTE,
        // routes: {
        //   "/": (context) {
        //     return BlocBuilder<AuthCubit, AuthState>(
        //         builder: (context, authState) {
        //       if (authState is AuthLoading) {
        //         return const Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       } else if (authState is Authenticated) {
        //         return const HomePage();
        //       } else if (authState is UnAuthenticated) {
        //         return const SignInPage();
        //       }

        //       return const CircularProgressIndicator();
        //     });
        //   }
        // },
      ),
    );
  }
}
