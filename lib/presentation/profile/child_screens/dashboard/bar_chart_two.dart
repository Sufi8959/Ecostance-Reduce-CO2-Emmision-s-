import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:net_carbons/presentation/profile/child_screens/dashboard/dashboard_charts.dart';

class BarChartTwo extends StatefulWidget {
  List<GraphData> graphGhgList;

  BarChartTwo({super.key, required this.graphGhgList});

  final Color leftBarColor = const Color(0x6661a60d);
  final Color rightBarColor =
      const Color.fromRGBO(213, 99, 85, 0.5019607843137255);

  // final Color avgColor = AppColors.appleGreen.avg(AppColors.bgColor);
  @override
  State<StatefulWidget> createState() => BarChartTwoState();
}

class BarChartTwoState extends State<BarChartTwo> {
  final double width = 15;

  // late List<BarChartGroupData> rawBarGroups;
  // late List<BarChartGroupData> showingBarGroups;
  List<GraphData> ghgList = [];

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    // final barGroup1 = makeGroupData(0, 5, 12);
    // final barGroup2 = makeGroupData(1, 16, 12);
    // final barGroup3 = makeGroupData(2, 18, 5);
    // final barGroup4 = makeGroupData(3, 20, 16);
    // final barGroup5 = makeGroupData(4, 17, 6);
    // final barGroup6 = makeGroupData(5, 19, 1.5);
    // final barGroup7 = makeGroupData(6, 10, 1.5);
    //
    // final items = [
    //   barGroup1,
    //   barGroup2,
    //   barGroup3,
    //   barGroup4,
    //   barGroup5,
    //   barGroup6,
    //   barGroup7,
    // ];
    //
    // rawBarGroups = items;
    //
    // showingBarGroups = rawBarGroups;
    ghgList = widget.graphGhgList;
    setState(() {});
    print("graph list two ${ghgList}");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: <Widget>[
          //     makeTransactionsIcon(),
          //     const SizedBox(
          //       width: 38,
          //     ),
          //     const Text(
          //       'Transactions',
          //       style: TextStyle(color: Colors.black, fontSize: 22),
          //     ),
          //   ],
          // ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Carbon Footprint: Emitted vs Reduced",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 38,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 8,
                    color: const Color(0x6661a60d),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    "Total C02 Emitted (Tons)",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                width: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 20,
                      height: 8,
                      color: const Color.fromRGBO(
                          213, 99, 85, 0.5019607843137255)),
                  const SizedBox(width: 4),
                  const Text(
                    "Total C02 Reduced (Tons)",
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 200,
            // child: BarChart(
            //   BarChartData(
            //     minY: 0,
            //     maxY: 20,
            //     // barTouchData: BarTouchData(
            //     //   touchTooltipData: BarTouchTooltipData(
            //     //     tooltipBgColor: Colors.grey,
            //     //     getTooltipItem: (a, b, c, d) => null,
            //     //   ),
            //     //   touchCallback: (FlTouchEvent event, response) {
            //     //     if (response == null || response.spot == null) {
            //     //       setState(() {
            //     //         touchedGroupIndex = -1;
            //     //         showingBarGroups = List.of(rawBarGroups);
            //     //       });
            //     //       return;
            //     //     }
            //     //
            //     //     touchedGroupIndex = response.spot!.touchedBarGroupIndex;
            //     //
            //     //     setState(() {
            //     //       if (!event.isInterestedForInteractions) {
            //     //         touchedGroupIndex = -1;
            //     //         showingBarGroups = List.of(rawBarGroups);
            //     //         return;
            //     //       }
            //     //       showingBarGroups = List.of(rawBarGroups);
            //     //       if (touchedGroupIndex != -1) {
            //     //         var sum = 0.0;
            //     //         for (final rod
            //     //         in showingBarGroups[touchedGroupIndex].barRods) {
            //     //           sum += rod.toY;
            //     //         }
            //     //         final avg = sum /
            //     //             showingBarGroups[touchedGroupIndex]
            //     //                 .barRods
            //     //                 .length;
            //     //
            //     //         showingBarGroups[touchedGroupIndex] =
            //     //             showingBarGroups[touchedGroupIndex].copyWith(
            //     //               barRods: showingBarGroups[touchedGroupIndex]
            //     //                   .barRods
            //     //                   .map((rod) {
            //     //                 return rod.copyWith(
            //     //                     toY: avg, color: AppColors.appleGreen);
            //     //               }).toList(),
            //     //             );
            //     //       }
            //     //     });
            //     //   },
            //     // ),
            //     titlesData: FlTitlesData(
            //       show: true,
            //       rightTitles: AxisTitles(
            //         sideTitles: SideTitles(showTitles: false),
            //       ),
            //       topTitles: AxisTitles(
            //         sideTitles: SideTitles(showTitles: false),
            //       ),
            //       bottomTitles: AxisTitles(
            //         sideTitles: SideTitles(
            //           showTitles: true,
            //           getTitlesWidget: bottomTitles,
            //           reservedSize: 40,
            //         ),
            //       ),
            //       // leftTitles: AxisTitles(
            //       //   sideTitles: SideTitles(
            //       //     showTitles: true,
            //       //     reservedSize: 28,
            //       //     interval: 1,
            //       //     getTitlesWidget: leftTitles,
            //       //   ),
            //       // ),
            //       leftTitles: AxisTitles(
            //         sideTitles: SideTitles(showTitles: true, reservedSize: 38),
            //       ),
            //     ),
            //     // borderData: FlBorderData(
            //     //   show: false,
            //     // ),
            //     borderData: FlBorderData(
            //       show: true,
            //       border: Border.all(color: Colors.grey),
            //     ),
            //     // barGroups: showingBarGroups,
            //     // barGroups: showingBarGroups,
            //       barGroups: data
            //           .map((data) => BarChartGroupData(x: data.id, barRods: [
            //         BarChartRodData(
            //             toY: data.trees.toDouble(),
            //             color: color,
            //             width: 30,
            //             borderRadius: const BorderRadius.all(Radius.zero)),
            //       ]))
            //           .toList()
            //     gridData: FlGridData(show: false),
            //   ),
            child: buildChart(ghgList),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  Widget buildChart(List<GraphData> data) {
    return BarChart(BarChartData(
      minY: 0,
      maxY: 20,
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: _getTitlesWidget,
            reservedSize: 40,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true, reservedSize: 38),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.grey),
      ),
      // barGroups: showingBarGroups,
      barGroups: data
          .map((data) => BarChartGroupData(x: data.id, barsSpace: 4, barRods: [
                BarChartRodData(
                  toY: data.trees.toDouble(),
                  color: widget.leftBarColor,
                  width: width,
                  borderRadius: const BorderRadius.all(Radius.zero),
                ),
                BarChartRodData(
                    toY: data.trees.toDouble(),
                    color: widget.rightBarColor,
                    width: width,
                    borderRadius: const BorderRadius.all(Radius.zero)),
              ]))
          .toList(),
      gridData: FlGridData(show: false),
    ));
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '1K';
    } else if (value == 10) {
      text = '5K';
    } else if (value == 19) {
      text = '10K';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 11,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  Widget _getTitlesWidget(double value, TitleMeta meta) {
    int index = value.toInt();
    if (index >= 0 && index <= ghgList.length) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          "${ghgList[index].monthString} ${ghgList[index].year}",
          style: const TextStyle(
              fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      );
    }
    return Container();
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: widget.leftBarColor,
          width: width,
          borderRadius: const BorderRadius.all(Radius.zero),
        ),
        BarChartRodData(
            toY: y2,
            color: widget.rightBarColor,
            width: width,
            borderRadius: const BorderRadius.all(Radius.zero)),
      ],
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.black.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.black.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.black.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.black.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.black.withOpacity(0.4),
        ),
      ],
    );
  }
}
