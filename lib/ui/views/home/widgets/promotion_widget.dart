import 'package:flutter/material.dart';
import 'package:organic_market/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeViewPromotion extends ViewModelWidget<HomeViewModel> {
  const HomeViewPromotion({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
        padding: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.only(top: 8),
        height: MediaQuery.of(context).size.height * 0.26,
        child: GridView.builder(
          padding: const EdgeInsets.all(2),
          physics: const ScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: viewModel.promotion.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              mainAxisExtent:
                  MediaQuery.of(context).size.width.toDouble() * 0.46),
          itemBuilder: (context, index) {
            return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(viewModel.promotion[index]['image'] ??
                          "assets/images/TRAVEL.png"),
                      fit: BoxFit.cover,
                    )));
          },
        ));
  }
}
