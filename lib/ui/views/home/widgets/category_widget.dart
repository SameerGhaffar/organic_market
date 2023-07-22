import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/common/ui_helpers.dart';
import 'package:organic_market/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'category_card_widget.dart';

class HomeViewCategoryWidget extends ViewModelWidget<HomeViewModel> {
  const HomeViewCategoryWidget({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Text(
                "Categories",
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
            ),
            const Spacer(),
            (viewModel.categoryList().length > 6)
                ? GestureDetector(
                    onTap: () => null,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "See All",
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00BF63))),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black12.withOpacity(0.02),
              ),
              height: screenWidth(context) * 0.46,
              child: ListView.builder(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemExtent: screenWidth(context) * 0.42,
                itemCount: viewModel.categoryList().length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => viewModel.tap(
                        id: viewModel.categorydata(index).id as String,
                        name: viewModel.categorydata(index).name!),
                    child: Categorycard(
                        categoryName:
                            viewModel.categorydata(index).name as String,
                        imagePath:
                            viewModel.categorydata(index).imageUrl as String),
                  );
                },
              )),
        ),
      ],
    );
  }
}
