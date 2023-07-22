import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/common/ui_helpers.dart';
import 'package:organic_market/ui/views/home/home_viewmodel.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class HomeViewPromotion extends ViewModelWidget<HomeViewModel> {
  const HomeViewPromotion({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            "Offers & Promotions",
            style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
        ),
        Container(
            width: screenWidth(context) * 0.98,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            height: screenHeight(context) * 0.30,
            child: GridView.builder(
              padding: const EdgeInsets.all(2),
              physics: const ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: viewModel.promtoionlist().length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 4,
                  mainAxisExtent: screenWidth(context) * 0.48),
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl:
                          viewModel.promotionImage(index).ImageUrl as String,
                      placeholder: (context, url) => Shimmer.fromColors(
                        child: Container(
                          color: Colors.grey,
                        ),
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.white,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  ),
                );
              },
            )),
      ],
    );
  }
}
