import 'package:cmedha/Navigation.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  String? _chosenValue1;
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController require = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left,
              size: 25,
              color: white,
            ),
          ),
          titleSpacing: 10,
          leadingWidth: 30,
          shadowColor: black,
          backgroundColor: Blue,
          title: text20('Course Feedback', white),
          elevation: 3,
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'FirstName',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
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
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
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
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
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
                'Feedback',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
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
                      return "Please enter Feedback";
                    }

                    return null;
                  },
                  controller: require,
                  autocorrect: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter your Requirement",
                    hintStyle: const TextStyle(color: grey, fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Blue,
                  minimumSize: const Size.fromHeight(44),
                ),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(builder: (context) => Navigation()));
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //       builder: (context) => Navigation()));
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: white,
                    fontSize: 18,
                    fontFamily: 'IBMPlexSans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
