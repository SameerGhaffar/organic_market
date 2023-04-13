import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/common/textfied.dart';
import 'package:organic_market/ui/common/ui_helpers.dart';
import 'package:organic_market/ui/views/product/widget/itemcard.dart';
import 'package:stacked/stacked.dart';
import 'product_viewmodel.dart';

class ProductView extends StackedView<ProductViewModel> {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProductViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () => viewModel.keyboardDismiss(context),
      child: Scaffold(
          body: Center(
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            Column(
              children: [
                Form(
                  onChanged: () => viewModel.onChanged(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.white60,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 2,
                      child: TextWidget(
                        controller: viewModel.searchController,
                        eyepass: false,
                        hint: 'Search',
                        labeltext: 'Search Product',
                        keyboardtype: TextInputType.name,
                        prefixicon: Icons.search,
                        obscureText: false,
                        validator: (String? value) {
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                viewModel.show
                    ? GridView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: viewModel.searchList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.61,
                          crossAxisSpacing: 2.0,
                          mainAxisSpacing: 2.0,
                        ),
                        itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ProductItemcard(
                              addtocart: () => viewModel.addToCart(
                                  viewModel.searchdata(index).id,
                                  viewModel.searchdata(index).title,
                                  context),
                              imageUrl: viewModel.searchdata(index).imageUrl,
                              price: viewModel.searchdata(index).price,
                              quantity: viewModel.searchdata(index).quantity,
                              quantitytype:
                                  viewModel.searchdata(index).quantityType,
                              title: viewModel.searchdata(index).title,
                            )),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  top: screenHeight(context) * 0.3),
                              child: Center(
                                child: Text(
                                  "Search Products",
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          wordSpacing: 2,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green)),
                                ),
                              )),
                        ],
                      ),
              ],
            ),
          ],
        ),
      )),
    );
  }

  @override
  ProductViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProductViewModel();
  @override
  Future onViewModelReady(ProductViewModel viewModel) => viewModel.fetchData();
}
