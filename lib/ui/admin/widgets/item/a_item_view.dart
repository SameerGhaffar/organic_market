import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/common/textfied.dart';
import 'package:organic_market/ui/common/ui_helpers.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

import 'a_item_viewmodel.dart';

class CategoryItemAdmin extends StackedView<CategoryItemAdminModel> {
  const CategoryItemAdmin({super.key});

  @override
  Widget builder(
      BuildContext context, CategoryItemAdminModel viewModel, Widget? child) {
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
        padding: const EdgeInsets.all(8.0),
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
                            hint: "kg , g, L",
                            controller: viewModel.quantityTypeController,
                            keyboardtype: TextInputType.name,
                            validator: viewModel.quantityTypeValidator,
                            labeltext: "Type",
                            prefixicon: Icons.add_circle_sharp,
                            eyepass: false,
                            obscureText: false,
                          ),
                          TextWidget(
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
                      child: ListView.builder(
                        physics: const ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        //  itemExtent: MediaQuery.of(context).size.width * 0.40,
                        itemCount: viewModel.itemList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 200,
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Container(
                                  color: Colors.black,
                                  height: 120,
                                  width: 100,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        viewModel.itemdata(index).imageUrl,
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                      child: Container(),
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.grey.shade300,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(viewModel.itemdata(index).title,
                                          style: GoogleFonts.lato(
                                              textStyle: const TextStyle(
                                                  fontSize: 17,
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
                                                    textStyle: const TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600))),
                                            verticalSpaceTiny,
                                            Text(
                                                "Rs." +
                                                    viewModel
                                                        .itemdata(index)
                                                        .price
                                                        .toString(),
                                                style: GoogleFonts.lato(
                                                    textStyle: const TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.w600))),
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
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 1,
                                                    blurRadius: 10,
                                                  )
                                                ]),
                                            child: Text(
                                              "Update",
                                              style: GoogleFonts.lato(
                                                  textStyle: const TextStyle(
                                                      fontSize: 16,
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
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                          onTap: () => viewModel.deleteItem(
                                              imageUrl: viewModel
                                                  .itemdata(index)
                                                  .imageUrl,
                                              docId:
                                                  viewModel.itemdata(index).id),
                                          child: const Icon(Icons.delete,
                                              color: Colors.red)),
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
  }

  @override
  CategoryItemAdminModel viewModelBuilder(BuildContext context) =>
      CategoryItemAdminModel();
  @override
  Future onViewModelReady(CategoryItemAdminModel viewModel) =>
      viewModel.fetchData();
}
