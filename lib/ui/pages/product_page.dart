part of 'pages.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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
      child: Column(
        children: [
          
        ],
      ),
    );
  }
}
