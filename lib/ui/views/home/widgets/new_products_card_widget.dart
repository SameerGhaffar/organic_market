import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class Itemcard extends StatelessWidget {
  final Function addtocart;
  final String imageUrl;
  final int quantity;
  final String quantitytype;
  final int price;

  final String title;
  const Itemcard({
    Key? key,
    required this.addtocart,
    required this.imageUrl,
    required this.quantity,
    required this.quantitytype,
    required this.price,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: CachedNetworkImage(
                  height: 155.4,
                  imageUrl: imageUrl,
                  placeholder: (context, url) => Shimmer.fromColors(
                    child: Container(
                      color: Colors.grey,
                    ),
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(title,
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.normal))),
                  ],
                )),
            Container(
              padding: const EdgeInsets.all(2),
              alignment: Alignment.centerRight,
              child: Text("$quantity" + quantitytype,
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.normal))),
            ),
            const Divider(
              color: Colors.black45,
              height: 1,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text("Rs.$price",
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold))),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () => addtocart(),
                  child: const Icon(
                    Icons.shopping_cart_checkout,
                    color: Colors.green,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
