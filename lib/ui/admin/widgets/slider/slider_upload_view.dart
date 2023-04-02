import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organic_market/ui/admin/widgets/slider/slider_upload_viewmodel.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => viewModel.imagepick(),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2)),
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
                  foregroundColor: MaterialStateProperty.all(Colors.white70),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed:
                    viewModel.isImagePicked ? viewModel.uploadimage : null,
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
    );
  }

  @override
  SliderAdminModel viewModelBuilder(BuildContext context) => SliderAdminModel();
}
