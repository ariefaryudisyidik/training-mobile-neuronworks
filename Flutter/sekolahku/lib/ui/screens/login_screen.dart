import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:sekolahku/data/local/database/database_provider.dart';
import 'package:sekolahku/data/model/user.dart';
import 'package:sekolahku/ui/screens/home_screen.dart';
import 'package:sekolahku/ui/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/loginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3))
        .then((value) => {FlutterNativeSplash.remove()});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: ((context, provider, child) {
      return Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 64),
                child: Center(
                  child: CircleAvatar(
                    radius: 64,
                    backgroundImage: AssetImage('assets/images/sekolah.png'),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: _obscureText,
                controller: _passwordController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() {
                      _obscureText = !_obscureText;
                    }),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  final username = _usernameController.text;
                  final password = _passwordController.text;

                  if (username.isNotEmpty && password.isNotEmpty) {
                    provider.checkUser(username, password).then((value) {
                      if (value.toMap().isNotEmpty) {
                        Navigator.pushReplacementNamed(
                            context, HomeScreen.route);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Username atau Password salah'),
                          ),
                        );
                      }
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error)),
                      );
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Username atau Password tidak boleh kosong'),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 16),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Belum punya akun? ',
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: 'Register',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[900],
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () =>
                            Navigator.pushNamed(context, RegisterScreen.route),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
    }));
  }
}
