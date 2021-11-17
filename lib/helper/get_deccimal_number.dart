class DecimalConvertor {
  String decimal = ".00";

  ///Thi function will help us get the decimal number from an amount

  String? getDeccimal(double balance) {
    var decimal1 = balance.toString().split('.')[1];

    for (int i = 0; i < decimal1.length; i++) {
      decimal =
          ".${int.tryParse(balance.toString().split('.')[1].substring(0, decimal1.length))}";
    }

    if (decimal1.length == 1) {
      decimal = ".00";
    }

    return decimal;
  }
}
