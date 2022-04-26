import 'package:flutter/material.dart';
import 'package:stadium_app/core/utils/constants.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'service_locator.dart' as sl;
import 'core/utils/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'NotoSansLao',
      ),
      onGenerateRoute: CusRouter.generateRoute,
      initialRoute: LOGIN_ROUTE,
    );
  }
}


