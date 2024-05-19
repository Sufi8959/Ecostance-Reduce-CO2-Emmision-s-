import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/data/affiliate_chart/response/Referral_stats_response.dart';
import 'package:net_carbons/data/affiliate_chart/response/referral_stats_month_response.dart';
import 'package:net_carbons/data/affiliate_chart/trans_response/transaction_response.dart';
import 'package:net_carbons/data/core/network/dio.dart';
import 'package:net_carbons/data/dashboard_charts/DashboardChartsResponse.dart';
import 'package:net_carbons/data/dashboard_charts/products/ProductsResponse.dart';
import 'package:net_carbons/presentation/affiliate_chart/chart_transactions.dart';
import 'package:net_carbons/presentation/profile/child_screens/dashboard/Product.dart';
import 'package:net_carbons/presentation/profile/child_screens/dashboard/bar_chart_two.dart';
import 'package:net_carbons/presentation/profile/child_screens/dashboard/timeline_tile.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../app/constants/string_constants.dart';

class GraphData {
  final int id;
  final int year;
  final int month;
  dynamic trees;
  final String monthString;

  GraphData({
    required this.id,
    required this.year,
    required this.month,
    required this.trees,
    required this.monthString,
  });
}

class DashboardCharts extends StatefulWidget {
  const DashboardCharts({Key? key}) : super(key: key);

  @override
  DashboardChartsState createState() => DashboardChartsState();
}

class DashboardChartsState extends State<DashboardCharts> {
  final Color leftBarColor = const Color(0x6661a60d);
  final Color rightBarColor =
      const Color.fromRGBO(213, 99, 85, 0.5019607843137255);
  final double width = 15;
  List<GraphData> graphList = [];
  List<GraphData> graphGhgList = [];
  List<Product> productsList = [];
  final dio = getIt<DioManager>();

