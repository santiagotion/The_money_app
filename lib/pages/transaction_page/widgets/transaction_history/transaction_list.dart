import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:money_app/helper/time_convertor.dart';
import 'package:money_app/models/transaction.dart';
import 'package:money_app/pages/transaction_page/controller/transaction_controller.dart';
import 'package:money_app/pages/transaction_page/widgets/transaction_history/single_transation.dart';
// ignore: import_of_legacy_library_into_null_safe

class TransactionList extends StatelessWidget {
  TransactionList({Key? key}) : super(key: key);

  final transactionController = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 60),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Recent Activity",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Obx(
          () => GroupedListView<Transaction, DateTime>(
              padding: const EdgeInsets.only(bottom: 30, top: 10),
              elements: transactionController.transactionList(),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              groupBy: (element) => DateTime(
                  element.date.year, element.date.month, element.date.day),
              order: GroupedListOrder.ASC,
              floatingHeader: false,
              groupComparator: (DateTime value1, DateTime value2) =>
                  value2.compareTo(value1),
              groupSeparatorBuilder: (date) => Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 30,
                      color: const Color(0XFFF7F7F7),
                      child: Text(
                        DateTimeConvertor().getRelativeDate(date) ?? "",
                      ),
                    ),
                  ),
              itemBuilder: (context, Transaction transaction) {
                return SingleTransaction(
                  title: transaction.title,
                  isTopUp: transaction.isTopUp,
                  amount: transaction.amount,
                );
              }),
        )
      ],
    );
  }
}
