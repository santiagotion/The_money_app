import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:money_app/pages/top_up/controller/key_board_input_controller.dart';
import 'package:money_app/pages/top_up/widgets/customkeyboad/single_key.dart';

class Keyboard extends StatelessWidget {
  Keyboard({Key? key}) : super(key: key);

  final keyBoardInputController = Get.put(KeyBoardInputController());
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        buildRow1(),
        const SizedBox(
          height: 20,
        ),
        buildRow2(),
        const SizedBox(
          height: 20,
        ),
        buildRow3(),
        const SizedBox(
          height: 20,
        ),
        buildRow4()
      ],
    );
  }

  buildRow1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SingleKey(
          input: '1',
          onTap: () {
            keyBoardInputController.inputNumber("1");
          },
        ),
        SingleKey(
          input: '2',
          onTap: () {
            keyBoardInputController.inputNumber("2");
          },
        ),
        SingleKey(
          input: '3',
          onTap: () {
            keyBoardInputController.inputNumber("3");
          },
        ),
      ],
    );
  }

  buildRow2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SingleKey(
          input: '4',
          onTap: () {
            keyBoardInputController.inputNumber("4");
          },
        ),
        SingleKey(
          input: '5',
          onTap: () {
            keyBoardInputController.inputNumber("5");
          },
        ),
        SingleKey(
          input: '6',
          onTap: () {
            keyBoardInputController.inputNumber("6");
          },
        ),
      ],
    );
  }

  buildRow3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SingleKey(
          input: '7',
          onTap: () {
            keyBoardInputController.inputNumber("7");
          },
        ),
        SingleKey(
          input: '8',
          onTap: () {
            keyBoardInputController.inputNumber("8");
          },
        ),
        SingleKey(
          input: '9',
          onTap: () {
            keyBoardInputController.inputNumber("9");
          },
        ),
      ],
    );
  }

  buildRow4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SingleKey(
          input: '.',
          onTap: () {
            keyBoardInputController.onDecimal();
          },
        ),
        SingleKey(
          input: '0',
          onTap: () {
            keyBoardInputController.inputNumber("0");
          },
        ),
        GestureDetector(
          onTap: () {
            keyBoardInputController.onBackSpace();
          },
          child: SizedBox(
            width: Get.width / 3,
            child: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
