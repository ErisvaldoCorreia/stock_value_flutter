import 'package:flutter/material.dart';
import 'package:stock_value/common.dart';
import 'package:stock_value/home_page.dart';
import 'package:stock_value/signup_page.dart';
import 'package:stock_value/start_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://gjyweqtxnaelrfwopopi.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdqeXdlcXR4bmFlbHJmd29wb3BpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQ4NDY3MDksImV4cCI6MjAyMDQyMjcwOX0.U6Run5EuUZJn_zf4SXnQdchOCpIHfEIvz_5NuE8Tw_w');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Value',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/start',
      routes: {
        '/start': (context) => const MyWidget(),
        '/signup': (context) => const SignUpPage()
      },
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  User? _user;

  @override
  void initState() {
    _getAuth();
    super.initState();
  }

  Future<void> _getAuth() async {
    setState(() {
      _user = client.auth.currentUser;
    });
    client.auth.onAuthStateChange.listen((event) {
      setState(() {
        _user = event.session?.user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _user == null ? const StartPage() : const HomePage(),
    );
  }
}
