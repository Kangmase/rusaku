part of '../pages/pages.dart';

class ProductImage extends StatefulWidget {
  const ProductImage({
    super.key,
    required this.imageUrl,
  });

  final String? imageUrl;

  @override
  _ProductImageState createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.imageUrl == null || widget.imageUrl!.isEmpty)
          Container(
            width: 80,
            height: 80,
            color: Colors.grey,
            child: const Center(
              child: Text('No Image'),
            ),
          )
        else
          Image.network(
            widget.imageUrl!,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
      ],
    );
  }
}
