import 'dart:convert';

import 'package:cmedha/Api/Api.dart';
import 'package:cmedha/Models/state_model.dart';
import 'package:cmedha/Navigation.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Enquiry extends StatefulWidget {
  const Enquiry({super.key});

  @override
  State<Enquiry> createState() => _EnquiryState();
}

class _EnquiryState extends State<Enquiry> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController require = TextEditingController();
  TextEditingController email = TextEditingController();

  List<StateModel> dropdownItems = [];

  String? _chosenValue1;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var url = state;
    var urlparse = Uri.parse(url);

    try {
      http.Response response = await http.get(urlparse);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData.containsKey("state")) {
          final List<dynamic> data = responseData["state"];

          setState(() {
            dropdownItems =
                data.map((item) => StateModel.fromJson(item)).toList();
            isLoading = false;
          });
        } else {
          print('Response does not contain the "states" key.');
        }
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
        throw Exception('Problem in fetching data');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Problem in fetching data');
    }
  }

  Future<void> saveStateId(int stateId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('state_id', stateId);
  }

  Future<void> request() async {
    final session = await SharedPreferences.getInstance();
    var stateId = session.getInt('savestate_id');

    Map<String, dynamic> data = {
      'first_name': firstname.text,
      'last_name': lastname.text,
      'email': email.text,
      'mobile': phone.text,
      'state_id': stateId.toString(),
      'message': require.text
    };

    var url = enquiry;
    var urlparse = Uri.parse(url);

    try {
      http.Response response = await http.post(
        urlparse,
        body: data,
      );
      print(response);
      var response_data = json.decode(response.body.toString());

      if (response.statusCode == 200) {
        print(response_data);
        toastInfo(mesg: 'success'.toString());

        // Navigator.of(context, rootNavigator: true).push(
        //   MaterialPageRoute(
        //     builder: (context) => Navigation(
        //       name: '',
        //     ),
        //   ),
        // );
      } else {
        toastInfo(mesg: 'failed'.toString());
      }
    } catch (error) {
      print('Error: $error');
      // Handle the error appropriately
    }
  }

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
          'Email',
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
              return "Please enter email";
            }

            return null;
          },
          controller: email,
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
            hintText: "Enter your email",
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
          'State',
          style:
              TextStyle(color: dash, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
            height: 50,
            child: DropdownButtonFormField(
              // Your existing dropdown code
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(left: 20, top: 14, right: 20),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: box),
                    borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: Blue),
                    borderRadius: BorderRadius.circular(5)),
                hintText: 'State',
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
              onChanged: (StateModel? value) async {
                setState(() {
                  if (value != null) {
                    _chosenValue1 = value.id.toString();
                  } else {
                    _chosenValue1 =
                        null; // If value is null, set chosenValue1 to null
                  }
                });

                // Save the selected state ID in shared preferences
                if (value != null) {
                  await saveStateId(value.id);
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setInt('savestate_id', value.id);
                }
              },
              // value: _chosenValue1,
              // onChanged: (value) {
              //   setState(() {
              //     _chosenValue1 = value as String?;
              //   });

              //   // Save the selected state ID in shared preferences
              // },
              items: dropdownItems
                  .map<DropdownMenuItem<StateModel>>((StateModel value) {
                return DropdownMenuItem<StateModel>(
                  value: value,
                  child: Text(value.stateName.toString()),
                );
              }).toList(),
            )),
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
            request();
            // Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
            //     builder: (context) => Navigation(
            //           name: '',
            //         )));
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
