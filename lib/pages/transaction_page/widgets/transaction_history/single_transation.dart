import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_app/global_widgets/amount_label/amount_label_widget.dart';
import 'package:money_app/helper/get_deccimal_number.dart';

class SingleTransaction extends StatelessWidget {
  final bool isTopUp;
  final String title;
  final String amount;
  final String? date;
  final String? time;
  const SingleTransaction(
      {Key? key,
      required this.isTopUp,
      required this.title,
      required this.amount,
      this.date,
      this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var wholeNumber = double.parse(amount).toInt().toString();
    var remainder;

    if (GetPlatform.isDesktop) {
      remainder = ".00";
    } else {
      remainder = DecimalConvertor().getDeccimal(double.parse(amount));
    }

    return Container(
        color: Colors.white,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    color: const Color(0XFFB02587),
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  isTopUp == false ? Icons.shopping_bag : Icons.add_circle,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      AmountLabel(
                        wholeNumber:
                            isTopUp == false ? wholeNumber : "+$wholeNumber",
                        remainder: "$remainder",
                        color: isTopUp == false
                            ? Colors.black
                            : const Color(0XFFB02587),
                        wholeNumberSize: 22,
                        remainderSize: 16,
                        fontWeight: FontWeight.w300,
                        inPound: false,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

// title == null ? 