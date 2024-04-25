import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig{
  static late SupabaseClient supabase;

  static Future<void> init() async {
    await Supabase.initialize(
      url: 'https://sqnywjbvbtreaptmhjbh.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNxbnl3amJ2YnRyZWFwdG1oamJoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTEzNzUzMDksImV4cCI6MjAyNjk1MTMwOX0.5tPuJlpaCJSMBV1JdGbo0MsW-Dee39xd1RmXS7bB_Rs',
    );
    supabase = Supabase.instance.client;
  }
}
