import 'package:flutter/cupertino.dart';

class Badge extends StatelessWidget {
  //constractor
  const Badge({required this.iconButton,required this.color,required this.value,super.key});
final Widget iconButton;
final Color color;
final int value;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        iconButton,
         value >0
      ? Positioned(
           right: 8,
            top: 8,
           child: Container(
             padding: EdgeInsets.all(2.0),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: color,),
             constraints: BoxConstraints(
               minWidth: 16,
               minHeight: 16,),
             child: Text(
               value.toString(),
               textAlign: TextAlign.center,
               style: TextStyle(
                 fontSize: 10
               )
             ),
           ),
        )
             :SizedBox()
    ],
    );
  }
}
