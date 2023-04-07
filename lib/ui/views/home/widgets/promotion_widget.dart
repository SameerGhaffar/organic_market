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
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: const EdgeInsets.all(5.0),
          margin: const EdgeInsets.only(top: 8),
          height: MediaQuery.of(context).size.height * 0.26,
          child: GridView.builder(
            padding: const EdgeInsets.all(2),
            physics: const ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.promtoionlist().length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                mainAxisExtent:
                    MediaQuery.of(context).size.width.toDouble() * 0.46),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12)),
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
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              );
            },
          )),
    );
  }
}
