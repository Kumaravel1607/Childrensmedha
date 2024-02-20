import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/Payment/Confirm.dart';
import 'package:flutter/material.dart';

class PaypalScreen extends StatefulWidget {
  const PaypalScreen({super.key});

  @override
  State<PaypalScreen> createState() => _PaypalScreenState();
}

class _PaypalScreenState extends State<PaypalScreen> {
  bool? _checkbox = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                  fillColor: MaterialStateProperty.all(
                      _checkbox == true ? Blue : greylite),
                  activeColor: green,
                  value: _checkbox,
                  onChanged: (val) {
                    setState(() {
                      _checkbox = val;
                    });
                  }),
              const Text(
                'Cash on Delivery',
                style: TextStyle(
                    color: black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Blue,
            minimumSize: const Size.fromHeight(44),
          ),
          onPressed: () {
            Navigator.of(context, rootNavigator: true)
                .push(MaterialPageRoute(builder: (context) => Confirm()));
            //   Navigator.of(context).push(MaterialPageRoute(
            //       builder: (context) => Navigation()));
          },
          child: const Text(
            'Confirm and Continue',
            style: TextStyle(
              color: white,
              fontSize: 18,
              fontFamily: 'IBMPlexSans',
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}
