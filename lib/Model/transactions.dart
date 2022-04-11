
import 'package:flutter/material.dart';
import 'package:nafa_money/Model/payment_model.dart';

List<PaymentModel> getPaymentsCard() {
  List<PaymentModel> paymentCards = [
    PaymentModel(Icons.receipt, Color(0xFFffd60f), "Florenti Restaurant",
        "07-23", "20.04", 251.00, -1),
    PaymentModel(Icons.monetization_on, Color(0xFFff415f), "Transfer To Anna",
        "07-23", "14.01", 64.00, -1),
    PaymentModel(Icons.location_city, Color(0xFF50f3e2), "Loan To Sanchez",
        "07-23", "10.04", 1151.00, -1),
    PaymentModel(Icons.train, Colors.green, "Train ticket to Turkey", "07-23",
        "09.04", 37.00, -1),
         PaymentModel(Icons.train, Colors.green, "Train ticket to Turkey", "07-23",
        "09.04", 37.00, -1),
         PaymentModel(Icons.train, Colors.green, "Train ticket to Turkey", "07-23",
        "09.04", 37.00, -1),
         PaymentModel(Icons.train, Colors.green, "Train ticket to Turkey", "07-23",
        "09.04", 37.00, -1),
         PaymentModel(Icons.train, Colors.green, "Train ticket to Turkey", "07-23",
        "09.04", 37.00, -1),
         PaymentModel(Icons.train, Colors.green, "Train ticket to Turkey", "07-23",
        "09.04", 37.00, -1),
  ];

  return paymentCards;
}
