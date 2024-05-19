import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/presentation/calculate_page/calculate_page.dart';
import 'package:net_carbons/presentation/home-products/bloc/products_bloc.dart';
import 'package:net_carbons/presentation/home-products/widgets/product_card.dart';
import 'package:net_carbons/presentation/resources/color.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryActiveColor,
            ),
            onPressed: () {
              calculatorSelectedPageNotifier.value = 1;
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Result",
            style: Theme.of(context).textTheme.headline4,
          ),
          actions: [
            CupertinoButton(
                child: Text(
                  "Change Filter",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: Colors.blueAccent, fontSize: 14.sp),
                ),
                onPressed: () {})
          ],
        ),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ProductCard(product: state.products[index]);
            },
            itemCount: state.products.length,
          );
        },
      ),
    );
  }
}
