import 'package:flutter/material.dart';

import 'calculator_button.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  static String routeName = "calculator";

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = "";
  String lhs = "";
  String savedOperator = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator"), backgroundColor: Colors.black),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      child: Expanded(
                          child: Text(result, style: TextStyle(fontSize: 32)))),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CulcaltotButton(
                  digit: "CE",
                  onClick: onClear,
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CulcaltotButton(digit: "7", onClick: onDigitCliCk),
                CulcaltotButton(digit: "8", onClick: onDigitCliCk),
                CulcaltotButton(digit: "9", onClick: onDigitCliCk),
                CulcaltotButton(digit: "+", onClick: onOperatorCliCk)
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CulcaltotButton(digit: "4", onClick: onDigitCliCk),
                CulcaltotButton(digit: "5", onClick: onDigitCliCk),
                CulcaltotButton(digit: "6", onClick: onDigitCliCk),
                CulcaltotButton(digit: "-", onClick: onOperatorCliCk)
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CulcaltotButton(digit: "1", onClick: onDigitCliCk),
                CulcaltotButton(digit: "2", onClick: onDigitCliCk),
                CulcaltotButton(digit: "3", onClick: onDigitCliCk),
                CulcaltotButton(digit: "*", onClick: onOperatorCliCk)
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CulcaltotButton(digit: ".", onClick: onDigitCliCk),
                CulcaltotButton(digit: "0", onClick: onDigitCliCk),
                CulcaltotButton(digit: "=", onClick: onEqual),
                CulcaltotButton(digit: "/", onClick: onOperatorCliCk)
              ],
            ),
          )
        ],
      ),
    );
  }

  void onDigitCliCk(String digit) {
    if (digit == "." && result.contains(".")){
      return;
    }
    result += digit;
    setState(() {});
    // if(lhs.isNotEmpty && digit.isNotEmpty){
    //   result ="${0}";
    // }
  }

  void onOperatorCliCk(String operator) {

    if (result.isEmpty && lhs.isEmpty) {
      // Do nothing if there is no number before an operator
      return ;
    }
    if (savedOperator.isEmpty) {
      lhs = result;
      savedOperator = operator;
    } else {
      lhs = calculate(lhs, savedOperator, result);
      savedOperator = operator;
    }

    result = "";
    setState(() {});
    print("onOperatorClick:lhs:$lhs ,savedOperator:$savedOperator");
  }

  String calculate(String lhs, String opertor, String rhs) {
    double n1 = double.parse(lhs);
    double n2 = double.parse(rhs);
    if (opertor == "+") {
      return "${n1 + n2}";
    } else if (opertor == "-") {
      return "${n1 - n2}";
    } else if (opertor == "*") {
      return "${n1 * n2}";
    } else {
      return "${n1 / n2}";
    }
  }

  void onEqual(_) {
    result = calculate(lhs, savedOperator, result);
    lhs="";
    savedOperator="";
    setState(() {});
  }
  void onClear(_) {
    result = "";
    lhs="";
    savedOperator="";
    setState(() {});
  }
}
