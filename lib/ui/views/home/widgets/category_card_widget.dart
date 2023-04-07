import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

import '../home_viewmodel.dart';

class Categorycard extends ViewModelWidget<HomeViewModel> {
  final String categoryName;
  final String imagePath;

  const Categorycard(
      {super.key, required this.categoryName, required this.imagePath});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SizedBox(
      child: Card(
        color: Colors.white10,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  categoryName,
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.17,
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // image: DecorationImage(
                    //   image: AssetImage(imagePath),
                    //   fit: BoxFit.fill,
                    // ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imagePath,
                    height: MediaQuery.of(context).size.height * 0.17,
                    width: MediaQuery.of(context).size.width * 0.35,
                    placeholder: (context, url) => Shimmer.fromColors(
                      child: Container(
                        color: Colors.grey.shade300,
                      ),
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.white,
                      direction: ShimmerDirection.ttb,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
