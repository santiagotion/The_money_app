import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_app/global_widgets/buttons/close_button.dart';
import 'package:money_app/global_widgets/buttons/main_button.dart';
import 'package:money_app/pages/to_who/widgets/to_who_text_field.dart';
import 'package:money_app/pages/transaction_page/controller/transaction_controller.dart';
import 'package:money_app/pages/transaction_page/screen/transaction_view.dart';

class ToWhoView extends StatelessWidget {
  final String amount;
  ToWhoView({Key? key, required this.amount}) : super(key: key);

  var name = "";

  @override
  Widget build(BuildContext context) {
    final errroController = Get.put(ErrorHandling());

    final transactionController = Get.put(TransactionController());
    return Scaffold(
      backgroundColor: const Color(0XFFB01A86),
      body: Stack(
        children: [
          Center(
            child: SafeArea(
                child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "To who?",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ToWhoTextFied(
                    focusNode: FocusNode(),
                    onChanged: (String input) {
                      name = input;
                      errroController.errorVisibility.value = false;
                    },
                    onSubmitted: (String input) {},
                    hintText: 'Enter a name',
                  ),
                  Obx(
                    () => Visibility(
                      visible: errroController.errorVisibility(),
                      child: Text(
                        "Oops don't forget to add a name 😊",
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
                  MainButton(
                    onTap: () {
                      if (name.trim() == "") {
                        Vibrate.feedback(FeedbackType.error);
                        errroController.errorVisibility.value = true;
                      } else {
                        transactionController.addTransaction(
                            name, amount, false);
                        Get.offAll(() => TransactionView());
                      }
                    },
                    text: "Pay",
                  )
                ],
              ),
            )),
          ),
          const Padding(
            padding: EdgeInsets.all(5),
            child: Align(
                alignment: Alignment.topRight, child: CostumCloseButton()),
          )
        ],
      ),
    );
  }
}

class ErrorHandling extends GetxController {
  var errorVisibility = false.obs;
}
