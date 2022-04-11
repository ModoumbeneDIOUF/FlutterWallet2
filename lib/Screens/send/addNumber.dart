
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:nafa_money/Model/contact_favori.dart';
import 'package:nafa_money/Screens/api/db_helper.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:nafa_money/Screens/send/sendManySum.dart';
import 'package:nafa_money/colors.dart';
import 'package:nafa_money/localization/language_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class EnvoyerAUnNumero extends StatefulWidget {
  final String transfertType;

  const EnvoyerAUnNumero({Key? key, required this.transfertType})
      : super(key: key);

  @override
  _EnvoyerAUnNumeroState createState() => _EnvoyerAUnNumeroState();
}

class _EnvoyerAUnNumeroState extends State<EnvoyerAUnNumero> {


   bool _permissionDenied = false;
   int _noRecent = 0;

  List <Contact>? _search ;
   

 //var items = <Contact>[]; 
 List<Contact>? items = [];


 @override
  void initState() {
    super.initState();
   
    _fetchContacts();
    
    print( DatabaseHelper.instance.getContacts().then((value) => {
     
     if( value.length == 0){
      
        _noRecent = 0,
         print(_noRecent),
     }
      else if( value.length == 1){
      
        _noRecent = 1,
         print(_noRecent),
     }
      else if( value.length == 2){
      
        _noRecent = 2,
         print(_noRecent),
     }
      else if( value.length == 3){
      
        _noRecent = 3,
         print(_noRecent),
     }

    }));
  }

  Future _fetchContacts() async {
    if (!await FlutterContacts.requestPermission(readonly: true)) {
      setState(() => _permissionDenied = true);
    } else {
      final contacts = await FlutterContacts.getContacts();
      setState(() => items = contacts);
    }
  }

  void filterContact(String searchTerm){

    List <Contact>? tempSearch = [];

    tempSearch.addAll(items!);
    if(searchTerm.isNotEmpty){
       List <Contact> tmpList = [];
       tempSearch.forEach((element) {
          if(element.displayName.toLowerCase().contains(searchTerm)){
              tmpList.add(element);
          }
       });

       setState(() {
         items!.clear();
         items!.addAll(tmpList);
       });

       return;
    }
    else{
      setState(() {
        
         items!.clear();
         _fetchContacts();
         items!.addAll(items!);
       });
    }
  }

  TextEditingController phonenumber = TextEditingController();
  TextEditingController amount = TextEditingController();
  String initialCountry = 'SN';

  PhoneNumber number = PhoneNumber(isoCode: 'SN');

  String _phonenumber = "";
  String _amount = "";

