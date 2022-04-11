import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class QRScanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  
  final qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? barcode;
  QRViewController? controller;
  bool flash = false;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble()  async{
   
    super.reassemble();

    if(Platform.isAndroid){
      await controller!.pauseCamera();
    }
    await controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        
        body: Stack(
          alignment: Alignment.center,
          children: [

              buildQrView(context),
              Positioned(
                bottom: 10,
                child: buildResult(),
              ),
              Positioned(
                top: 10,
                child: buildButtonController(),
              )
          ],
        )
      );

 Widget  buildButtonController() => Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [ 
      IconButton(
        icon: Icon(!flash ? Icons.flash_on : Icons.flash_off,color: Colors.white,),
        onPressed: () async {
          await controller?.toggleFlash();
          setState(() => flash = !flash);
        },
      )
    ],
  );
  Widget  buildResult() => Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white24
    ),
    child: Text(
        barcode != null ? "${barcode!.code}" : "Scan a code",
       // maxLines: 3,
      
      ),
  );
   Widget buildQrView(BuildContext context) => QRView(
     key: qrKey, 
     onQRViewCreated: onQRViewCreated,
     overlay: QrScannerOverlayShape(
       cutOutSize: MediaQuery.of(context).size.width * 0.8,
       borderWidth: 10,
       borderLength: 20,
       borderRadius: 10,
       borderColor: Colors.red
     ),
     );

  void onQRViewCreated(QRViewController controller) {

    setState(() => this.controller = controller);

    controller.scannedDataStream
              .listen((barcode) =>setState(() {
                this.barcode = barcode;
                print(barcode.code);
              }) );
  }

 
}
