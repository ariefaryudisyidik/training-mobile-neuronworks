import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:sekolahku/data/local/database/database_provider.dart';
import 'package:sekolahku/data/model/user.dart';

class RegisterScreen extends StatefulWidget {
  static const route = '/registerScreen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _hidePassword = true;
  bool _hideConfirmPassword = true;

  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3))
        .then((value) => {FlutterNativeSplash.remove()});
  }

  @override
  Widget build(BuildContext context) {
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
              obscureText: _hidePassword,
              controller: _passwordController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                      _hidePassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() {
                    _hidePassword = !_hidePassword;
                  }),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              obscureText: _hideConfirmPassword,
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Confirm Password',
                suffixIcon: IconButton(
                  icon: Icon(
                      _hidePassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() {
                    _hideConfirmPassword = !_hideConfirmPassword;
                  }),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Register'),
              onPressed: () {
                if (_usernameController.text.isEmpty ||
                    _passwordController.text.isEmpty ||
                    _confirmPasswordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Field tidak boleh kosong'),
                    ),
                  );
                  return;
                } else if (_passwordController.text.length < 8) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Password minimal 8 karakter'),
                    ),
                  );
                  return;
                } else if (_passwordController.text !=
                    _confirmPasswordController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Password tidak sesuai'),
                    ),
                  );
                  return;
                } else {
                  final user = User(
                    username: _usernameController.text,
                    password: _passwordController.text,
                  );

                  Provider.of<DatabaseProvider>(context, listen: false)
                      .insertUser(user);

                  Navigator.of(context).pop();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Berhasil mendaftar')),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Sudah punya akun? ',
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: 'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[900],
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
