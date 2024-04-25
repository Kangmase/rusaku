part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool _isObscure = true;
  bool _isLoading = false;
  Icon _passwordIcon = const Icon(Icons.visibility);

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Register',
      subtitle: 'Rukun Sesama',
      onBackButtonPressed: () {
        Get.to(SignInPage());
      },
      child: Column(
        children: [
          Container(
            width: 110,
            height: 110,
            margin: EdgeInsets.only(top: 26),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/photo_border.png'))),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/avatar.png'),
                      fit: BoxFit.cover)),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'Nama',
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
              controller: _nameController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Masukkan nama lengkap'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'Email',
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
              controller: _emailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Contoh : contoh@gmail.com'),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              'No. Hp',
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
              controller: _phoneNumberController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Contoh : 082312xxx'),
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
                controller: _passwordController,
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
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              'Konfirmasi Password',
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
                controller: _confirmPasswordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Ketik ulang password',
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
            child: ElevatedButton(
              onPressed: () async {
                final getEmail = await SupabaseConfig.supabase
                    .from('users')
                    .select('email')
                    .eq('email', _emailController.text.trim());
                final getPhoneNumber = await SupabaseConfig.supabase
                    .from('users')
                    .select('no_hp')
                    .eq('no_hp', _phoneNumberController.text.trim());
                if (getEmail.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('email sudah terdaftar')));
                } else if (getPhoneNumber.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Np Hp sudah terdaftar')));
                } else {
                  Get.to(AddressPage());
                }
                log("responseEmail:  $getEmail");
                log("responsePhoneNumber:  $getPhoneNumber");
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: Text(
                'Lanjutkan',
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
