import 'package:flutter/material.dart';
import 'package:stock_value/common.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool _signinLoading = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Value'),
      ),
      body: Center(
          child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.graphic_eq_outlined,
                size: 70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Plese fill with your email address';
                  }
                  return null;
                },
                controller: _emailController,
                decoration: const InputDecoration(label: Text('E-mail')),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Plese fill with your password';
                  }
                  return null;
                },
                controller: _passwordController,
                decoration: const InputDecoration(label: Text('Password')),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _signinLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : TextButton(
                      onPressed: () async {
                        final isValid = _formKey.currentState?.validate();
                        if (isValid != true) {
                          return;
                        }
                        setState(() {
                          _signinLoading = true;
                        });

                        try {
                          await client.auth.signInWithPassword(
                              email: _emailController.text,
                              password: _passwordController.text);
                        } catch (e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Login Failed'),
                            backgroundColor: Colors.redAccent,
                          ));
                          setState(() {
                            _signinLoading = false;
                          });
                        }
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text(
                  'No have account? Sign Up',
                  style: TextStyle(fontSize: 12, color: Colors.black38),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
