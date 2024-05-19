import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/presentation/home-products/bloc/products_bloc.dart';

class SortSheetWidget extends StatelessWidget {
  const SortSheetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (!state.isLoading) {
          return Container(
            width: width,
            height: height / 2,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: ProductSortModes.values
                      .toList()
                      .map((e) => GestureDetector(
                            onTap: () {
                              // BlocProvider.of<ProductsBloc>(context)
                              //     .add(ProductsEvent.sortProducts(e));
                              Navigator.pop(context);
                            },
                            child: Container(
                                margin: EdgeInsets.all(8),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: state.sortMode == e
                                        ? Colors.black
                                        : Colors.white,
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: Text(
                                  sorModetTitles[e]!,
                                  style: TextStyle(
                                      color: state.sortMode == e
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp),
                                )),
                          ))
                      .toList()),
            ),
          );
        } else {
          return Center(child: Text("No Products Found"));
        }
      },
    );
  }
}

enum ProductSortModes { defaultSort, lowToHigh, highToLow }

Map<ProductSortModes, String> sorModetTitles = {
  ProductSortModes.highToLow: "Price High to Low",
  ProductSortModes.lowToHigh: "Price Low to High",
  ProductSortModes.defaultSort: "Default",
};
