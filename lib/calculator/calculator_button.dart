import 'package:flutter/material.dart';

class CulcaltotButton extends StatelessWidget {
  const CulcaltotButton({super.key,required this.digit,required this.onClick});
  final String digit;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(onPressed: (){
        onClick(digit);
      }, child:Text(digit,style: TextStyle(fontSize: 20),),style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.black) )),
    ));
  }
}
