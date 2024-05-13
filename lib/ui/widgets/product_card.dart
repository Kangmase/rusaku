part of 'widgets.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 230,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(spreadRadius: 3, blurRadius: 15, color: Colors.black12)
          ]),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              image: DecorationImage(
                  image: AssetImage(product.picturePath!), fit: BoxFit.fill),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
            width: 180,
            child: Text(
              product.price.toString(),
              style: blackBoldFontStyle2,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(12, 0, 12, 6),
            width: 180,
            child: Text(
              product.name!,
              style: blackFontStyle3,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                  width: 11,
                  height: 15,
                  padding: EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/location.png'),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  width: 6,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                  width: 120,
                  child: Text(
                    product.location!,
                    style: blackFontStyle4,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
