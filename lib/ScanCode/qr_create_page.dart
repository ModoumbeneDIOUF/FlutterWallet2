import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCreatePage extends StatefulWidget {
  @override
  _QRCreatePageState createState() => _QRCreatePageState();
}

class _QRCreatePageState extends State<QRCreatePage> {

  final controller = TextEditingController();

   String encryptedtext = '';
  String decryptedtext = 'Decrypted Text';
  PlatformStringCryptor? cryptor;
  String final_key = '';

   void encrypt() async {
    cryptor = PlatformStringCryptor();
    final salt = await cryptor!.generateSalt();
    String key = await cryptor!.generateKeyFromPassword(controller.text, salt);
    String encrypted = await cryptor!.encrypt(controller.text, key);

    setState(() {
      final_key = key;
      encryptedtext = encrypted;
      print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
      print(encryptedtext);
    });
  }

  void decrypt() async {
    try {
      String decrypted = await cryptor!.decrypt(encryptedtext, final_key);
      setState(() {
        decryptedtext = decrypted;
         print(decryptedtext);
          print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
      });
    } on MacMismatchException {
      
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QrImage(
                  //data: encryptedtext,
                  data: controller.text,
                  size: 200,
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(child: buildTextField(context)),
                    const SizedBox(width: 12),
                    FloatingActionButton(
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Icon(Icons.done, size: 30),
                      onPressed: ()  {
                        setState(() {});
                       // encrypt();
                        //decrypt();
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildTextField(BuildContext context) => TextField(
        controller: controller,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          hintText: 'Enter the data',
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      );
}