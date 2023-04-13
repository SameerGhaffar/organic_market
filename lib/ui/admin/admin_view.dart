import 'package:flutter/material.dart';

import 'package:organic_market/ui/admin/admin_viewmodel.dart';
import 'package:organic_market/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class AdminView extends StackedView<AdminViewModel> {
  const AdminView({super.key});

  @override
  Widget builder(
      BuildContext context, AdminViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Tools"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpaceMassive,
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Card(
                      child: InkWell(
                        onTap: viewModel.toSliderView,
                        child: Column(
                          children: const [
                            Icon(Icons.image),
                            Text("Slider Image Tool")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: InkWell(
                        onTap: viewModel.toPromotionView,
                        child: Column(
                          children: const [
                            Icon(Icons.image),
                            Text("Promotion Image Tool")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: InkWell(
                        onTap: viewModel.toCategoryView,
                        child: Column(
                          children: const [
                            Icon(Icons.image),
                            Text("Category tool")
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            verticalSpaceLarge,
            ElevatedButton(
                onPressed: () => viewModel.logout(),
                child: const Text("Logout")),
          ],
        ),
      )),
    );
  }

  @override
  AdminViewModel viewModelBuilder(BuildContext context) => AdminViewModel();
}
