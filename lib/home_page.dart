import 'package:flutter/material.dart';
import 'package:stock_value/common.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
            const Text('Welcome to Stock Value System!'),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextButton(
                  onPressed: () async {
                    client.auth.signOut();
                  },
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.red, fontSize: 18),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
