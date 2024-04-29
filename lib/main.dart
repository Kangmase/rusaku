import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusa_application/ui/pages/pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    // TODO: Replace credentials with your own
    url: 'https://qsajgiqwxfwsepeijsyj.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFzYWpnaXF3eGZ3c2VwZWlqc3lqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM5Mjg0ODcsImV4cCI6MjAyOTUwNDQ4N30.oJXw2OmGAum0OIavtvDvaKiJs51ReTb8DFm-uSKBvfE',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
