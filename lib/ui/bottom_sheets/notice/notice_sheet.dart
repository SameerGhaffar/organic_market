import 'package:flutter/material.dart';
import 'package:organic_market/ui/common/app_colors.dart';
import 'package:organic_market/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'notice_sheet_model.dart';

class NoticeSheet extends StackedView<NoticeSheetModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const NoticeSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NoticeSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      height: bottomSheetHeight(context),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              request.title!,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            ),
            verticalSpaceTiny,
            Text(
              request.description!,
              style: const TextStyle(fontSize: 14, color: kcMediumGrey),
              maxLines: 2,
              softWrap: true,
            ),
            verticalSpaceTiny,
            Container(
              height: bottomSheetHeight(context) * 0.59,
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.only(top: 3),
              alignment: Alignment.center,
              height: bottomSheetHeight(context) * 0.06,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Set Address",
                  style: TextStyle(fontSize: 18),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black)),
              ),
            ),
          ],
        ),
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }

  @override
  NoticeSheetModel viewModelBuilder(BuildContext context) => NoticeSheetModel();
}
