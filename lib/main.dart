import 'package:flutter/material.dart';
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
      home: const Scaffold(),
    );
  }
}