  double total = 0.0;
  int monthIndex = 0;
  int chartIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchMetrics();
  }

  Future<void> fetchData() async {
    try {
      final resp = await dio.get('/v1/orders/graph');
      if (resp.statusCode == 200) {
        print("success --> ");
        final response = DashboardChartsResponse.fromJson(resp.data);
        var dataList = response.data;
        graphList = generatePreviousMonths(6);
        graphGhgList = generatePreviousMonths(4);

        List<GraphData> graphListApi = [];
        List<GraphData> graphGhgListApi = [];
        for (int i = 0; i < dataList!.length; i++) {
          graphListApi.add(GraphData(
              id: i,
              year: dataList[i].id!.year!,
              month: dataList[i].id!.month!,
              trees: dataList[i].treesPlanted!,
              monthString: monthToString(dataList[i].id!.month!)));
          graphGhgListApi.add(GraphData(
              id: i,
              year: dataList[i].id!.year!,
              month: dataList[i].id!.month!,
              trees: dataList[i].ghgReduced!,
              monthString: monthToString(dataList[i].id!.month!)));
        }

        replaceData(graphList, graphListApi);
        replaceData(graphGhgList, graphGhgListApi);
        total = calculateTotal(graphList);
        cumulateTrees(graphList);

        setState(() {});
      } else {
        print("Server Error");
      }
    } on SocketException catch (e) {
      print("Internet connection failed");
    } on DioError catch (e) {
      print("Something went wrong. Please try again later.");
    } catch (e) {
      print("Server Error, Something went wrong. Please try again later. " +
          e.toString());
    }
  }

  double calculateTotal(List<GraphData> purchaseList) {
    dynamic total = 0.0;

    for (var purchaseData in purchaseList) {
      total += purchaseData.trees;
    }

    return total;
  }

  List<GraphData> generatePreviousMonths(int count) {
    List<GraphData> monthsList = [];
    DateTime currentDate = DateTime.now();

    for (int i = count; i >= 0; i--) {
      int monthNumber = currentDate.month;
      String monthName = monthToString(monthNumber);

      monthsList.add(GraphData(
          id: i,
          year: currentDate.year,
          month: monthNumber,
          monthString: monthName,
          trees: 0));

      currentDate =
          DateTime(currentDate.year, currentDate.month - 1, currentDate.day);
    }

    return monthsList.reversed.toList();
  }

  String monthToString(int month) {
    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "";
    }
  }

  void replaceData(List<GraphData> existingData, List<GraphData> apiData) {
    for (var apiPurchase in apiData) {
      int index = existingData.indexWhere(
          (existingPurchase) => existingPurchase.month == apiPurchase.month);

      if (index != -1) {
        existingData[index].trees = apiPurchase.trees;
      }
    }
  }

  void cumulateTrees(List<GraphData> list) {
    dynamic cumulativeTrees = 0;

    for (var data in list) {
      // Calculate the cumulative trees by adding the previous cumulative value
      data.trees += cumulativeTrees;
      // Update the cumulativeTrees for the next iteration
      cumulativeTrees = data.trees;
    }
  }

  Future<String> getUserIdFromPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString(AppStrings.ID);
    id ??= "";
    return id;
  }

  Future<void> fetchMetrics() async {
    try {
      final resp = await dio.get('/v1/metrics');
      if (resp.statusCode == 200) {
        Map<String, dynamic> data = resp.data;

        if (data.containsKey('projectsSupportedIndividualCount')) {
          Map<String, dynamic> projectsSupportedIndividualCount =
              data['projectsSupportedIndividualCount'];
          List<String> arrayOfStrings = [];
          arrayOfStrings =
              projectsSupportedIndividualCount.entries.map((entry) {
            return "${entry.key}:${entry.value}";
          }).toList();

          print(arrayOfStrings);
          fetchProducts(arrayOfStrings);
        } else {
          print('No projectsSupportedIndividualCount in the response.');
        }
      } else {
        print('HTTP request failed with status ${resp.statusCode}');
      }
    } on SocketException catch (e) {
      print("Internet connection failed");
    } on DioError catch (e) {
      print("Something went wrong. Please try again later.");
    } catch (e) {
      print("Server Error, Something went wrong. Please try again later. " +
          e.toString());
    }
  }

  Future<void> fetchProducts(List<String> arrayOfStrings) async {
    try {
      final resp = await dio.get('/v1/products');
      if (resp.statusCode == 200) {
        print("products success --> ");
        final response = ProductsResponse.fromJson(resp.data);
        var dataList = response.data;
        for (var da in dataList!) {
          if (arrayOfStrings.contains("${da.details!.project!.id}:1")) {
            productsList.add(Product(
                id: da.details!.project!.id!,
                name: da.name!,
                shortDesc: da.shortDescription!,
                image: da.image![0]));
          }
        }
        setState(() {});
      } else {
        print("Server Error");
      }
    } on SocketException catch (e) {
      print("Internet connection failed");
    } on DioError catch (e) {
      print("Something went wrong. Please try again later.");
    } catch (e) {
      print("Server Error, Something went wrong. Please try again later. " +
          e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppAppBar(() {
        Navigator.pop(context);
      }),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
            child: Column(
              children: [
                _buildHeader('My Dashboard'),
                _chart(),
                const SizedBox(
                  height: 10,
                ),
                _secondChart(graphGhgList),
                _timeline(productsList)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _secondChart(List<GraphData> graphGhgList) {
    print("graph list ${graphGhgList}");
    // return BarChartTwo(graphGhgList: graphGhgList,);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
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
                  style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
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
                    color:
                        const Color.fromRGBO(213, 99, 85, 0.5019607843137255)),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 200,
            child: _buildChartTwo(graphGhgList),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }

  Widget _chart() {
    return Column(
      children: [
        _buildChartSection(
            'Total Trees Planted', graphList, const Color(0x6661a60d)),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _buildHeader(String title) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 48),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Total Trees Planted: ${total.round()}",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildChartSection(String title, List<GraphData> data, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 8,
              color: color,
            ),
            const SizedBox(width: 4),
            Text(
              title,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
          ],
        ),
        data.isNotEmpty
            ? _buildFlChart(title, data, color)
            : const CupertinoActivityIndicator(),
      ],
    );
  }

  double roundToNearest50(double value) {
    return ((value + 25) ~/ 50) * 50;
  }

  Widget _buildFlChart(String title, List<GraphData> data, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: BarChart(
          BarChartData(
              minY: 0,
              maxY: roundToNearest50(total),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.grey),
              ),
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
              barGroups: data
                  .map((data) => BarChartGroupData(x: data.id, barRods: [
                        BarChartRodData(
                            toY: data.trees.toDouble(),
                            color: color,
                            width: 30,
                            borderRadius: const BorderRadius.all(Radius.zero)),
                      ]))
                  .toList(),
              gridData: FlGridData(show: false)),
          // gridData: FlGridData(show: false),
        ),
      ),
    );
  }

  Widget _buildChartTwo(List<GraphData> data) {
    dynamic maxNumber = 0;
    if (data.isNotEmpty) {
      maxNumber = data[0].trees;
      for (int i = 1; i < data.length; i++) {
        if (data[i].trees > maxNumber) {
          maxNumber = data[i].trees;
        }
      }
    }

    return BarChart(BarChartData(
      minY: 0,
      maxY: maxNumber.ceilToDouble(),
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
            getTitlesWidget: _getTitlesWidgetTwo,
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
                  color: leftBarColor,
                  width: width,
                  borderRadius: const BorderRadius.all(Radius.zero),
                ),
                BarChartRodData(
                    toY: data.trees.toDouble(),
                    color: rightBarColor,
                    width: width,
                    borderRadius: const BorderRadius.all(Radius.zero)),
              ]))
          .toList(),
      gridData: FlGridData(show: false),
    ));
  }

  Widget _getTitlesWidget(double value, TitleMeta meta) {
    int index = value.toInt();
    if (index >= 0 && index <= graphList.length) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          "${graphList[index].monthString} ${graphList[index].year}",
          style: const TextStyle(
              fontSize: 7, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      );
    }
    return Container();
  }

  Widget _getTitlesWidgetTwo(double value, TitleMeta meta) {
    int index = value.toInt();
    if (index >= 0 && index <= graphGhgList.length) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          "${graphGhgList[index].monthString} ${graphGhgList[index].year}",
          style: const TextStyle(
              fontSize: 7, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      );
    }
    return Container();
  }

  Widget _timeline(List<Product> productsList) {
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Total Projects Supported: ${productsList.length}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        productsList.isNotEmpty
            ? ListView.builder(
                itemCount: productsList.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return ProjectsTimelineTile(
                    index: index,
                    product: productsList[index],
                  );
                })
            : const CupertinoActivityIndicator(),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
