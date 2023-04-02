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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpaceMassive,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: InkWell(
                    onTap: viewModel.toSliderupload,
                    child: Column(
                      children: const [
                        Icon(Icons.image),
                        Text("Slider Image Tool")
                      ],
                    ),
                  ),
                ),
                Card(
                  child: InkWell(
                    onTap: null,
                    child: Column(
                      children: const [
                        Icon(Icons.image),
                        Text("Slider Image Tool")
                      ],
                    ),
                  ),
                )
              ],
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
