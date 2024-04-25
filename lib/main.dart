import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusa_application/services/supabase_config.dart';
import 'package:rusa_application/ui/pages/pages.dart';
import 'package:rusa_application/utils/password_hash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://sqnywjbvbtreaptmhjbh.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNxbnl3amJ2YnRyZWFwdG1oamJoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTEzNzUzMDksImV4cCI6MjAyNjk1MTMwOX0.5tPuJlpaCJSMBV1JdGbo0MsW-Dee39xd1RmXS7bB_Rs',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}
