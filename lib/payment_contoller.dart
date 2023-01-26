import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
// import 'package:network_info_plus/network_info_plus.dart';
import 'package:uuid/uuid.dart';

class PaymentController {
  static Future<bool> pay({
    required String bankPaymentLink,
    required String officeId,
    required String BankApiKey,
    required String cardNumber,
    required String decimalPlaces,
    required String cardExpiryMMYY,
    required String cvvCode,
    required String paymentType,
    required String paymentCategory,
    required String amountText,
    required String payerName,
    required String currencyCode,
    required String amount,
  }) async {
    EasyLoading.show(status: "Loading...");

    var url = Uri.parse(bankPaymentLink);

    DateTime time = DateTime.now();
    var uuid = Uuid();

    var data = {
      "apiRequest": {
        "requestMessageID": uuid.v4(),
        "requestDateTime": "${time.toLocal()}",
        "language": "en-US"
      },
      "officeId": officeId,
      "orderNo": "${time.millisecondsSinceEpoch}",
      "productDescription": "${time.toLocal()}",
      "paymentType": paymentType,
      "paymentCategory": paymentCategory,
      "creditCardDetails": {
        "cardNumber": cardNumber,
        "cardExpiryMMYY": cardExpiryMMYY,
        "cvvCode": cvvCode,
        "payerName": payerName
      },
      "storeCardDetails": {
        "storeCardFlag": "N",
        "storedCardUniqueID": "{{guid}}"
      },
      "installmentPaymentDetails": {
        "ippFlag": "N",
        "installmentPeriod": 0,
        "interestType": null
      },
      "mcpFlag": "N",
      "request3dsFlag": "N",
      "transactionAmount": {
        "amountText": amountText,
        "currencyCode": currencyCode,
        "decimalPlaces": decimalPlaces,
        "amount": amount
      },
      "notificationURLs": {
        "confirmationURL": "http:\/\/example-confirmation.com",
        "failedURL": "http:\/\/example-failed.com",
        "cancellationURL": "http:\/\/example-cancellation.com",
        "backendURL": "http:\/\/example-backend.com"
      },
      "deviceDetails": {
        "browserIp": "1.0.0.1",
        "browser": "Postman Browser",
        "browserUserAgent": "PostmanRuntime\/7.26.8 - not from header",
        "mobileDeviceFlag": "N"
      },
      "customFieldList": [
        {"fieldName": "TestField", "fieldValue": "This is test"}
      ]
    };
    var response = await http.post(url, body: json.encode(data), headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json',
      'apiKey': BankApiKey,
    });

    if (response.statusCode == 200) {
      EasyLoading.showSuccess("Payment Success");

      return true;
    } else {
      EasyLoading.showError(response.body.toString());
    }
    return false;
  }
}
