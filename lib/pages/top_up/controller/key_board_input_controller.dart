import 'package:get/get.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

///This class will help us handle the custome keyboad
class KeyBoardInputController extends GetxController {
  ///This [wholeNumber] is the first number from the amount
  ///I separated them so it will help to style the amount label
  var wholeNumber = "0".obs;

  ///if someone click on the decimal it will be true
  var isDecimal = false;

  ///This [remainder] is the second part from the amount
  var remainder = ".00".obs;

  ///This function will be triggered when someone click on the decimal
  ///fromm the custom keyboarb
  ///
  addDecimal(String string) {
    if (remainder.value == ".00") {
      remainder.value = ".0" + string;
    } else {
      if (remainder.value[1] == "0") {
        remainder.value = "." + remainder.value[2] + string;
      }
    }

    if (remainder.value[1] != "0" && remainder.value[2] != "0") {
      Vibrate.feedback(FeedbackType.error);
    }
  }

  ///his function will be triggered whenever someone click on the custom keyboard
  inputNumber(string) {
    if (wholeNumber.value.length > 6) {
      Vibrate.feedback(FeedbackType.error);
    } else {
      if (isDecimal == false) {
        if (wholeNumber.value == "0") {
          wholeNumber.value = string;
        } else {
          wholeNumber.value = (wholeNumber.value + string);
        }
      } else {
        addDecimal(string);
      }
    }

    if (remainder.value == ".00" && wholeNumber.value == "0" && string == "0") {
      Vibrate.feedback(FeedbackType.error);
    }
  }

  ///This function will be triggered when someone clicks on the backspacce
  onBackSpace() {
    if (isDecimal == true) {
      if (remainder.value == ".00") {
        isDecimal = false;
      } else {
        if (remainder.value[1] != "0" && remainder.value[2] != "0") {
          remainder.value = ".0" + remainder.value[1];
        } else if (remainder.value[1] == "0") {
          remainder.value = ".00";

          isDecimal = false;
        } else if (remainder.value[1] != "0" && remainder.value[2] == "0") {
          remainder.value = ".0" + remainder.value[1];
        }
      }
    } else {
      if (wholeNumber.value.isNotEmpty) {
        wholeNumber.value =
            wholeNumber.substring(0, wholeNumber.value.length - 1);

        if (wholeNumber.value.isEmpty) {
          wholeNumber.value = "0";
        }
      }
    }

    if (remainder.value == ".00" && wholeNumber.value == "0") {
      Vibrate.feedback(FeedbackType.error);
    }
  }

  ///sets the sttus of the decimal
  onDecimal() {
    if (isDecimal == false) {
      isDecimal = true;
    }
    return isDecimal;
  }
}
