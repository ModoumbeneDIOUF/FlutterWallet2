import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:nafa_money/Screens/Dashboard/home_dashbord.dart';
import 'package:nafa_money/localization/language_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_dialog/progress_dialog.dart';


class BuyCreditAmount extends StatefulWidget {
  final String name;
  final String number;

  const BuyCreditAmount({Key? key, required this.name, required this.number})
      : super(key: key);

  @override
  _BuyCreditAmountState createState() => _BuyCreditAmountState();
}

class _BuyCreditAmountState extends State<BuyCreditAmount> {

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
          getTranslated(context, "buy_credit_home_toolbar_text").toString(),
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
              padding: EdgeInsets.only(left: 1.h, right: 3.h),
              margin: EdgeInsets.only(top: 3.h),
              child: ListTile(
                onTap: (){
                  print(widget.number.substring(0,2));
                },
                 title: Text(
                   widget.name,
                   style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold),
                   ),
                   
                 subtitle: Text(
                   widget.number,
                   style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400),
                   ),
                  leading: widget.number.substring(0,2)=="77" ||  widget.number.substring(0,2)=="78"  ? CircleAvatar(backgroundImage: AssetImage("assets/images/orange.jpg")):
                           widget.number.substring(0,2)=="76" ? CircleAvatar(backgroundImage: AssetImage("assets/images/free.jpg")):
                            widget.number.substring(0,2)=="70" ? CircleAvatar(backgroundImage: AssetImage("assets/images/expresso.jpg")):
                            widget.number.substring(0,2)=="75" ? CircleAvatar(backgroundImage: AssetImage("assets/images/promobile.jpg"))
                                                                : CircleAvatar(backgroundImage: AssetImage("assets/images/progil.jpg"))
                                                
              ),
            
              ),
           
            Container(
               padding: EdgeInsets.only(left: 3.h, right: 3.h),
              child: Divider(
                color: Colors.black.withOpacity(0.3),
                height: 5.h,
                thickness: 1.5,
                ),
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
                   
                   
                  },
                  
                  );
                },
                 
              ),
            ),


            SizedBox(height: 50.h,),
                
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
                )

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
               getTranslated(context,"paiement_confirmation").toString(),
                style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold,color: Colors.black),
                ),
              trailing: Icon(Icons.close),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              
              title: new Text(getTranslated(context,"phone_hint_text").toString(),),
              trailing: Text("77 123 45 67"),
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

                            btnOkOnPress: ()  {
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

}
