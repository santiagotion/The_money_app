import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:get/get.dart';
import 'package:money_app/data/test_data.dart';
import 'package:money_app/models/transaction.dart';
import 'package:money_app/pages/to_who/screen/to_who_view.dart';

/// this class will take care of adding to the transaction list
/// and keep tracks of the total amount
class TransactionController extends GetxController {
  var transactionList = TestData().list.obs;
  var balance = 150.68.obs;
  var errorVisibility = false.obs;

  ///this function will check if we are topping up or we are paying
  ///and it will update the transaction list and the current balance
  addTransaction(title, amount, isTopUp) {
    transactionList.add(Transaction(title, amount, DateTime.now(), isTopUp));
    if (isTopUp == true) {
      balance.value += double.parse(amount);
    } else {
      balance.value -= double.parse(amount);
    }

    transactionList.sort((a, b) => Comparable.compare(b.date, a.date));
  }

  ///this fuction will chack if we ahave enought money to send
  ///if not it will give an error
  checkBalance(String amount) {
    if (balance.value < double.parse(amount)) {
      errorVisibility.value = true;
      Vibrate.feedback(FeedbackType.error);
    } else {
      Get.to(() => ToWhoView(
            amount: amount,
          ));
    }
  }
}
