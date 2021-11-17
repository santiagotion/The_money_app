import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/global_widgets/amount_label/amount_label_widget.dart';
import 'package:money_app/helper/get_deccimal_number.dart';
import 'package:money_app/pages/transaction_page/controller/transaction_controller.dart';
import 'package:money_app/pages/transaction_page/widgets/pay_top_up_container.dart';
import 'package:money_app/pages/transaction_page/widgets/transaction_history/transaction_list.dart';

class TransactionView extends StatelessWidget {
  TransactionView({
    Key? key,
  }) : super(key: key);
  final transactionController = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    var pinkHeight = MediaQuery.of(context).size.height / 3.5;

    return Scaffold(
      backgroundColor: const Color(0XFFB02587),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Container(
                  height: pinkHeight,
                  color: const Color(0XFFB02587),
                  child: Obx(
                    () => Center(
                      // This Widget displays the total balance
                      child: AmountLabel(
                        wholeNumber:
                            transactionController.balance().toInt().toString(),
                        remainder: DecimalConvertor()
                            .getDeccimal(transactionController.balance.value)
                            .toString(),
                      ),
                    ),
                  ),
                ),

                // This Widget displays the transactions
                Flexible(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0XFFF7F7F7),
                      child: TransactionList()),
                ),
              ],
            ),
            bottom: false,
          ),

          // Top Up and Pay Widget
          const PayTopUpContainer()
        ],
      ),
    );
  }
}
