part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchContainer = TextEditingController();
    return Scaffold(
      body: 
        ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //HEADER
                Container(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/banner.png'),
                          fit: BoxFit.fill),
                      color: mainColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 3,
                            blurRadius: 15,
                            color: Colors.black45)
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 6,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                width: 13,
                                height: 18,
                                padding: EdgeInsets.only(left: 12),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/location.png'),
                                        fit: BoxFit.fill)),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "Blimbing, Malang",
                                style: blackFontStyle3,
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                //Search
                GFSearchBar(
                  searchBoxInputDecoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    prefixIcon: Icon(Icons.search),
                    hintStyle: greyFontStyle,
                    hintText: "Mau cari barang apa hari ini?",
                  ),
                  searchList: [],
                  searchQueryBuilder: (query, list) {
                    return [];
                  },
                  overlaySearchListItemBuilder: (item) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'item',
                        style: const TextStyle(fontSize: 18),
                      ),
                    );
                  },
                  onItemSelected: (item) {},
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    "Kategori",
                    style: blackBoldFontStyle2,
                  ),
                ), //List Product
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/furniture.png",
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                                Text("FURNITURE", style: blackFontStyle4)
                              ],
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/mobil.png",
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                                Text("OTOMOTIF", style: blackFontStyle4)
                              ],
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/jasa.png",
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                                Text("JASA", style: blackFontStyle4)
                              ],
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/motor.png",
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                                Text("MOTOR", style: blackFontStyle4)
                              ],
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "assets/elektronik.png",
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                                Text("ELEKTRONIK", style: blackFontStyle4)
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        "Produk Terbaru",
                        style: blackBoldFontStyle2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Text(
                        "Lihat Semua",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: Wrap(
                      //Horizontal
                      spacing: 15,
                      //Vertical
                      runSpacing: 15,
                      children: [
                        ProductCard(mockProduct),
                        ProductCard(mockProduct2),
                        ProductCard(mockProduct3),
                        ProductCard(mockProduct4),
                        ProductCard(mockProduct5),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
    );
  }
}
