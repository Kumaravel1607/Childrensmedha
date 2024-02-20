import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return CreditCardPageState();
  }
}

class CreditCardPageState extends State<CreditCardPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CreditCardWidget(
          cardBgColor: const Color.fromARGB(255, 145, 148, 42),
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: isCvvFocused,
          obscureCardNumber: true,
          obscureCardCvv: true,
          onCreditCardWidgetChange: (CreditCardBrand) {},
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CreditCardForm(
                  formKey: formKey,
                  onCreditCardModelChange: onCreditCardModelChange,
                  obscureCvv: true,
                  obscureNumber: true,
                  inputConfiguration: const InputConfiguration(
                    cardNumberDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                    ),
                    expiryDateDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Expired Date',
                      hintText: 'XX/XX',
                    ),
                    cvvCodeDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CVV',
                      hintText: 'XXX',
                    ),
                    cardHolderDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Card Holder Name',
                    ),
                  ),
                  cardHolderName: '',
                  cardNumber: '',
                  cvvCode: '',
                  expiryDate: '',
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Blue,
                      minimumSize: const Size.fromHeight(44),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print('valid!');
                        _showValidDialog(context, "Valid",
                            "Your card successfully valid !!!");
                      } else {
                        print('invalid!');
                      }
                    },
                    // onPressed: () {
                    //   Navigator.of(context, rootNavigator: true)
                    //       .push(MaterialPageRoute(builder: (context) => Confirm()));
                    //   //   Navigator.of(context).push(MaterialPageRoute(
                    //   //       builder: (context) => Navigation()));
                    // },
                    child: const Text(
                      'Confirm and Continue',
                      style: TextStyle(
                        color: white,
                        fontSize: 18,
                        fontFamily: 'IBMPlexSans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  _showValidDialog(
    BuildContext context,
    String title,
    String content,
  ) {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 227, 229, 231),
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
                child: const Text(
                  "Ok",
                  style: TextStyle(fontSize: 18, color: Colors.cyan),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
