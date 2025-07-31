import 'package:flutter/material.dart';
import 'main.dart'; // Make sure Athlead() is defined in main.dart

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.transparent,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFF2E2E2E),
          border: OutlineInputBorder(),
        ),
      ),
      home: const RegisterPage(),
    );
  }
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, -0.7),
              end: Alignment(0.5, 1.0),
              colors: [
                Color(0xFF525832),
                Color(0xFF282A18),
                Color(0xFF1D1D1D),
              ],
            ),
          ),
          child: const SafeArea(
            child: _RegisterPanel(),
          ),
        ),
      ),
    );
  }
}

class _RegisterPanel extends StatefulWidget {
  const _RegisterPanel();

  @override
  State<_RegisterPanel> createState() => _RegisterPanelState();
}

class _RegisterPanelState extends State<_RegisterPanel> {
  final _formKey = GlobalKey<FormState>();

  final _fullName = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _age = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();

  @override
  void dispose() {
    for (final c in [_fullName, _username, _password, _age, _phone, _email]) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 380),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Create Account',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 24),
                    _buildText('Full name', _fullName),
                    _buildText('Username', _username),
                    _buildText(
                      'Password',
                      _password,
                      obscure: true,
                      keyboard: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password required';
                        }
                        if (!RegExp(
                            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{6,}$')
                            .hasMatch(value)) {
                          return 'Password must include uppercase, lowercase, number, special char';
                        }
                        return null;
                      },
                    ),
                    _buildText(
                      'Age',
                      _age,
                      keyboard: TextInputType.number,
                      validator: (v) =>
                      (v == null || v.isEmpty) ? 'Age required' : null,
                    ),
                    _buildText(
                      'Phone number',
                      _phone,
                      keyboard: TextInputType.phone,
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Phone required';
                        if (!RegExp(r'^\d{10}$').hasMatch(v)) {
                          return 'Enter a 10-digit number';
                        }
                        return null;
                      },
                    ),
                    _buildText(
                      'Email',
                      _email,
                      keyboard: TextInputType.emailAddress,
                      validator: (v) => (v == null || !v.contains('@'))
                          ? 'Enter a valid email'
                          : null,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Only navigate if form is valid
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Athlead()),
                            );
                          }
                        },
                        child: const Text('REGISTER'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText(
      String label,
      TextEditingController ctrl, {
        TextInputType keyboard = TextInputType.text,
        bool obscure = false,
        String? Function(String?)? validator,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: ctrl,
        keyboardType: keyboard,
        obscureText: obscure,
        decoration: InputDecoration(labelText: label),
        validator: validator ?? (v) => (v == null || v.isEmpty) ? 'Required' : null,
      ),
    );
  }
}

