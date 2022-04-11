import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:nafa_money/Model/contact_favori.dart';
import 'package:nafa_money/Screens/achatCredit/buyCreditSum.dart';
import 'package:nafa_money/Screens/api/db_helper.dart';
import 'package:nafa_money/localization/language_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class HomeAchatCredit extends StatefulWidget {
  const HomeAchatCredit({ Key? key }) : super(key: key);

  @override
  _HomeAchatCreditState createState() => _HomeAchatCreditState();
}

class _HomeAchatCreditState extends State<HomeAchatCredit> {

  bool _permissionDenied = false;

  List <Contact>? _search ;
   

 //var items = <Contact>[]; 
 List<Contact>? items = [];

 @override
  void initState() {
    super.initState();
   
    _fetchContacts();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
       backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
             getTranslated(context,"buy_credit_home_toolbar_text").toString(),
              style: TextStyle(color: Colors.black,),
              ),
              leading: IconButton(
                 icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                 onPressed: () => Navigator.of(context).pop(),
                 ), 
            ),

            body: _body(),
    );
  }

   Widget _body() {
    if (_permissionDenied) return Center(child: Text('Permission denied'));
    //if (items!.isEmpty) return Center(child: CircularProgressIndicator());
    if(items == null) print("viiiiiiiiiiiide");
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Container(
          padding: EdgeInsets.only(top: 2.h,left: 3.h,right: 3.h),
          margin: EdgeInsets.only(top:3.h),

          child: TextField(
            decoration: InputDecoration(
             // prefix: Icon(Icons.search),
              labelText: getTranslated(context,"buy_credit_home_search_hint_text").toString(),
            ),
            onChanged: (value){
                filterContact(value.toLowerCase());
            },
          ),
        ),
        SizedBox(height: 3.h,),
        Container(
          child: ListTile(
              onTap: (){

                ;
              },
              title: Text(
                getTranslated(context,"buy_credit_home_to_number_text").toString(),
                style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold),
                ),
              leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/add_contact.png")
                    )
          ),

        ),
      
       
       Container(
          margin: EdgeInsets.only(top: 2.h,left: 3.h),
          child: Text(getTranslated(context,"buy_credit_home_favorite_text").toString(),)),
           SizedBox(height: 5.h,),

       Expanded(
            child: FutureBuilder <List<ContactFavories>> (
              future: DatabaseHelper.instance.getContacts(),
              builder: (BuildContext context,
                    AsyncSnapshot<List<ContactFavories>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text(getTranslated(context,"loading_contact_text").toString()));
                  }
                  print(snapshot.data!);
                  return snapshot.data!.isEmpty  
                  ? Center(child: Text(getTranslated(context,"no_favorite_text").toString())) 
                  :ListView(
                    children: snapshot.data!.map((contactFavories) {
                      return InkWell(

                        onTap: (){
                            Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => BuyCreditAmount(
                                name: contactFavories.name,
                                number:contactFavories.phone
                            )));
                        },
                        child: ListTile(
                          
                            title: Text(contactFavories.name),
                             leading: CircleAvatar(
                             backgroundImage: AssetImage("assets/images/profil.jpg")
                                           )
                            
                        ),
                      );
                    }).toList(),
                  );
                }),
          ),

      SizedBox(height: 5.h,),
         Container(
          margin: EdgeInsets.only(top: 2.h,left: 3.h),
          child: Text(getTranslated(context,"buy_credit_home_contact_text").toString())),
      SizedBox(height: 5.h,),
        Expanded(
          child: ListView.builder(
            
            itemCount: items!.length,
            itemBuilder: (context,index){

              print(items![index].phones);
              return InkWell(
                
                onTap: () async {
                  
                  final fullContact = await FlutterContacts.getContact(items![index].id);
                  print(fullContact!.phones.first.normalizedNumber);

                  await DatabaseHelper.instance.add(
                   ContactFavories(name: fullContact.name.first+" "+fullContact.name.last,phone:fullContact.phones.first.number),
                   );

                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => BuyCreditAmount(
                                name: fullContact.name.first+" "+fullContact.name.last,
                                number:fullContact.phones.first.normalizedNumber,
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
            
            )  
          ),
          
    
      
      ],
    );

    
  }
}