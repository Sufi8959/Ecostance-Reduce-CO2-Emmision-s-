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
import 'package:net_carbons/presentation/affiliate_chart/chart_transactions.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../app/constants/string_constants.dart';
import '../../data/affiliate_chart/trans_response/data.dart';
import '../resources/color.dart';

class PurchaseData {
  final int id;
  double amount;
  final int week;
  final String weekString;

  PurchaseData({
    required this.id,
    required this.amount,
    required this.week,
    required this.weekString,
  });
}

class PurchaseDataMonth {
  final int id;
  double amount;
  final int month;
  final String monthString;

  PurchaseDataMonth({
    required this.id,
    required this.amount,
    required this.month,
    required this.monthString,
  });
}

class AffiliateCharts extends StatefulWidget {
  const AffiliateCharts({Key? key}) : super(key: key);

  @override
  AffiliateChartsState createState() => AffiliateChartsState();
}

class AffiliateChartsState extends State<AffiliateCharts> {
  List<PurchaseData> purchaseReferralList = [];
  List<PurchaseDataMonth> purchaseReferralMonthList = [];
  List<PurchaseDataMonth> purchaseEarningsMonthList = [];
  List<PurchaseData> purchaseEarningsList = [];
  List<Data?> transDataList = [];

  final dio = getIt<DioManager>();
  String dropdownFilterValue = 'week';
  String dropdownDisplayValue = 'Chart';
  String dropdownTransactionValue = 'This Week';
  var filterItems = [
    'week',
    'month',
  ];
  var displayItems = [
    'Chart',
    'Transaction',
  ];
  var transactionItems = ['This Week', 'This Month', "All"];
  double totalReferralAmount = 0.0;
  double totalEarningsAmount = 0.0;
  int monthIndex = 0;
  int chartIndex = 0;

