import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:intl/intl.dart';
import 'package:nafa_money/Screens/Reload/keyboarKey.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafa_money/colors.dart';
import 'package:nafa_money/localization/language_constants.dart';

class ReloadScreen extends StatefulWidget {


  const ReloadScreen({ Key? key, }) : super(key: key);

  @override
  _ReloadScreenState createState() => _ReloadScreenState();
}

class _ReloadScreenState extends State<ReloadScreen> {
  
  List<List<dynamic>>? keys; 

String? amount ;

@override
void initState(){
  super.initState();
  amount = '';
  keys= [
    ['1','2','3'],
    ['4','5','6'],
    ['7','8','9'],
    //['00','0',Icon(Icons.backspace_outlined,color: Colors.black.withBlue(40),)],
    ['00','0',"<-"],
  ];
}
  renderKeyBord(){
    return  keys
            !.map((x) => Row(
                children: x.map((y){
                      return Expanded(
                        child: KeyboardKey(
                          label: y, 
                          value: y,
                          onTap: (val){

                           if(val == "<-"){
                              onBackPress();
                           }  
                           else{
                             onkeyTap(val);
                           }          
                          }),
                      );
                }).toList()
                 ,)
                 ).toList();
  }

  onkeyTap(val){

    if(val == '0' || val == '00' && amount!.length == 0){
      return;
    }
    
    setState(() {
      amount = amount! + val;
    });
  }

   onBackPress(){

     if(amount!.length == 0){
       return;
     }
    
    setState(() {
      amount = amount!.substring(0,amount!.length - 1);
    });
  }

  renderAmount(){
    String display ='O';

    if(this.amount!.length > 0){
      
      NumberFormat f = NumberFormat('#,###');
      display = f.format(int.parse( amount!));
    }

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Center(
          child: Column(
            children: [
              Text(
                display,
                style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold,color: Colors.white),
                maxLines: 1,
                ),
                 Container(
                   width: 80.w,
                   height: 40.h,
                   decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        border: Border.all(color: kPrimaryColor),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 2,
                            //spreadRadius: 5
                          )
                        ]),
                   child: Center(
                     child: Text(
                "FCFA",
                style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: kPrimaryColor),
                ),
                   ),
                 ),
            ],
          )),
      ));
  } 
   renderFcaf(){
    String display ='O';
    if(this.amount!.length > 0){

      display = amount!;
    }

    return Expanded(
      child: Center(
        child: Text(
          display,
          style: TextStyle(fontSize: 50.sp,fontWeight: FontWeight.bold,color: kPrimaryColor),
          )));
  } 
  
 renderButtonConfirm(){
   
   return Row(
   
        children: [
            Expanded(
              child: Container(
              
                height: 50,
                margin: EdgeInsets.only(left: 30,right: 30),
                child: TextButton(
                  onPressed: amount!.length > 0 ? (){  
                         print(amount!);

                         yyBottomSheetDialogRecharge(context);
                  }: null,
                  child: Text(
                    "Envoyer",
                    style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                  style: TextButton.styleFrom(
                    backgroundColor: amount!.length > 0 ? kPrimaryColor : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    
                    )
                  ),
                ),
              )
            )
        ],
   ) ;   
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 

        body: Stack(
          children: [

             Container(
            height: 550.h,
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),

          ),
            Container(
              margin: EdgeInsets.only(left: 1.h, top: 28.3.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 30.h,
                        color: Colors.white,
                      ),
                      onPressed: () {
                       
                        Navigator.of(context).pop();
                        print("drawer");
                        
                      }),
                  Container(
                    
                    margin: EdgeInsets.only(left: 20.w),
                    child:Text(
                      "Recharger mon compte",
                      style: TextStyle(color: Colors.white,fontSize: 18.sp,),
                      )
                  )
                ],
              )
              
              ),

               Container(
            margin: EdgeInsets.only(left: 30.h, top: 160.h),
            child: Column(
              children: [
                renderAmount(),
              ],
            ),
          ),
          Container(
             width: 400.w,
            height: 510.h,
            margin: EdgeInsets.only(left: 0.w, right: 0.w, top: 500.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(40.r), topLeft: Radius.circular(40.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    // spreadRadius: 5
                  )
                ]),
                child: Column(
                  children: [
                    ...renderKeyBord(),
                    SizedBox(height: 5.h,),
                     renderButtonConfirm()
                  ],
                ),
          )
          ],

          // child: Column(  
          //   //mainAxisAlignment: MainAxisAlignment.end, 
          //   children:[
              
          //       renderAmount(),
          //     ...renderKeyBord(),
          //     renderButtonConfirm()
          //   ]
              

            
          // ),
        ),
      
    );
  }

  YYDialog yyBottomSheetDialogRecharge(BuildContext context) {
    return YYDialog().build(context)
      ..gravity = Gravity.bottom
      ..gravityAnimationEnable = true
      ..backgroundColor = Colors.transparent
      //..duration = Duration(seconds: 2)
      ..widget(Container(
           width: 340.w,
          height: 370.h,
          margin: EdgeInsets.only(bottom: 20.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40.r),topRight: Radius.circular(40.r)),
            color: Colors.white,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(""),
                  trailing: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: PhysicalShape(
                      color: kPrimaryColor,
                      // shadowColor: Colors.grey,
                      //elevation: 10,
                      clipper: ShapeBorderClipper(shape: CircleBorder()),
                      child: Container(
                        height: 30.h,
                        width: 30.w,
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
               
                Center(
                  child:Text(
                    "Recharger",
                    style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor,fontSize: 28.sp),
                    ),
                ),
                 SizedBox(height: 5.h,), 
                 Center(
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                       amount!,
                        style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor,fontSize: 35.sp),
                        ),
                         Text(
                       " FCFA",
                        style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor,fontSize: 15.sp),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
                Container(
                    width: 320.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(6.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              //spreadRadius: 5
                            )
                          ]),
                          child:   ListTile(
                  title: Text(
                    "Sur",
                    style:TextStyle(fontSize: 20.sp,color: Colors.black,fontWeight: FontWeight.bold)
                    ),
                  subtitle: Text("Compte principal"),
                  leading: Material(
                              elevation: 7,
                              shape: CircleBorder(),
                              // shadowColor: widget.payment.color.withOpacity(0.4),
                              child: Container(
                                height: 70.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  shape: BoxShape.circle,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Icon(Icons.credit_card,size: 30.w,)
                                ),
                               ),
                              ),
                  ),
                ),
              
                SizedBox(height: 40.h,),
                 Container(
                width: 300.w,
                height: 50,
                margin: EdgeInsets.only(left: 30,right: 30),
                child: TextButton(
                  onPressed: (){  
                         print(amount!);

                       
                  },
                  child: Text(
                    "Confirmer",
                    style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                  style: TextButton.styleFrom(
                    backgroundColor: amount!.length > 0 ? kPrimaryColor : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    
                    )
                  ),
                ),
              )
                
                
              ],
            ),
          )))
      ..show();
  }
}