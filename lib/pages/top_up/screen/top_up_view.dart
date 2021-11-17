import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_app/global_widgets/amount_label/amount_label_widget.dart';
import 'package:money_app/global_widgets/buttons/close_button.dart';
import 'package:money_app/global_widgets/buttons/main_button.dart';
import 'package:money_app/pages/top_up/controller/key_board_input_controller.dart';
import 'package:money_app/pages/top_up/widgets/customkeyboad/keyboad.dart';
import 'package:money_app/pages/transaction_page/controller/transaction_controller.dart';

class TopUpView extends StatelessWidget {
  final bool isTopUp;
  const TopUpView({Key? key, required this.isTopUp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final keyBoardInputController = Get.put(KeyBoardInputController());
    final transactionController = Get.put(TransactionController());
    return Scaffold(
      backgroundColor: const Color(0XFFB01A86),
      body: Center(
        child: Stack(
          children: [
            SafeArea(
                child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "How much?",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 0),

                      //here's where we get the current value from the custom keyboard
                      child: Obx(
                        () => AmountLabel(
                          wholeNumber: keyBoardInputController.wholeNumber(),
                          remainder: keyBoardInputController.remainder(),
                        ),
                      )),
                  Obx(
                    () => Visibility(
                      visible: transactionController.errorVisibility(),
                      child: Text(
                        "Balance low please top up 😊",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Keyboard(),
                  MainButton(
                    onTap: () {
                      var amount = keyBoardInputController.wholeNumber() +
                          keyBoardInputController.remainder();

                      // we will check if the amount is not empty
                      if (keyBoardInputController.wholeNumber() == "0" &&
                          keyBoardInputController.remainder() == ".00") {
                        Vibrate.feedback(FeedbackType.error);
                      } else {
                        if (isTopUp == true) {
                          transactionController.addTransaction(
                              "Top up", amount, isTopUp);
                          Get.back();
                        } else {
                          transactionController.checkBalance(amount);
                        }
                      }
                    },
                    text: isTopUp == false ? "Next" : "Top up",
                  )
                ],
              ),
            )),
            const Padding(
              padding: EdgeInsets.all(5),
              child: Align(
                  alignment: Alignment.topRight, child: CostumCloseButton()),
            )
          ],
        ),
      ),
    );
  }
}
