import 'package:cmedha/Navigation.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:flutter/material.dart';

class Enquiry extends StatefulWidget {
  const Enquiry({super.key});

  @override
  State<Enquiry> createState() => _EnquiryState();
}

class _EnquiryState extends State<Enquiry> {
  String? _chosenValue1;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController require = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          'FirstName',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          // onChanged: (value) {
          //   context
          //       .read<LoginBloc>()
          //       .add(EmailEvent(value));
          // },

          keyboardType: TextInputType.text,
          validator: (String? value) {
            if (value!.isEmpty) {
              return "Please enter FirstName";
            }

            return null;
          },
          controller: firstname,
          autocorrect: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Blue, width: 2)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: box),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Blue, width: 2),
            ),
            contentPadding:
                const EdgeInsets.only(left: 24, top: 14, bottom: 13),
            filled: true,
            fillColor: Colors.white,
            hintText: "Enter your firstname",
            hintStyle: const TextStyle(color: grey, fontSize: 14),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'LastName',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          // onChanged: (value) {
          //   context
          //       .read<LoginBloc>()
          //       .add(EmailEvent(value));
          // },

          keyboardType: TextInputType.text,
          validator: (String? value) {
            if (value!.isEmpty) {
              return "Please enter LastName";
            }

            return null;
          },
          controller: lastname,
          autocorrect: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Blue, width: 2)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: box),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Blue, width: 2),
            ),
            contentPadding:
                const EdgeInsets.only(left: 24, top: 14, bottom: 13),
            filled: true,
            fillColor: Colors.white,
            hintText: "Enter your lastname",
            hintStyle: const TextStyle(color: grey, fontSize: 14),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Phone Number',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          // onChanged: (value) {
          //   context
          //       .read<LoginBloc>()
          //       .add(EmailEvent(value));
          // },

          keyboardType: TextInputType.text,
          validator: (String? value) {
            if (value!.isEmpty) {
              return "Please enter PhoneNumber";
            }

            return null;
          },
          controller: phone,
          autocorrect: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Blue, width: 2)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: box),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Blue, width: 2),
            ),
            contentPadding:
                const EdgeInsets.only(left: 24, top: 14, bottom: 13),
            filled: true,
            fillColor: Colors.white,
            hintText: "Enter your phone number",
            hintStyle: const TextStyle(color: grey, fontSize: 14),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'City',
          style:
              TextStyle(color: dash, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 50,
          child: DropdownButtonFormField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(left: 20, top: 14, right: 20),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: box),
                  borderRadius: BorderRadius.circular(5)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Blue),
                  borderRadius: BorderRadius.circular(5)),
              hintText: 'City',
              // hintText: 'Date-Month-Year',

              hintStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: red, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: red, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            // border: OutlineInputBorder(
            //   borderRadius: const BorderRadius.all(
            //     const Radius.circular(10),
            //   ),
            // ),
            //               ),
            // decoration: InputDecoration(
            //   enabledBorder: OutlineInputBorder(
            //     borderSide: BorderSide(
            //         color: Colors.grey, width: 1), //<-- SEE HERE
            //   ),
            //   focusedBorder: OutlineInputBorder(
            //     borderSide: BorderSide(
            //         color: Colors.black, width: 2), //<-- SEE HERE
            //   ),
            //   filled: true,
            //   // fillColor: Colors.greenAccent,
            // ),

            // dropdownColor: greylite,
            value: _chosenValue1,
            onChanged: (value) {
              setState(() {
                _chosenValue1 = value;
              });
            },
            items: <String>[
              'Chennai',
              'Dharmapuri',
              'Salem',
              'Krishnagiri',
              'Erode',
              'Coimbatore',
              'Namakkal'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Requirement',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 90,
          child: TextFormField(
            // onChanged: (value) {
            //   context
            //       .read<LoginBloc>()
            //       .add(EmailEvent(value));
            // },

            keyboardType: TextInputType.text,
            validator: (String? value) {
              if (value!.isEmpty) {
                return "Please enter Requirement";
              }

              return null;
            },
            controller: require,
            autocorrect: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Blue, width: 2)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: box),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Blue, width: 2),
              ),
              contentPadding:
                  const EdgeInsets.only(left: 24, top: 14, bottom: 13),
              filled: true,
              fillColor: Colors.white,
              hintText: "Enter your Requirement",
              hintStyle: const TextStyle(color: grey, fontSize: 14),
            ),
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
                .push(MaterialPageRoute(builder: (context) => Navigation()));
            //   Navigator.of(context).push(MaterialPageRoute(
            //       builder: (context) => Navigation()));
          },
          child: const Text(
            'Submit',
            style: TextStyle(
              color: white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}
