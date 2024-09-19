import 'package:calculater/calc_buttom.dart';
import 'package:flutter/material.dart';


class CalculatorHome extends StatefulWidget {
  CalculatorHome({super.key});


  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();

}
class _CalculatorHomeState extends State<CalculatorHome> {
  String res = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(res, style: TextStyle(fontSize: 30)), // استخدام res المحلي
              ],
            ),
          ),
          // الأزرار
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcButtom(text: '9', onButtonClick: onDigitClic),
                CalcButtom(text: '8', onButtonClick: onDigitClic),
                CalcButtom(text: '7', onButtonClick: onDigitClic),
                CalcButtom(text: '/', onButtonClick: onOperator),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcButtom(text: '6', onButtonClick: onDigitClic),
                CalcButtom(text: '5', onButtonClick: onDigitClic),
                CalcButtom(text: '4', onButtonClick: onDigitClic),
                CalcButtom(text: '*', onButtonClick: onOperator),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcButtom(text: '3', onButtonClick: onDigitClic),
                CalcButtom(text: '2', onButtonClick: onDigitClic),
                CalcButtom(text: '1', onButtonClick: onDigitClic),
                CalcButtom(text: '+', onButtonClick: onOperator),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalcButtom(text: '.', onButtonClick: onDigitClic),
                CalcButtom(text: '0', onButtonClick: onDigitClic),
                CalcButtom(text: '=', onButtonClick: onEqualClicked),
                CalcButtom(text: '-', onButtonClick: onOperator),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onDigitClic(String text) {
    setState(() {
      res += text; // تحديث res هنا
    });
     // استخدم res المحلي للطباعة
  }
  String lhs ='';
  String operator ='';
  void onOperator(String clickedOperator){
    if(operator.isEmpty)// this is the first to enter operator
      //
      {
      lhs = res;
      operator = clickedOperator;
      res = '';
    }
    else{
      String rhs =res;
      calculate(lhs , rhs , operator);
    }
    operator = clickedOperator;
    res ='';
    setState(() {

    });
  }

  String calculate(String lhs, String rhs, String operator) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    double res = 0.0;
    if(operator== '+'){
      res = num1+ num2;

    }
    else if (operator == '-'){
      res = num1 - num2;
    }
    else if (operator == '*'){
      res = num1 * num2;
    } else if (operator == '/'){
      res = num1 / num2;
    }
  return res.toString();
  }
   onEqualClicked(String equalClic){
     String rhs = res;
     res = calculate(lhs, rhs, operator);
     lhs ='';
     operator ='';
     setState(() {

     });
   }
}

