part of 'pages.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Menggunakan GetX untuk menavigasi ke halaman home setelah splash screen
    Future.delayed(Duration(seconds: 1), () {
      Get.off(PasswordHash());
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset("assets/logo_splash.png",height: 150,),
            )
          ],
        ),
      ),
    );
  }
}
