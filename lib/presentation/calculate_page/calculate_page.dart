import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/presentation/calculate_page/bloc/calculate_bloc.dart';
import 'package:net_carbons/presentation/calculate_page/calculate_view.dart';
import 'package:net_carbons/presentation/calculate_page/resultView2.dart';

ValueNotifier<int> calculatorSelectedPageNotifier = ValueNotifier(0);

class ScreenCalculateNew extends StatelessWidget {
  const ScreenCalculateNew({Key? key}) : super(key: key);

  static const List<Widget> _pages = [CalculateView(), ResultView2()];

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CalculateBloc>(context)
        .add(const CalculateEvent.fetchEmissionData());
    return ValueListenableBuilder(
      valueListenable: calculatorSelectedPageNotifier,
      builder: (BuildContext context, int value, Widget? child) {
        return _pages[value];
      },
    );
  }
}

class TextRow extends StatelessWidget {
  const TextRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final Widget title;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [title, value],
      ),
    );
  }
}

//
