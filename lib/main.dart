import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:himalyan_bank_flutter_card_payment/payment_contoller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: EasyLoading.init(),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController bankPaymentLink = new TextEditingController();
  TextEditingController officeId = new TextEditingController();
  TextEditingController BankApiKey = new TextEditingController();
  TextEditingController cardNumber = new TextEditingController();
  TextEditingController decimalPlaces = new TextEditingController();
  TextEditingController cardExpiryMMYY = new TextEditingController();
  TextEditingController cvvCode = new TextEditingController();
  TextEditingController paymentType = new TextEditingController();
  TextEditingController paymentCategory = new TextEditingController();
  TextEditingController amountText = new TextEditingController();
  TextEditingController payerName = new TextEditingController();
  TextEditingController currencyCode = new TextEditingController();
  TextEditingController amount = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bankPaymentLink.text =
        "https://core.demo-paco.2c2p.com/api/1.0/Payment/NonUi";
    officeId.text = "9103332177";
    BankApiKey.text = "d64fcd5489eb42bebe46c5fcd0cf19be";
    decimalPlaces.text = "2";
    cardNumber.text = "5241720000002205";
    cardExpiryMMYY.text = "1225";
    cvvCode.text = "703";
    paymentType.text = "CC";
    paymentCategory.text = "ECOM";
    amountText.text = "2000";
    payerName.text = "SUSAN TEST";
    currencyCode.text = "NPR";
    amount.text = "2000";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(label: Text("bankPaymentLink")),
                  controller: bankPaymentLink,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(label: Text("officeId")),
                  controller: officeId,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(label: Text("BankApiKey")),
                  controller: BankApiKey,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(label: Text("cardNumber")),
                  controller: cardNumber,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(label: Text("decimalPlaces")),
                  controller: decimalPlaces,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(label: Text("cardExpiryMMYY")),
                  controller: cardExpiryMMYY,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(label: Text("cvvCode")),
                  controller: cvvCode,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(label: Text("paymentType")),
                  controller: paymentType,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(label: Text("paymentCategory")),
                  controller: paymentCategory,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(label: Text("amountText")),
                  controller: amountText,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(label: Text("payerName")),
                  controller: payerName,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(label: Text("currencyCode")),
                  controller: currencyCode,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(label: Text("amount")),
                  controller: amount,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pay,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void pay() {
    PaymentController.pay(
        bankPaymentLink: bankPaymentLink.text,
        officeId: officeId.text,
        BankApiKey: BankApiKey.text,
        cardNumber: cardNumber.text,
        decimalPlaces: decimalPlaces.text,
        cardExpiryMMYY: cardExpiryMMYY.text,
        cvvCode: cvvCode.text,
        paymentType: paymentType.text,
        paymentCategory: paymentCategory.text,
        amountText: amountText.text,
        payerName: payerName.text,
        currencyCode: currencyCode.text,
        amount: amount.text);
  }
}
