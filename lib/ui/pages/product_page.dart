part of 'pages.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late final Stream _productsStream;
  final Map<String, Profile> _profileCache = {};
  final session = supabase.auth.currentSession;

  @override
  void initState() {
    if (session != null) {
      final myUserId = supabase.auth.currentUser!.id;
      _productsStream = supabase
          .from('products')
          .stream(primaryKey: ['id'])
          .eq('profile_id', myUserId)
          .order('created_at');
    }
    super.initState();
  }

  Future<void> _loadProfileCache(String profileId) async {
    if (_profileCache[profileId] != null) {
      return;
    }
    final data =
        await supabase.from('profiles').select().eq('id', profileId).single();
    final profile = Profile.fromMap(data);
    setState(() {
      _profileCache[profileId] = profile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Produk',
      subtitle: 'List Produk',
      onBackButtonPressed: () {
        Navigator.pop(context);
      },
      floatingActionButton: FloatingActionButton(
          backgroundColor: greyColor,
          shape: CircleBorder(),
          onPressed: () {
            Get.to(AddProductPage());
          },
          child: Icon(Icons.add)),
      child: session == null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                        'Anda belum Login, Silahkan login terlebih dahulu')),
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
          : StreamBuilder(
              stream: _productsStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.done ||
                    snapshot.connectionState == ConnectionState.active) {
                  log(snapshot.data.toString());
                  if (snapshot.hasData) {
                    final products = snapshot.data!;
                    // return Text(products[0]['name']);
                    return Container(
                      height: 400,
                      child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          Product product = Product.fromMap(
                              map: products[index],
                              myUserId: products[index]['profile_id']);
                          return _ProductCard(
                            product: product,
                            profile: _profileCache[product.profileId],
                          );
                        },
                      ),
                    );
                  } else {
                    return preloader;
                  }
                }
                return Text('error');
              },
            ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    Key? key,
    required this.product,
    required this.profile,
  }) : super(key: key);

  final Product product;
  final Profile? profile;

  @override
  Widget build(BuildContext context) {
    List<Widget> productContents = [
      Flexible(
        child: Container(
          width: double.infinity,
          height: 100,
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            color: "CBDDFB".toColor(),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              if (product.picturePath == null)
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey,
                  child: const Center(
                    child: Text('No Image'),
                  ),
                )
              else
                ProductImage(imageUrl: product.picturePath!),
              SizedBox(
                width: defaultMargin,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name!,
                    style: blackFontStyle1,
                  ),
                  Text(
                    product.description!.toString(),
                    style: blackFontStyle2,
                  ),
                  Text(
                    product.quantity!.toString(),
                    style: blackBoldFontStyle2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: productContents,
      ),
    );
  }
}
