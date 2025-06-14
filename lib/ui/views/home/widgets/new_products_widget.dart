import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/views/home/home_viewmodel.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stacked/stacked.dart';

import '../../../common widgets/item_card.dart';

class HomeViewNewProductWidget extends ViewModelWidget<HomeViewModel> {
  const HomeViewNewProductWidget({super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Text(
                "All Products",
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
            ),
            const Spacer(),
            (viewModel.itemList.length > 9)
                ? GestureDetector(
                    onTap: () => viewModel.toProductpage(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "See All",
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.green)),
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
            height: 300.px,
            child: GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: viewModel.itemList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(2.0),
                child: InkWell(
                  onTap: () =>
                      viewModel.openProductSheet(viewModel.itemdata(index)),
                  child: Itemcard(
                    addtocart: () => viewModel.addToCart(
                        viewModel.itemdata(index).id,
                        viewModel.itemdata(index).title,
                        context),
                    changedPrice: viewModel.itemdata(index).changedPrice!,
                    sale: viewModel.itemdata(index).isOnSale!,
                    imageUrl: viewModel.itemdata(index).imageUrl,
                    price: viewModel.itemdata(index).price,
                    quantity: viewModel.itemdata(index).quantity,
                    quantitytype: viewModel.itemdata(index).quantityType,
                    title: viewModel.itemdata(index).title,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
