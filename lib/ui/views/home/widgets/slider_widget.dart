import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:organic_market/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class HomeViewMySlider extends ViewModelWidget<HomeViewModel> {
  const HomeViewMySlider({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            //   print(currentIndex);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CarouselSlider(
              items: viewModel
                  .image()
                  .map((imageurl) => CachedNetworkImage(
                        imageUrl: imageurl.ImageUrl as String,
                        placeholder: (context, url) => Shimmer.fromColors(
                          child: Container(),
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade300,
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ))
                  //  Image.network(
                  //   imageurl.Image as String
                  .toList(),
              carouselController: viewModel.carouselController,
              options: CarouselOptions(
                height: 210,
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                aspectRatio: 2,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  viewModel.updateindex(index);
                },
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: viewModel.image().asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () =>
                    viewModel.carouselController.animateToPage(entry.key),
                child: Container(
                  width: viewModel.currentIndex == entry.key ? 17 : 7,
                  height: 7.0,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 3.0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: viewModel.currentIndex == entry.key
                          ? Colors.white
                          : Colors.black),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
