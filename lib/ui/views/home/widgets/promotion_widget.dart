import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:organic_market/ui/views/home/home_viewmodel.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class HomeViewPromotion extends ViewModelWidget<HomeViewModel> {
  const HomeViewPromotion({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Center(
      child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(5.0),
          margin: const EdgeInsets.only(top: 8),
          height: MediaQuery.of(context).size.height * 0.40,
          child: GridView.builder(
            padding: const EdgeInsets.all(2),
            physics: const ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.promtoionlist().length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                mainAxisExtent:
                    MediaQuery.of(context).size.height.toDouble() * 0.35),
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
    );
  }
}
