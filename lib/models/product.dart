part of 'models.dart';

class Product {
  final int? id;
  final String? picturePath;
  final String? name;
  final String? description;
  final String? ingredients;
  final String? price;
  final String? location;
  final double? rate;

  Product(
      {this.id,
      this.picturePath,
      this.name,
      this.description,
      this.ingredients,
      this.price,
      this.location,
      this.rate});
}

Product mockProduct = Product(
    id: 1,
    picturePath: "assets/keramik.png",
    name: "Kramik Motif Coklat",
    description:
        "",
    ingredients: "",
    price: "Barter",
    location: "Singosari, Malang",
    rate: 4.2);

Product mockProduct2 = Product(
    id: 2,
    picturePath: "assets/cat.png",
    name: "Cat Pargon 1/2 L",
    description:
        "Daging (biasanya sih, ayam kalau di kondangan) yang dibakar dengan bumbu kecap dan kacang ini menempati posisi pertama hidangan yang paling diincar saat kondangan",
    ingredients: "Daging ayam, jangan daging Babi",
    price: "Gratis",
    location: "Tidar, Malang",
    rate: 4.2);

Product mockProduct3 = Product(
    id: 3,
    picturePath: "assets/kayu.png",
    name: "Kayu Ulin Bekas",
    description:
        "Daging (biasanya sih, ayam kalau di kondangan) yang dibakar dengan bumbu kecap dan kacang ini menempati posisi pertama hidangan yang paling diincar saat kondangan",
    ingredients: "Daging ayam, jangan daging Babi",
    price: "Gratis",
    location: "Singosari, Malang",
    rate: 4.2);

Product mockProduct4 = Product(
    id: 4,
    picturePath: "assets/laptop.png",
    name: "Laptop Hp N123",
    description:
        "Daging (biasanya sih, ayam kalau di kondangan) yang dibakar dengan bumbu kecap dan kacang ini menempati posisi pertama hidangan yang paling diincar saat kondangan",
    ingredients: "Daging ayam, jangan daging Babi",
    price: "Rp. 1.500.000 (Nego)",
    location: "Singosari, Malang",
    rate: 4.2);

Product mockProduct5 = Product(
    id: 5,
    picturePath: "assets/keramik.png",
    name: "Kramik",
    description:
        "Daging (biasanya sih, ayam kalau di kondangan) yang dibakar dengan bumbu kecap dan kacang ini menempati posisi pertama hidangan yang paling diincar saat kondangan",
    ingredients: "Daging ayam, jangan daging Babi",
    price: "30000",
    location: "Singosari, Malang",
    rate: 4.2);
