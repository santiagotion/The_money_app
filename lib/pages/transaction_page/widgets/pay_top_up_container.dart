import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/pages/top_up/screen/top_up_view.dart';

class PayTopUpContainer extends StatelessWidget {
  const PayTopUpContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var toppadding = (Get.height / 3.5) - 50;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: toppadding, left: 20, right: 20),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 10),
            ],
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const TopUpView(isTopUp: false));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Image.asset(
                          'assets/images/pay.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "Pay",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const TopUpView(isTopUp: true));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/topUp.png',
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "Top up",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
