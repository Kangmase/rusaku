part of 'pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //method yang pertama kali dijalankan
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  //Pengecekan sudah login atau belum
  Future<void> _redirect() async {
    // await for for the widget to mount
    await Future.delayed(Durations.extralong2);

    //pengecekan session
    final session = supabase.auth.currentSession;
    if (session == null) {
      Get.to(SignInPage());
    } else {
      Get.to(MainPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/logo_splash.png",
                height: 150,
              ),
            )
          ],
        ),
      ),
    );
  }
}
