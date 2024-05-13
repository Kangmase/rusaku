part of 'models.dart';

class Product {
  final String? id;
  final String? profileId;
  final String? picturePath;
  final String? name;
  final String? description;
  final bool? isFree;
  final bool? isBarter;
  final int? price;
  final int? quantity;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? location;
  final bool isMine;

  Product(
      {this.id,
      this.profileId,
      this.picturePath,
      this.name,
      this.isFree,
      this.isBarter,
      this.description,
      this.price,
      this.quantity,
      this.createdAt,
      this.updatedAt,
      this.location,
      required this.isMine});

  Product.fromMap({
    required Map<String, dynamic> map,
    required String myUserId,
  })  : id = map['id'],
        profileId = map['profile_id'],
        name = map['name'],
        picturePath = map['photo_url'],
        price = map['price'],
        quantity = map['quantity'],
        description = map['description'],
        isFree = map['is_free'],
        isBarter = map['is_barter'],
        createdAt = DateTime.parse(map['created_at']),
        updatedAt = DateTime.parse(map['updated_at']),
        location = map['description'],
        isMine = myUserId == map['profile_id'];
}

Product mockProduct = Product(
    id: '1',
    picturePath: "assets/keramik.png",
    name: "Kramik Motif Coklat",
    description: "",
    price: 123,
    isMine: true,
    profileId: '2',
    createdAt: DateTime(2024),
    isBarter: true,
    isFree: true,
    location: 'test',
    quantity: 2,
    updatedAt: DateTime(2024),
    );

Product mockProduct2 = Product(
    id: '2',
    picturePath: "assets/cat.png",
    name: "Cat Pargon 1/2 L",
    description:
        "Daging (biasanya sih, ayam kalau di kondangan) yang dibakar dengan bumbu kecap dan kacang ini menempati posisi pertama hidangan yang paling diincar saat kondangan",
    price: 123,
    isMine: true,
    profileId: '2',
    createdAt: DateTime(2024),
    isBarter: true,
    isFree: true,
    location: 'test',
    quantity: 2,
    updatedAt: DateTime(2024),);

Product mockProduct3 = Product(
    id: '3',
    picturePath: "assets/kayu.png",
    name: "Kayu Ulin Bekas",
    description:
        "Daging (biasanya sih, ayam kalau di kondangan) yang dibakar dengan bumbu kecap dan kacang ini menempati posisi pertama hidangan yang paling diincar saat kondangan",
    price: 123,
    isMine: true,
    profileId: '2',
    createdAt: DateTime(2024),
    isBarter: true,
    isFree: true,
    location: 'test',
    quantity: 2,
    updatedAt: DateTime(2024),);

Product mockProduct4 = Product(
    id: '4',
    picturePath: "assets/laptop.png",
    name: "Laptop Hp N123",
    description:
        "Daging (biasanya sih, ayam kalau di kondangan) yang dibakar dengan bumbu kecap dan kacang ini menempati posisi pertama hidangan yang paling diincar saat kondangan",
    price: 123,
    isMine: true,
    profileId: '2',
    createdAt: DateTime(2024),
    isBarter: true,
    isFree: true,
    location: 'test',
    quantity: 2,
    updatedAt: DateTime(2024),);

Product mockProduct5 = Product(
    id: '5',
    picturePath: "assets/keramik.png",
    name: "Kramik",
    description:
        "Daging (biasanya sih, ayam kalau di kondangan) yang dibakar dengan bumbu kecap dan kacang ini menempati posisi pertama hidangan yang paling diincar saat kondangan",
    price: 123,
    isMine: true,
    profileId: '2',
    createdAt: DateTime(2024),
    isBarter: true,
    isFree: true,
    location: 'test',
    quantity: 2,
    updatedAt: DateTime(2024),);
