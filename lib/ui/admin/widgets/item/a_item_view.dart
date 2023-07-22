import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/common/textfied.dart';
import 'package:organic_market/ui/common/ui_helpers.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

import 'a_item_viewmodel.dart';

class CategoryItemAdmin extends StackedView<CategoryItemAdminModel> {
  const CategoryItemAdmin({super.key});

  @override
  Widget builder(
      BuildContext context, CategoryItemAdminModel viewModel, Widget? child) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Item Tool",
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ))),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(4.px),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "Add Item Data",
                          style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                        ),
                      ),
                      InkWell(
                        onTap: () => viewModel.imagepick(),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: viewModel.isImagePicked
                                      ? Colors.green
                                      : Colors.black,
                                  width: 2)),
                          height: 200,
                          width: 200,
                          child: viewModel.image != null
                              ? Image.file(viewModel.image!.absolute)
                              : const Icon(Icons.image),
                        ),
                      ),
                      Form(
                        key: viewModel.formKey,
                        child: Column(
                          children: [
                            TextWidget(
                              focusNode: FocusNode(),
                              controller: viewModel.titleController,
                              keyboardtype: TextInputType.name,
                              validator: viewModel.titleValidator,
                              labeltext: "Item Title",
                              hint: "e.g Apple",
                              prefixicon: Icons.add_circle_sharp,
                              eyepass: false,
                              obscureText: false,
                            ),
                            TextWidget(
                              focusNode: FocusNode(),
                              controller: viewModel.descriptionController,
                              keyboardtype: TextInputType.name,
                              validator: viewModel.descriptionValidator,
                              labeltext: "Description",
                              hint: "e.g Apple is nice",
                              prefixicon: Icons.add_circle_sharp,
                              eyepass: false,
                              obscureText: false,
                            ),
                            TextWidget(
                              focusNode: FocusNode(),
                              hint: "1,2",
                              controller: viewModel.quantityController,
                              keyboardtype: TextInputType.number,
                              validator: viewModel.qunatityValidator,
                              labeltext: "Item Quantity",
                              prefixicon: Icons.add_circle_sharp,
                              eyepass: false,
                              obscureText: false,
                            ),
                            TextWidget(
                              focusNode: FocusNode(),
                              hint: "kg , g, L",
                              controller: viewModel.quantityTypeController,
                              keyboardtype: TextInputType.name,
                              validator: viewModel.quantityTypeValidator,
                              labeltext: "Q Type",
                              prefixicon: Icons.add_circle_sharp,
                              eyepass: false,
                              obscureText: false,
                            ),
                            TextWidget(
                              focusNode: FocusNode(),
                              hint: "200 , 100",
                              controller: viewModel.priceController,
                              keyboardtype: TextInputType.number,
                              validator: viewModel.priceValidator,
                              labeltext: "Item Price",
                              prefixicon: Icons.add_circle_sharp,
                              eyepass: false,
                              obscureText: false,
                            ),
                          ],
                        ),
                      ),
                      Form(
                        key: viewModel.formkey2,
                        child: TextWidget(
                          focusNode: FocusNode(),
                          hint: "200 , 100",
                          controller: viewModel.salepriceController,
                          keyboardtype: TextInputType.number,
                          validator: viewModel.priceValidator,
                          labeltext: "Sale Price",
                          prefixicon: Icons.add_circle_sharp,
                          eyepass: false,
                          obscureText: false,
                        ),
                      ),
                      SizedBox(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white70),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          onPressed: viewModel.isImagePicked
                              ? viewModel.uploadData
                              : null,
                          child: viewModel.loading
                              ? const CircularProgressIndicator()
                              : Text(
                                  "Add Item",
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        color: viewModel.isImagePicked
                                            ? Colors.white
                                            : Colors.white54,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Item List",
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.50,
                        width: screenWidth(context),
                        child: ListView.builder(
                          physics: const ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          //  itemExtent: MediaQuery.of(context).size.width * 0.40,
                          itemCount: viewModel.itemList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 210.px,
                              padding: EdgeInsets.all(8.px),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 4.px, vertical: 4.px),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.px)),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      (viewModel.itemdata(index).isOnSale!)
                                          ? Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2.px),
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8.px))),
                                              child: Text('Sale',
                                                  style: GoogleFonts.lato(
                                                      textStyle: TextStyle(
                                                    color: Colors.white,
                                                    letterSpacing: 3,
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ))),
                                            )
                                          : Container(),
                                      Container(
                                        color: Colors.white,
                                        height: 120.px,
                                        width: 96.px,
                                        child: CachedNetworkImage(
                                          imageUrl: viewModel
                                              .itemdata(index)
                                              .imageUrl,
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                            child: Container(),
                                            baseColor: Colors.grey.shade300,
                                            highlightColor:
                                                Colors.grey.shade300,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                          fit: BoxFit.fill,
                                          width: double.infinity,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.px,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(viewModel.itemdata(index).title,
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    fontSize: 17.sp,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600))),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                  viewModel
                                                          .itemdata(index)
                                                          .quantity
                                                          .toString() +
                                                      viewModel
                                                          .itemdata(index)
                                                          .quantityType,
                                                  style: GoogleFonts.lato(
                                                      textStyle: TextStyle(
                                                          fontSize: 17.sp,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight
                                                              .w600))),
                                              verticalSpaceTiny,
                                              (viewModel
                                                      .itemdata(index)
                                                      .isOnSale!)
                                                  ? Column(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                              "Rs." +
                                                                  viewModel
                                                                      .itemdata(
                                                                          index)
                                                                      .price
                                                                      .toString(),
                                                              style: GoogleFonts.lato(
                                                                  textStyle: TextStyle(
                                                                      decoration:
                                                                          TextDecoration
                                                                              .lineThrough,
                                                                      decorationColor:
                                                                          Colors
                                                                              .black,
                                                                      fontSize:
                                                                          14.sp,
                                                                      color: Colors
                                                                          .blueAccent,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold))),
                                                        ),
                                                        horizontalSpaceSmall,
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                              "Rs." +
                                                                  viewModel
                                                                      .itemdata(
                                                                          index)
                                                                      .changedPrice
                                                                      .toString(),
                                                              style: GoogleFonts.lato(
                                                                  textStyle: TextStyle(
                                                                      fontSize:
                                                                          14.sp,
                                                                      color: Colors
                                                                          .blueAccent,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold))),
                                                        ),
                                                      ],
                                                    )
                                                  : Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                          "Rs." +
                                                              viewModel
                                                                  .itemdata(
                                                                      index)
                                                                  .price
                                                                  .toString(),
                                                          style: GoogleFonts.lato(
                                                              textStyle: TextStyle(
                                                                  fontSize:
                                                                      14.sp,
                                                                  color: Colors
                                                                      .blueAccent,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))),
                                                    ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () => viewModel.updateData(
                                              id: viewModel.itemdata(index).id,
                                              imageUrl: viewModel
                                                  .itemdata(index)
                                                  .imageUrl),
                                          child: Container(
                                              padding: EdgeInsets.all(4.px),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.px),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 1,
                                                      blurRadius: 10.px,
                                                    )
                                                  ]),
                                              child: Text(
                                                "Update",
                                                style: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.deepOrange)),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.px),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () => viewModel.deleteItem(
                                                imageUrl: viewModel
                                                    .itemdata(index)
                                                    .imageUrl,
                                                docId: viewModel
                                                    .itemdata(index)
                                                    .id),
                                            child: const Icon(Icons.delete,
                                                color: Colors.red)),
                                        InkWell(
                                          onTap: () => viewModel.salePressed(
                                              id: viewModel.itemdata(index).id,
                                              isOnSale: viewModel
                                                  .itemdata(index)
                                                  .isOnSale!),
                                          child: Container(
                                            padding: EdgeInsets.all(4.px),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.px),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 1,
                                                    blurRadius: 10.px,
                                                  )
                                                ]),
                                            child: (viewModel
                                                    .itemdata(index)
                                                    .isOnSale!)
                                                ? Text(
                                                    "Remove Sale",
                                                    style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors
                                                                .deepOrange)),
                                                  )
                                                : Text(
                                                    "Add Sale",
                                                    style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.green)),
                                                  ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: null,
                                              child: Container(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.5),
                                                          spreadRadius: 1,
                                                          blurRadius: 10,
                                                        )
                                                      ]),
                                                  child: Text(
                                                    "Add Item",
                                                    style: GoogleFonts.lato(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black)),
                                                  )),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  CategoryItemAdminModel viewModelBuilder(BuildContext context) =>
      CategoryItemAdminModel();
  @override
  Future onViewModelReady(CategoryItemAdminModel viewModel) =>
      viewModel.fetchData();
}
