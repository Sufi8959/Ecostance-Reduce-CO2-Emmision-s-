import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/app/extensions.dart';
import 'package:net_carbons/domain/home_products/modal/models.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailsTable extends StatelessWidget {
  ProjectDetailsTable({
    Key? key,
    required this.productData,
  }) : super(key: key);
  final ProductModal productData;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Table(
      columnWidths: <int, TableColumnWidth>{
        0: FixedColumnWidth(width * .24),
        1: FixedColumnWidth(4),
        2: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Text(
                  "Project id:",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: AppColors.appGreyColor, fontSize: 14.sp),
                ),
              ),
            ),
            const TableCell(child: SizedBox()),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  productData.productsListId.toString(),
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: AppColors.primaryActiveColor, fontSize: 14.sp),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Text(
                  "Type:",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: AppColors.appGreyColor, fontSize: 14.sp),
                ),
              ),
            ),
            const TableCell(child: SizedBox()),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  productData.details.stdMethod.type,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: AppColors.primaryActiveColor, fontSize: 14.sp),
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Text(
                  "Est. annual reduction:",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: AppColors.appGreyColor, fontSize: 14.sp),
                ),
              ),
            ),
            const TableCell(child: SizedBox()),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  productData.details.estimatedAnnualEmissionReduction,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: AppColors.primaryActiveColor, fontSize: 14.sp),
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Text(
                  "Term start:",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: AppColors.appGreyColor, fontSize: 14.sp),
                ),
              ),
            ),
            const TableCell(child: SizedBox()),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  productData.details.termStart.toString().substring(0, 10),
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: AppColors.primaryActiveColor, fontSize: 14.sp),
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Text(
                  "Term end:",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: AppColors.appGreyColor, fontSize: 14.sp),
                ),
              ),
            ),
            const TableCell(child: SizedBox()),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  productData.details.termEnd.toString().substring(0, 10),
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: AppColors.primaryActiveColor, fontSize: 14.sp),
                ),
              ),
            ),
          ],
        ),
        TableRow(
          children: <Widget>[
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Text(
                  "Validator:",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: AppColors.appGreyColor, fontSize: 14.sp),
                ),
              ),
            ),
            const TableCell(child: SizedBox()),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: GestureDetector(
                  onTap: () {
                    launchMyUrl(
                        context, productData.details.project.validatorLink);
                  },
                  child: Text(
                    productData.details.project.validator,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: AppColors.linkColor,
                        fontSize: 14.sp,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Future<void> launchMyUrl(BuildContext context, String link) async {
  try {
    await launchUrl(
      Uri.parse(link),
    );
  } catch (e) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              content: const Text("Unable to open page"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"))
              ],
            ));
  }
}