  List<String> countries = ['NG', 'GH', 'BJ' 'TG', 'CI'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: kPrimaryColor,
        title: Text(
          widget.transfertType,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Container(
              padding: EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
              child: TextField(
                controller: phonenumber,
                inputFormatters: [
                  new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                ],
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  // prefix: Icon(Icons.search),
                  labelText:
                      getTranslated(context, "phone_hint_text").toString(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (value) {
                  setState(() {
                    _phonenumber = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w),
              child: TextField(
                controller: amount,
                inputFormatters: [
                  new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                ],
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  // prefix: Icon(Icons.search),
                  labelText: getTranslated(context, "amout_text").toString(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _amount = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            InkWell(
              onTap: () {},
              child: Center(
                child: InkWell(
                  onTap: () {
                    print("choise contac");
                    yyBottomSheetDialog(context);
                  },
                  child: Container(
                    width: 165.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5,
                            //spreadRadius: 5
                          )
                        ]),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.contacts_sharp,
                          color: kPrimaryColor,
                          size: 18.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          getTranslated(context, "choice_contact_text")
                              .toString(),
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w),
              child: Text(
                getTranslated(context, "recent_beneficiaries_text")!.toString(),
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),

            Container(
             margin: EdgeInsets.only(left: 3.w, right: 3.w),
                 child: FutureBuilder <List<ContactFavories>> (
              future: DatabaseHelper.instance.getContacts(),
              builder: (BuildContext context,
                    AsyncSnapshot<List<ContactFavories>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text(getTranslated(context,"loading_contact_text").toString()));
                  }
                  print(snapshot.data!);
                  return snapshot.data!.isEmpty  
                  ? Center(child: Text(
                    getTranslated(context,"no_favorite_text").toString(),
                    style: TextStyle(color: Colors.black,fontSize: 17.sp),
                    )) 
                  :ListView(
                    shrinkWrap: true,
                     
                    children: snapshot.data!.map((contactFavories) {
                      return  Column(
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                
                                 phonenumber.text = contactFavories.phone.replaceAll(' ', '').toString();
                                _phonenumber = contactFavories.phone.replaceAll(' ', '').toString();
                              });
                              print(contactFavories.phone);
                            },
                            child: Container(
                                        width: 320.w,
                                        height: 80.h,
                                      
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(6),
                                            border: Border.all(color: kPrimaryColor),
                                            boxShadow: [
                                              BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 5,
                            //spreadRadius: 5
                                              )
                                            ]),
                                       
                                          child: ListTile(
                                            title: Text(contactFavories.name),
                                            subtitle: Text(contactFavories.phone),
                                            leading: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 0.3),
                                              child: Material(
                            elevation: 0,
                            shape: CircleBorder(),
                            // shadowColor: widget.payment.color.withOpacity(0.4),
                            child: Container(
                              height:60.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Icon(
                                    Icons.person_outline,
                                    color: kPrimaryColor,
                                  )),
                            ),
                                              ),
                                            ),
                                          ),
                                      
                                      ),
                          ),
            SizedBox(height: 20.h,)
                        ],
                      );
                    },).toList(),
                  );
                }),
            ),
          
    
         
          ],
          
        ),
            Positioned(
              right: 10.w,
              left: 10.w,
          top: 700.h,
          child: 
            Center(
              child: Container(
                
                width: 300.w,
                height: 60.h,
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: _phonenumber != "" && _amount != ""
                          ? kPrimaryColor
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      shadowColor: Colors.black,
                      elevation: 5),
                  child: Text(
                    getTranslated(context, "send_button_text").toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: _phonenumber != "" && _amount != ""
                      ? () {
                          //  Navigator.push(
                          //   context,
                          //   new MaterialPageRoute(
                          //       builder: (context) => SendAmount(
                          //           name: name.text,
                          //           number: numero,
                          //       )));
                        }
                      : null,
                ),
              ),
            ),
        )
        ],
      ),
    );
  }

  YYDialog yyBottomSheetDialog(BuildContext context) {
    return YYDialog().build(context)
      ..gravity = Gravity.bottom
      ..gravityAnimationEnable = true
      ..backgroundColor = Colors.transparent
      ..duration = Duration(seconds: 2)
      ..widget(Container(
          width: 330.w,
          height: 700.h,
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
                    getTranslated(context, "contact_list_text").toString(),
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
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
               
             Container(
          padding: EdgeInsets.only(top: 0.h,left: 3.h,right: 3.h),
          margin: EdgeInsets.only(top:3.h),

          
        ),
                 
                 SizedBox(
                   height: 630.h,
                  child: ListView.separated(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 85.0),
                            child: Divider(),
                          );
                        },
                        padding: EdgeInsets.zero,
                        itemCount: items!.length,
                        itemBuilder: (context,index) {
                          return InkWell(
                
                onTap: () async {
                  
                  final fullContact = await FlutterContacts.getContact(items![index].id);
                  print(fullContact!.phones.first.normalizedNumber);

                  await DatabaseHelper.instance.add(
                   ContactFavories(name: fullContact.name.first+" "+fullContact.name.last,phone:fullContact.phones.first.number ),
                   );

                  setState(() {
                    phonenumber.text = fullContact.phones.first.number.replaceAll(' ', '').toString();
                    _phonenumber = fullContact.phones.first.number.replaceAll(' ', '').toString();
                  });
                   Navigator.pop(context);
                  //amount.text = fullContact.phones.first.number;
                },
                child: ListTile(
                    
                    title: Text('${items![index].displayName}'),
                    //subtitle: Text('${items![index].id}'),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/profil.jpg")
                    )
                ),
              );
                        },
                      ),
               ),
               
               
              ],
            ),
          )))
      ..show();
  }

  Widget _bodyContact() {
    if (_permissionDenied) return Center(child: Text('Permission denied'));
    //if (items!.isEmpty) return Center(child: CircularProgressIndicator());
    if(items == null) print("viiiiiiiiiiiide");
    return 
       ListView.builder(
            shrinkWrap: true,
                     
            itemCount: items!.length,
            itemBuilder: (context,index){

              print(items![index].phones);
              return InkWell(
                
                onTap: () async {
                  
                  final fullContact = await FlutterContacts.getContact(items![index].id);
                  print(fullContact!.phones.first.normalizedNumber);

                  await DatabaseHelper.instance.add(
                   ContactFavories(name: fullContact.name.first+" "+fullContact.name.last,phone:fullContact.phones.first.number ),
                   );

                   Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => SendAmount(
                                name: fullContact.name.first+" "+fullContact.name.last,
                                number: fullContact.phones.first.normalizedNumber,
                            )));
                },
                child: ListTile(
                    
                    title: Text('${items![index].displayName}'),
                    //subtitle: Text('${items![index].id}'),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/profil.jpg")
                    )
                ),
              );
            }
            
            ) ; 
      
      

    
  }
}
