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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(4.0),
          child: Text(
            "Categories",
            style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
              height: screenWidth(context) * 0.5,
              child: ListView.builder(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemExtent: screenWidth(context) * 0.42,
                itemCount: viewModel.categoryList().length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => viewModel
                        .tap(viewModel.categorydata(index).id as String),
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
