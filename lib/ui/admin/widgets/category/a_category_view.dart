import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/admin/widgets/category/a_category_viewmodel.dart';
import 'package:organic_market/ui/common/textfied.dart';
import 'package:organic_market/ui/common/ui_helpers.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class CategoryAdmin extends StackedView<CategoryAdminModel> {
  const CategoryAdmin({super.key});

  @override
  Widget builder(
      BuildContext context, CategoryAdminModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category Tool",
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
                        "Add Category ",
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                      ),
                    ),
                    verticalSpaceTiny,
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
                      onChanged: viewModel.onchangedValidation,
                      child: TextWidget(
                        controller: viewModel.nameController,
                        keyboardtype: TextInputType.name,
                        hint: "Category Name",
                        validator: viewModel.nameValidator,
                        labeltext: "Category Name",
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
                                "Add Category",
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
                      "Categories",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45)),
                    ),
                  ),
                  SizedBox(
                      // height: MediaQuery.of(context).size.height * 0.40,
                      child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    //  itemExtent: MediaQuery.of(context).size.width * 0.40,
                    itemCount: viewModel.datalist().length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 110,
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
                              height: 80,
                              width: 80,
                              child: CachedNetworkImage(
                                imageUrl: viewModel
                                    .datalist()
                                    .map((categoryobject) =>
                                        categoryobject.imageUrl as String)
                                    .toList()[index],
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
                                  horizontal: 12, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      viewModel
                                          .datalist()
                                          .map((e) => e.name as String)
                                          .toList()[index],
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                              fontSize: 17,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600))),
                                  InkWell(
                                    onTap: () => viewModel.updateData(
                                        id: viewModel
                                            .datalist()
                                            .map((e) => e.id as String)
                                            .toList()[index],
                                        imageUrl: viewModel
                                            .datalist()
                                            .map((e) => e.imageUrl as String)
                                            .toList()[index]),
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
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
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
                                      onTap: () => viewModel.deleteData(
                                          imageUrl: viewModel
                                              .datalist()
                                              .map((categoryobject) =>
                                                  categoryobject.imageUrl
                                                      as String)
                                              .toList()[index],
                                          docId: viewModel
                                              .datalist()
                                              .map((categoryobject) =>
                                                  categoryobject.id as String)
                                              .toList()[index]),
                                      child: const Icon(Icons.delete,
                                          color: Colors.red)),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () => viewModel.additem(viewModel
                                            .datalist()
                                            .map((e) => e.id as String)
                                            .toList()[index]),
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
                                              "Add Item",
                                              style: GoogleFonts.lato(
                                                  textStyle: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black)),
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
  CategoryAdminModel viewModelBuilder(BuildContext context) =>
      CategoryAdminModel();
  @override
  Future onViewModelReady(CategoryAdminModel viewModel) =>
      viewModel.fetchData();
}
