import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sekolahku/data/local/database/database_provider.dart';
import 'package:sekolahku/data/model/student.dart';
import 'package:sekolahku/ui/screens/detail_screen.dart';
import 'package:sekolahku/ui/screens/form_screen.dart';
import 'package:sekolahku/ui/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:sekolahku/ui/screens/login_screen.dart';
import 'package:sekolahku/ui/screens/register_screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DatabaseProvider(),
      child: MaterialApp(
        title: 'SekolahKu',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.indigo[900],
            secondary: Colors.orange[300],
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.route,
        routes: {
          LoginScreen.route: (context) => const LoginScreen(),
          RegisterScreen.route: (context) => const RegisterScreen(),
          HomeScreen.route: (context) => const HomeScreen(),
          FormScreen.route: (context) => FormScreen(
              student: ModalRoute.of(context)?.settings.arguments as Student?),
          DetailScreen.route: (context) => DetailScreen(
              student: ModalRoute.of(context)?.settings.arguments as Student),
        },
      ),
    );
  }
}
