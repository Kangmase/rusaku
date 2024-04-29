part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isLoading = false;
  final session = supabase.auth.currentSession;

  Future<void> _signOut() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await supabase.auth.signOut();
      Get.to(SignInPage());
    } on AuthException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (_) {
      context.showErrorSnackBar(message: unexpectedErrorMessage);
    }
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return session == null
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child:
                      Text('Anda belum Login, Silahkan login terlebih dahulu')),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(SignInPage());
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
                  )),
            ],
          )
        : Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 230,
                    decoration: BoxDecoration(
                        color: "E5E5E5".toColor(),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 3,
                              color: Colors.black45)
                        ]),
                    child: Column(
                      children: [
                        Container(
                          width: 110,
                          height: 110,
                          margin: EdgeInsets.only(top: 26),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/photo_border.png'))),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('assets/avatar.png'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 11),
                            child: Text(
                              "Angga Risky",
                              style: blackBoldFontStyle2,
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 11),
                            child: Text(
                              "angga@gmail.com",
                              style: greyFontStyle,
                            ))
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 100, left: 16, right: 16),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: "E5E5E5".toColor(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: Row(
                            children: [
                              Icon(LineIcons.user, color: mainColor),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Ubah Profile",
                                style: blackFontStyle2,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 16, right: 16),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        height: 70,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: "E5E5E5".toColor(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          onPressed: () {
                            Get.to(ProductPage());
                          },
                          child: Row(
                            children: [
                              Icon(
                                LineIcons.boxOpen,
                                color: mainColor,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Produk Saya",
                                style: blackFontStyle2,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 16, right: 16),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: "E5E5E5".toColor(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: Row(
                            children: [
                              Icon(LineIcons.shoppingBasket, color: mainColor),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Transaksi",
                                style: blackFontStyle2,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15, left: 16, right: 16),
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            _signOut();
                            Get.to(SignInPage());
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: "E5E5E5".toColor(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: Row(
                            children: [
                              Icon(Icons.logout, color: mainColor),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Log Out",
                                style: blackFontStyle2,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          );
  }
}
