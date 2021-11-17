import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumCloseButton extends StatelessWidget {
  const CostumCloseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const SizedBox(
          height: 50,
          width: 50,
          child: Icon(
            Icons.cancel,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
