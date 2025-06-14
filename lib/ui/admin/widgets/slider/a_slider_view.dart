import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/admin/widgets/slider/a_slider_viewmodel.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class SliderAdmin extends StackedView<SliderAdminModel> {
  const SliderAdmin({super.key});

  @override
  Widget builder(
      BuildContext context, SliderAdminModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => viewModel.imagepick(),
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                          height: 200,
                          width: 200,
                          child: viewModel.image != null
                              ? Image.file(viewModel.image!.absolute)
                              : const Icon(Icons.image),
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
                              ? viewModel.uploadimage
                              : null,
                          child: viewModel.loading
                              ? const CircularProgressIndicator()
                              : Text(
                                  "Upload",
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
                        "Slider Images ",
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45)),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: ListView.builder(
                          physics: const ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          //  itemExtent: MediaQuery.of(context).size.width * 0.40,
                          itemCount: viewModel.imagelist().length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 210,
                                child: InkWell(
                                  onTap: () => viewModel.deleteimage(
                                      viewModel
                                          .imagelist()
                                          .map((sliderobject) =>
                                              sliderobject.ImageUrl as String)
                                          .toList()[index],
                                      viewModel
                                          .imagelist()
                                          .map((sliderobject) =>
                                              sliderobject.id as String)
                                          .toList()[index]),
                                  child: CachedNetworkImage(
                                    imageUrl: viewModel
                                        .imagelist()
                                        .map((sliderobject) =>
                                            sliderobject.ImageUrl as String)
                                        .toList()[index],
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.grey.shade300,
                                      child: Container(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
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
      ),
    );
  }

  @override
  SliderAdminModel viewModelBuilder(BuildContext context) => SliderAdminModel();
  @override
  Future onViewModelReady(SliderAdminModel viewModel) => viewModel.fetchData();
}
