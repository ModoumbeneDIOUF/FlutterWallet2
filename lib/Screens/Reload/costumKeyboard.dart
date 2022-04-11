import 'package:flutter/material.dart';
import 'package:nafa_money/Screens/Reload/keyboarKey.dart';

class CostumKeyboard extends StatefulWidget {


  const CostumKeyboard({ Key? key, }) : super(key: key);

  @override
  _CostumKeyboardState createState() => _CostumKeyboardState();
}

class _CostumKeyboardState extends State<CostumKeyboard> {

  final keys= [
    ['1','2','3'],
    ['4','6','6'],
    ['1','2','3'],
    ['7','8','9'],
    ['00','0','<-'],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold( 

        body: Column(  
          mainAxisAlignment: MainAxisAlignment.end, 
          children: keys
          .map((x) => Row(
              children: x.map((y){
                    return KeyboardKey(
                      label: y, 
                      value: y,
                      onTap: (val){});
              }).toList()
               ,)
               ).toList()
            
          
        ),
      
    );
  }
}