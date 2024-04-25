part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isObscure = true;
  bool _isLoading = false;
  Icon _passwordIcon = const Icon(Icons.visibility);

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Login',
      subtitle: 'Rukun Sesama',
      onBackButtonPressed: () {
        Get.to(MainPage());
      },
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 50),
              width: 200,
              child: Image(image: AssetImage("assets/logo_no_tag.png"))),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Username',
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: usernameController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Masukkan username'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Password',
              style: blackFontStyle2,
            ),
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black)),
              child: TextField(
                controller: passwordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Masukkan password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                        if (_isObscure) {
                          _passwordIcon = const Icon(Icons.visibility);
                        } else {
                          _passwordIcon = const Icon(
                            Icons.visibility_off,
                            color: Colors.blue,
                          );
                        }
                      });
                    },
                    icon: _passwordIcon,
                  ),
                ),
              )),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: _isLoading
                ? SpinKitFadingCircle(size: 45, color: mainColor)
                : ElevatedButton(
                    onPressed: () async {
                      final response = await SupabaseConfig.supabase
                          .from('users')
                          .select('*')
                          .eq('username', usernameController.text.trim())
                          .eq(
                              'password',
                              PasswordHash.generateSha1(
                                  passwordController.text.trim()));
                      if (response.isNotEmpty) {
                        Get.to(MainPage());
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Username / password salah')));
                      }
                      log("responseLogin:  $response");
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: _isLoading
                ? SpinKitFadingCircle(size: 45, color: mainColor)
                : ElevatedButton(
                    onPressed: () {
                      Get.to(SignUpPage());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: greyColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(
                      'Buat Akun',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
