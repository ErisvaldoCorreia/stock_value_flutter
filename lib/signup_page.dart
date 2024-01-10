import 'package:flutter/material.dart';
import 'package:stock_value/common.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _signUpLoading = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();
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
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Plese repeat your password';
                  }
                  if (_passwordController.text !=
                      _repeatPasswordController.text) {
                    return 'Passwords are different! Please check';
                  }
                  return null;
                },
                controller: _repeatPasswordController,
                decoration:
                    const InputDecoration(label: Text('Confirm Password')),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _signUpLoading
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
                          _signUpLoading = true;
                        });

                        try {
                          await client.auth.signUp(
                              email: _emailController.text,
                              password: _passwordController.text);

                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Success on create account',
                                style: TextStyle(color: Colors.black)),
                            backgroundColor: Colors.greenAccent,
                          ));
                          setState(() {
                            _signUpLoading = false;
                          });
                        } catch (e) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Create account failed'),
                            backgroundColor: Colors.redAccent,
                          ));
                          setState(() {
                            _signUpLoading = false;
                          });
                        }
                      },
                      child: const Text(
                        'Create your account',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Handle your login',
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
