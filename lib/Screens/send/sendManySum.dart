import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:nafa_money/Screens/Dashboard/home_dashbord.dart';
import 'package:nafa_money/localization/language_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';


class SendAmount extends StatefulWidget {
  final String name;
  final String number;

  const SendAmount({Key? key, required this.name, required this.number})
      : super(key: key);

  @override
  _SendAmountState createState() => _SendAmountState();
}

class _SendAmountState extends State<SendAmount> {

  ProgressDialog? progressDialog ;


  TextEditingController amountTosend = TextEditingController();

   int _amountTosend = 0;
   int _amountToReceive =0;
    bool _validateAmount = true;

  @override
  Widget build(BuildContext context) {

      progressDialog = ProgressDialog(context);
      progressDialog!.style(
      message: getTranslated(context, "operation_in_progress").toString()

    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          getTranslated(context, "send_money_home_toolbar_text").toString(),
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Container(
              padding: EdgeInsets.only(left: 3.h, right: 3.h),
              margin: EdgeInsets.only(top: 3.h),
              child: Text(
                getTranslated(context, "to_text").toString(),
                style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400),
                )),
            Container(
              padding: EdgeInsets.only(left: 3.h, right: 3.h),
              //margin: EdgeInsets.only(top: 3.h),
              child: Text(
                widget.name,
                style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold),
                )),
            Container(
              padding: EdgeInsets.only( left: 3.h, right: 3.h),
              
              child: TextField(
                enabled: false,
                readOnly: true,
                controller: TextEditingController(text: widget.number),
                decoration: InputDecoration(
                    // prefix: Icon(Icons.search),
                  ),
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              padding: EdgeInsets.only(top: 0.h, left: 3.h, right: 3.h),
              child: TextField(
                inputFormatters: [new WhitelistingTextInputFormatter(RegExp("[0-9]")),],
                textInputAction: TextInputAction.done,
                 keyboardType: TextInputType.number,
                controller: amountTosend,
                decoration: InputDecoration(
                  // prefix: Icon(Icons.search),
                  labelText: getTranslated(context, "amout_send_hint_text").toString(),
                  //errorText: !_validateAmount ? getTranslated(context, "amout_errr_text").toString() : null,
                ),
                onChanged: (value) {
                  setState(() {
                   
                    _amountTosend = int.tryParse(value)!;
                      print(_amountTosend);

                    if(_amountTosend < 5){
                      _validateAmount = false;
                      print("inferieur à 5");
                    }
                   
                     _amountToReceive = (_amountTosend - (_amountTosend * 1 / 100)).toInt();
                    
                    print(_amountToReceive);
                  },
                  
                  );
                },
                
                
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              padding: EdgeInsets.only(top: 0.h, left: 3.h, right: 3.h),
              child: TextField(
                enabled: false,
                //readOnly: true,
                controller: TextEditingController(text: _amountToReceive.toString()),
                decoration: InputDecoration(
                  // prefix: Icon(Icons.search),
                  labelText: getTranslated(context, "amout_receive_hint_text")
                      .toString(),
                ),
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 3.h,),
            Center(
              child:Text(
                getTranslated(context, "costs_text").toString()+" = 5%", 
                style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
                )
            ),

            SizedBox(height: 38.h,),
                
                Container(
                  margin: EdgeInsets.only(left: 3.h,right: 3.h),
                  width: 100.w,
                  height: 7.h,
                  child: TextButton(
                     style:TextButton.styleFrom(
                          backgroundColor: _amountTosend != 0 ? Colors.blueAccent : Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                              shadowColor: Colors.black,
                              elevation: 5
                              ),
                    child: Text(
                       getTranslated(context,"send_button_text").toString(),
                      style: TextStyle(color: Colors.white,fontSize: 13.sp),
                      ),
                    onPressed: amountTosend.text != "" ? (){
                          
                      yyBottomSheetDialog(context);
                        
                    } : null,
                    
                  ),
                ),
          ],
        ),
      ),
    );
  }



YYDialog yyBottomSheetDialog(BuildContext context) {
  return YYDialog().build(context)
    ..gravity = Gravity.bottom
    ..gravityAnimationEnable = true
    ..backgroundColor = Colors.transparent
    ..widget(Container(
      width: 95.w,
      height: 40.h,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
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
             
              title: new Text(
               getTranslated(context,"sent_confirmation").toString(),
                style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold,color: Colors.black),
                ),
              trailing: Icon(Icons.close),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              
              title: new Text(getTranslated(context,"dest_text").toString(),),
              trailing: Text(widget.name),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
             
              title: new Text(getTranslated(context,"amout_text").toString(),),
              trailing: Text(_amountTosend.toString()),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 5.h,),
             Container(
                    margin: EdgeInsets.only(left: 3.h,right: 3.h),
                    width: 100.w,
                    height: 7.h,
                    child: TextButton(
                       style:TextButton.styleFrom(
                            backgroundColor: _amountTosend != 0 ? Colors.blueAccent : Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                                shadowColor: Colors.black,
                                elevation: 5
                                ),
                      child: Text(
                         getTranslated(context,"btn_confirm_text").toString(),
                        style: TextStyle(color: Colors.white,fontSize: 13.sp),
                        ),
                      onPressed: amountTosend.text != "" ? (){
                        Navigator.pop(context);    
                        progressDialog!.show();
                            Future.delayed(Duration(seconds: 3)).then((value) {
                            progressDialog!.hide().then((value) {


                             AwesomeDialog(
                              
                            context: context,
                            title: getTranslated(context,"message_thank").toString(),
                            animType: AnimType.TOPSLIDE,
                            width: 400,
                            dialogType: DialogType.SUCCES,
                            btnOkColor: Colors.greenAccent[500],
                            
                            btnOkText: "OK",
                            btnOkIcon: Icons.check_circle,
                            dismissOnTouchOutside: false,

                            btnOkOnPress: () {
                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeDashBord()));
                            
                            },
                           )
                          ..show();

                            } );
                          });
                          
                      } : null,
                      
                    ),
                  ),
             SizedBox(height: 3.h,)
                    ],
        ),
      )
    ))
    
    ..show();
}


YYDialog yyAlertDialogWithScaleIn(BuildContext context) {
  return YYDialog().build(context)
    ..width = 240
    ..borderRadius = 4.0
    ..duration = Duration(milliseconds: 500)
    ..animatedFunc = (child, animation) {
      return ScaleTransition(
        child: child,
        scale: Tween(begin: 0.0, end: 1.0).animate(animation),
      );
    }
    ..text(
      padding: EdgeInsets.all(18.0),
      text: "Confimation",
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
    )
    ..text(
      padding: EdgeInsets.only(left: 18.0, right: 18.0), 
      text: getTranslated(context,"send_button_text").toString() +" "+ _amountTosend.toString() +" "+ getTranslated(context,"to_text").toString().toLowerCase() +" "+ widget.name ,
      color: Colors.grey[500],
      //fontSize: 13.sp,
      //fontWeight: FontWeight.bold
    )
    ..doubleButton(
      padding: EdgeInsets.only(top: 24.0),
      gravity: Gravity.center,
      text1: getTranslated(context,"no_button").toString(),
      color1: Colors.deepPurpleAccent,
      fontSize1: 14.0,
      text2: getTranslated(context,"yes_button").toString(),
      color2: Colors.deepPurpleAccent,
      fontSize2: 14.0,
      onTap1: (){
        print("non");
      },
      onTap2: (){
        print("oui");
      }
    )
    ..borderRadius = 4.0
    ..show();
}

}
