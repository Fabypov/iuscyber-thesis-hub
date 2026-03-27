import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login_page.dart';
import 'home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'https://emldijbveniwinontciu.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVtbGRpamJ2ZW5pd2lub250Y2l1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQ2MTk2MjcsImV4cCI6MjA5MDE5NTYyN30.YAICDDGykSmGVeIXxZBQ3gNNe2AxXXN4T5-KzMZ9270',
  );

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Auth',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1E1E1E),
        primaryColor: const Color(0xFF00C8F8),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF00C8F8),
          secondary: const Color(0xFF00C8F8),
        ),
      ),
      home: const AuthGate(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: supabase.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        
        // Check if there is a session
        final session = snapshot.data?.session;
        if (session != null) {
          return const HomePage();
        }
        
        return const LoginPage();
      },
    );
  }
}
