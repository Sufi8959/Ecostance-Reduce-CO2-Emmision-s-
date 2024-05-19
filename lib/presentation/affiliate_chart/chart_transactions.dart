import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:net_carbons/data/affiliate_chart/trans_response/data.dart';

class ChartTransactions extends StatefulWidget {
  final Data? data;

  ChartTransactions({Key? key, required this.data})
      : super(key: key);

  @override
  State<ChartTransactions> createState() => _ChartTransactionsState();
}

class _ChartTransactionsState extends State<ChartTransactions> {

  @override
  Widget build(BuildContext context) {
    final data = widget.data!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Text(
                    "Name",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        ),
                  ),
                  Text("${data.orderId!.billingAddress!.firstName} ${data.orderId!.billingAddress!.lastName}",
                      style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12)),
                  const SizedBox(height: 8),
                   const Text(
                    "Email",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        ),
                  ),
                  Text(data.orderId!.customer!.user!.email!,style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      )),
                  const SizedBox(height: 8),
                   const Text(
                    "Location",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        ),
                  ),
                  Text("${data.orderId!.billingAddress!.state}, ${data.orderId!.billingAddress!.country}",style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      )),
                ],
              )),
              Expanded(
                flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                   const Text(
                    "Date / Time",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        ),
                  ),
                  Text(getDate(data.orderId!.createdAt!, data.orderId!.timeAbbrevation ?? ""),style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      )),
                  const SizedBox(height: 8),
                   const Text(
                    "Purchased Amount",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        ),
                  ),
                  Text("${data.currency} ${data.currencySymbol}${data.orderId!.orderTotal.toString()}",style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      )),
                  const SizedBox(height: 8),
                   const Text(
                    "Earned Amount",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        ),
                  ),
                  Text("${data.currency} ${data.currencySymbol}${data.amount.toString()}",style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      )),
                ],
              )),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  getDate(String time, String timeAbbrevation){
    DateTime dateTime = DateTime.parse(time).toLocal();
    DateTime istDateTime = dateTime.add(const Duration(hours: 5, minutes: 30));
    String formattedDateTime = DateFormat("MMMM d 'at' HH:mm '$timeAbbrevation'").format(istDateTime);
    return formattedDateTime;
  }
}