  // final SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    fetchReferralData();
    fetchEarningsData();
  }

  Future<void> fetchReferralData() async {
    try {
      final resp =
          await dio.get('/auth/referral/stats?periodType=$dropdownFilterValue');
      if (resp.statusCode == 200) {
        print("success --> ");
        if (dropdownFilterValue == "month") {
          final response = ReferralStatsMonthResponse.fromJson(resp.data);
          var dataList = response.data;
          purchaseReferralMonthList = generatePrevious7Months();
          List<PurchaseDataMonth> purchaseReferralMonthListApi = [];
          for (var data in dataList!) {
            purchaseReferralMonthListApi.add(PurchaseDataMonth(
                id: data.month!,
                amount: data.totalUSDAmt.toDouble(),
                month: data.month!,
                monthString: monthToString(data.month!)));
          }

          replaceData(purchaseReferralMonthList, purchaseReferralMonthListApi);

          totalReferralAmount = calculateTotalMonth(purchaseReferralMonthList);
        } else {
          final response = ReferralStatsResponse.fromJson(resp.data);
          var dataList = response.data;

          purchaseReferralList = generatePrevious7Weeks();
          List<PurchaseData> purchaseReferralListApi = [];
          for (var data in dataList!) {
            purchaseReferralListApi.add(PurchaseData(
                id: data.week!,
                amount: data.totalUSDAmt.toDouble(),
                week: data.week! + 1,
                weekString: "${data.week!}"));
          }
          purchaseReferralList.sort((p1, p2) {
            return Comparable.compare(p1.id, p2.id);
          });
          replaceWeeksData(purchaseReferralList, purchaseReferralListApi);

          totalReferralAmount = calculateTotal(purchaseReferralList);
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

  Future<void> fetchEarningsData() async {
    try {
      final resp = await dio
          .get('/auth/referral/earning/stats?periodType=$dropdownFilterValue');
      if (resp.statusCode == 200) {
        print("success --> ");
        if (dropdownFilterValue == "month") {
          final response = ReferralStatsMonthResponse.fromJson(resp.data);
          var dataList = response.data;
          purchaseEarningsMonthList = generatePrevious7Months();

          List<PurchaseDataMonth> purchaseEarningsMonthListApi = [];
          for (var data in dataList!) {
            purchaseEarningsMonthListApi.add(PurchaseDataMonth(
                id: data.month!,
                amount: data.totalUSDAmt.toDouble(),
                month: data.month!,
                monthString: monthToString(data.month!)));
          }

          replaceData(purchaseEarningsMonthList, purchaseEarningsMonthListApi);

          totalEarningsAmount = calculateTotalMonth(purchaseEarningsMonthList);
        } else {
          final response = ReferralStatsResponse.fromJson(resp.data);
          var dataList = response.data;
          purchaseEarningsList = generatePrevious7Weeks();
          List<PurchaseData> purchaseEarningsListApi = [];
          for (var data in dataList!) {
            purchaseEarningsListApi.add(PurchaseData(
                id: data.week!,
                amount: data.totalUSDAmt.toDouble(),
                week: data.week! + 1,
                weekString: "${data.week!}"));
          }

          replaceWeeksData(purchaseEarningsList, purchaseEarningsListApi);

          totalEarningsAmount = calculateTotal(purchaseEarningsList);
        }

        setState(() {});
        print("---> size ${purchaseEarningsList.length}");
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

  Future<void> fetchTransactionsData() async {
    try {
      final id = await getUserIdFromPref();
      final resp = await dio.get('/v1/referral-user-earning-logs/user/$id');
      if (resp.statusCode == 200) {
        print("trans success --> ");

        final response = TransactionResponse.fromJson(resp.data);
        transDataList = response.data!;

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

  double calculateTotal(List<PurchaseData> purchaseList) {
    double total = 0.0;

    for (var purchaseData in purchaseList) {
      total += purchaseData.amount;
    }

    return total;
  }

  double calculateTotalMonth(List<PurchaseDataMonth> purchaseList) {
    double total = 0.0;

    for (var purchaseData in purchaseList) {
      total += purchaseData.amount;
    }

    return total;
  }

  List<PurchaseDataMonth> generatePrevious7Months() {
    List<PurchaseDataMonth> monthsList = [];
    DateTime currentDate = DateTime.now();

    for (int i = 6; i >= 0; i--) {
      int monthNumber = currentDate.month;
      String monthName = monthToString(monthNumber);

      monthsList.add(PurchaseDataMonth(
          id: i, amount: 0.0, month: monthNumber, monthString: monthName));

      currentDate =
          DateTime(currentDate.year, currentDate.month - 1, currentDate.day);
    }

    return monthsList.reversed.toList();
  }

  List<PurchaseData> generatePrevious7Weeks() {
    List<PurchaseData> weeksList = [];

    DateTime currentDate = DateTime.now();
    DateTime currentWeekStartDate =
        currentDate.subtract(Duration(days: currentDate.weekday));

    for (int i = 6; i >= 0; i--) {
      DateTime weekStartDate =
          currentWeekStartDate.subtract(Duration(days: i * 7));
      String formattedWeek = "${DateFormat('MMM d').format(weekStartDate)}";

      weeksList.add(PurchaseData(
        id: 6 - i,
        amount: 0.0,
        week: getISOWeekNumber(weekStartDate),
        weekString: formattedWeek,
      ));
    }

    return weeksList;
  }

  int getISOWeekNumber(DateTime date) {
    // Calculate the ISO week number based on the date
    DateTime january4th = DateTime(date.year, 1, 4);
    int daysSinceJanuary4th = date.difference(january4th).inDays + 1;
    int daysUntilNextThursday = (11 - january4th.weekday + 4) % 7;
    int weekNumber = (daysSinceJanuary4th + daysUntilNextThursday) ~/ 7 + 1;

    if (weekNumber == 0) {
      weekNumber = getISOWeekNumber(DateTime(date.year - 1, 12, 31));
    }

    return weekNumber;
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

  void replaceData(
      List<PurchaseDataMonth> existingData, List<PurchaseDataMonth> apiData) {
    for (var apiPurchase in apiData) {
      int index = existingData.indexWhere(
          (existingPurchase) => existingPurchase.month == apiPurchase.month);

      if (index != -1) {
        existingData[index].amount = apiPurchase.amount;
      }
    }
  }

  void replaceWeeksData(
      List<PurchaseData> existingData, List<PurchaseData> apiData) {
    for (var apiPurchase in apiData) {
      int index = existingData.indexWhere(
          (existingPurchase) => existingPurchase.week == apiPurchase.week);

      if (index != -1) {
        existingData[index].amount = apiPurchase.amount;
      }
    }
  }

  Future<String> getUserIdFromPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString(AppStrings.ID);
    id ??= "";
    return id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppAppBar(() {
        Navigator.pop(context);
      }),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
          child: Column(
            children: [
              _buildHeader('Referral Earnings'),
              dropdownDisplayValue == "Chart" ? _chart() : _transaction(),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _transaction() {
    return Expanded(
      flex: 8,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: AppColors.appGreyColor, width: 1),
            color: AppColors.orderPageGrayBg),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListView.builder(
              itemCount: transDataList.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                    color: index % 2 == 0
                        ? AppColors.orderPageGrayBg
                        : Colors.white,
                    child: ChartTransactions(data: transDataList[index]));
                // return TripViewSheetCell(tripData : TripData)
              }),
        ),
      ),
    );
  }

  Widget _chart() {
    return Expanded(
      flex: 8,
      child: Column(
        children: [
          dropdownFilterValue == "month"
              ? _buildChartSectionMonth(
                  'Total Purchases (In USD) by month',
                  purchaseReferralMonthList,
                  const Color(0x7f61a60d),
                  "Total Referral Purchases in last 7 months: USD ",
                  totalReferralAmount)
              : _buildChartSection(
                  'Total Purchases (In USD) by week',
                  purchaseReferralList,
                  const Color(0x7f61a60d),
                  "Total Referral Purchases in last 7 weeks: USD ",
                  totalReferralAmount),
          const SizedBox(
            height: 10,
          ),
          dropdownFilterValue == "month"
              ? _buildChartSectionMonth(
                  'Total Earnings (In USD) by month',
                  purchaseEarningsMonthList,
                  const Color(0x7f35a2eb),
                  "Total Referral Earnings in last 7 months: USD ",
                  totalEarningsAmount)
              : _buildChartSection(
                  'Total Earnings (In USD) by week',
                  purchaseEarningsList,
                  const Color(0x7f35a2eb),
                  "Total Referral Earnings in last 7 weeks: USD ",
                  totalEarningsAmount),
        ],
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // const Text(
                    //   'Display by: ',
                    //   style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                    // ),
                    // _buildFilterButton(),
                    // _dropdown(dropdownDisplayValue, displayItems),
                    ToggleSwitch(
                      minHeight: 30,
                      minWidth: 70.0,
                      cornerRadius: 20.0,
                      activeBgColors: const [
                        [AppColors.primaryActiveColor],
                        [AppColors.primaryActiveColor]
                      ],
                      borderWidth: 5.0,
                      borderColor: const [AppColors.orderPageGrayBg,
                        AppColors.orderPageGrayBg],
                      activeFgColor: Colors.white,
                      inactiveBgColor: AppColors.orderPageGrayBg,
                      inactiveFgColor: AppColors.primaryActiveColor,
                      initialLabelIndex: chartIndex,
                      totalSwitches: 2,
                      labels: const ['Chart', 'Trans'],
                      radiusStyle: true,
                      onToggle: (index) {
                        chartIndex = index!;
                        setState(() {});
                        if (index == 0) {
                          dropdownDisplayValue = 'Chart';
                        } else {
                          dropdownDisplayValue = 'Trans';
                          fetchTransactionsData();
                        }
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    dropdownDisplayValue == "Chart" ?
                    ToggleSwitch(
                      minHeight: 30,
                      minWidth: 70.0,
                      cornerRadius: 20.0,
                      borderWidth: 5.0,
                      borderColor: const [AppColors.orderPageGrayBg,
                        AppColors.orderPageGrayBg],
                      activeBgColors: const [
                        [AppColors.primaryActiveColor],
                        [AppColors.primaryActiveColor]
                      ],
                      activeFgColor: Colors.white,
                      inactiveBgColor: AppColors.orderPageGrayBg,
                      inactiveFgColor: AppColors.primaryActiveColor,
                      initialLabelIndex: monthIndex,
                      totalSwitches: 2,
                      labels: const ['Week', 'Month'],
                      radiusStyle: true,
                      onToggle: (index) {
                        monthIndex = index!;
                        if (index == 0) {
                          dropdownFilterValue = 'week';
                          fetchReferralData();
                          fetchEarningsData();
                        } else {
                          dropdownFilterValue = 'month';
                          fetchReferralData();
                          fetchEarningsData();
                        }
                      },
                    ) : Container()
                    // const Text(
                    //   'Filter by: ',
                    //   style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    // ),
                    // // _buildFilterButton(),
                    // dropdownDisplayValue == "Chart" ? _dropdown(dropdownFilterValue, filterItems)
                    // : _dropdown(dropdownTransactionValue, transactionItems),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildChartSection(String title, List<PurchaseData> data, Color color,
      String msg, double total) {
    return Expanded(
      flex: 4,
      child: Column(
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
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
            ],
          ),
          data.isNotEmpty
              ? _buildFlChart(title, data, color)
              : const CupertinoActivityIndicator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                msg,
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                "\$${total.toStringAsFixed(2)}",
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildChartSectionMonth(String title, List<PurchaseDataMonth> data,
      Color color, String msg, double total) {
    return Expanded(
      flex: 4,
      child: Column(
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
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
            ],
          ),
          data.isNotEmpty
              ? _buildFlChartMonth(title, data, color)
              : const CupertinoActivityIndicator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                msg,
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                "\$${total.toStringAsFixed(2)}",
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }

  double roundUpToNearest5(dynamic value) {
    if (value is double || value is int) {
      if (value < 0) {
        return -(-value / 5).ceilToDouble() * 5;
      } else {
        double remainder = value % 5;
        return (remainder > 0) ? (value + (5 - remainder)) : value;
      }
    } else {
      throw ArgumentError("Input must be a double or an int");
    }
  }

  Widget _buildFlChart(String title, List<PurchaseData> data, Color color) {
    double maxNumber = data[0].amount;
    for (int i = 1; i < data.length; i++) {
      if (data[i].amount > maxNumber) {
        maxNumber = data[i].amount;
      }
    }
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
            minY: 0,
            maxY: maxNumber.ceilToDouble(),
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
                  getTitlesWidget: title.contains("Earnings")
                      ? _getTitlesWidget2
                      : _getTitlesWidget,
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
                          toY: data.amount,
                          color: color,
                          width: 30,
                          borderRadius: const BorderRadius.all(Radius.zero)),
                    ]))
                .toList(),
            gridData: FlGridData(show: false)),
        // gridData: FlGridData(show: false),
      ),
    );
  }

  Widget _buildFlChartMonth(
      String title, List<PurchaseDataMonth> data, Color color) {
    double maxNumber = data[0].amount;
    for (int i = 1; i < data.length; i++) {
      if (data[i].amount > maxNumber) {
        maxNumber = data[i].amount;
      }
    }
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
            minY: 0,
            maxY: maxNumber.ceilToDouble(),
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
                  getTitlesWidget: title.contains("Earnings")
                      ? _getTitlesWidgetMonth2
                      : _getTitlesWidgetMonth,
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
                          toY: data.amount,
                          color: color,
                          width: 30,
                          borderRadius: const BorderRadius.all(Radius.zero)),
                    ]))
                .toList(),
            gridData: FlGridData(show: false)),
        // gridData: FlGridData(show: false),
      ),
    );
  }

  Widget _getTitlesWidgetMonth(double value, TitleMeta meta) {
    int index = value.toInt();
    if (index >= 0 && index <= purchaseReferralMonthList.length) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          purchaseReferralMonthList[index].monthString,
          style: const TextStyle(
              fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      );
    }
    return Container();
  }

  Widget _getTitlesWidgetMonth2(double value, TitleMeta meta) {
    int index = value.toInt();
    if (index >= 0 && index <= purchaseEarningsMonthList.length) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          purchaseEarningsMonthList[index].monthString,
          style: const TextStyle(
              fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      );
    }
    return Container();
  }

  Widget _getTitlesWidget(double value, TitleMeta meta) {
    int index = value.toInt();
    if (index >= 0 && index <= purchaseReferralList.length) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          purchaseReferralList[index].weekString,
          style: const TextStyle(
              fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      );
    }
    return Container();
  }

  Widget _getTitlesWidget2(double value, TitleMeta meta) {
    int index = value.toInt();
    if (index >= 0 && index <= purchaseEarningsList.length) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          purchaseEarningsList[index].weekString,
          style: const TextStyle(
              fontSize: 9, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      );
    }
    return Container();
  }
}
