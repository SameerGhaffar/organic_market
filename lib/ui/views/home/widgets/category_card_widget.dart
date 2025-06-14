import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/common/ui_helpers.dart';
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
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                categoryName,
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 18,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87)),
              ),
              verticalSpaceSmall,
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: CachedNetworkImage(
                  imageUrl: imagePath,
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.32,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white,
                    direction: ShimmerDirection.ttb,
                    child: Container(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
