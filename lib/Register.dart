import 'dart:convert';

import 'package:cmedha/Api/Api.dart';
import 'package:cmedha/Login.dart';
import 'package:cmedha/Navigation.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ValueNotifier<bool> joinlinkname = ValueNotifier<bool>(false);
  late FocusNode myFocusNode;

  @override
  void initState() {
    // user();
    // TODO: implement initState
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  joinchanged() async {
    FocusManager.instance.primaryFocus?.unfocus();
    joinlinkname.value = !joinlinkname.value;
    await Future.delayed(const Duration(milliseconds: 500), () {});
    myFocusNode.requestFocus();
  }

  bool _passVisibility = true;
  late String _email, _name;
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phone = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        // scrollPadding: EdgeInsets.only(bottom:40),
        shrinkWrap: true,
        clipBehavior: Clip.antiAlias,
        controller: ScrollController(),
        physics: AlwaysScrollableScrollPhysics(),
        reverse: false,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: true,
            child: Form(key: formkey, child: _body()),
          )
        ],
      ),
    );
  }

  Widget _body() {
    return SizedBox(
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Stack(children: [
              Container(
                color: Blue,
              ),
              Container(
                color: Blue,
              )
            ]),
          ),
          SizedBox(
            height: 710,
            child: Stack(
              children: [
                Container(
                  color: Blue,
                ),
                Container(
                  // height: double.infinity,
                  decoration: const BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'Sign Up ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                joinchanged();
                              },
                              child: Text(
                                ' Email',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                joinchanged();
                              },
                              child: Text(
                                joinlinkname.value ? 'Use email' : "Use phone",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Blue),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: joinlinkname.value ? phone : email,
                          focusNode: myFocusNode,
                          keyboardType: joinlinkname.value
                              ? TextInputType.phone
                              : TextInputType.emailAddress,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return joinlinkname.value
                                  ? 'Please enter email'
                                  : 'Please enter phone number';
                              // "Please enter email";
                            }
                            if (joinlinkname.value
                                ? !RegExp(r'\S+@\S+\.\S+').hasMatch(value)
                                : !RegExp('[azAZ09]').hasMatch(value)) {
                              return joinlinkname.value
                                  ? 'Please enter valid email address'
                                  : 'Please enter valid phone number';
                            }
                            return null;
                          },
                          // onSaved: (input) => baseModel.email = input!,
                          // controller: joinlinkname.value ? phone : email,
                          //     validator: (String? value) {
                          //       if (value!.isEmpty) {
                          //         return "Please enter email";
                          //       }
                          //       if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          //         return "Please enter a valid email address";
                          //       }
                          //       return null;
                          //     },
                          //     // onSaved: (email) {
                          //     //   _email = email!;
                          //     // },
                          //     controller: email,
                          // keyboardType: TextInputType.emailAddress,
                          autocorrect: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: red, width: 2)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Blue, width: 2),
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 10, top: 14, bottom: 13),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: joinlinkname.value
                                  ? 'Enter phone number'
                                  : "Enter your email",
                              // hintText: 'Enter your email',
                              hintStyle:
                                  const TextStyle(color: grey, fontSize: 14),
                              prefixIcon: const Icon(
                                Icons.mail,
                                color: Blue,
                              )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Please enter password";
                            }

                            return null;
                          },
                          // onSaved: (input) => baseModel.password = input!,
                          controller: pass,
                          autocorrect: true,
                          obscureText: _passVisibility,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: red, width: 2)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Blue, width: 2),
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 24, top: 14, bottom: 13),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter your password',
                              hintStyle:
                                  const TextStyle(color: grey, fontSize: 14),
                              suffixIcon: IconButton(
                                color: grey,
                                icon: _passVisibility
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: Blue.withOpacity(0.6),
                                      )
                                    : const Icon(
                                        Icons.visibility,
                                        color: Blue,
                                      ),
                                onPressed: () {
                                  _passVisibility = !_passVisibility;
                                  setState(() {});
                                },
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Blue,
                              )
                              // suffixIcon: const Padding(
                              //   padding: EdgeInsets.only(right: 10),
                              //   child: IconTheme(
                              //     data: IconThemeData(
                              //       color: secondary,
                              //     ),
                              //     child: Icon(
                              //       Icons.visibility_off,
                              //       color: grey,
                              //     ),
                              //   ),
                              // ),
                              ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'FirstName',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Please enter Firstname";
                            }
                            return null;
                          },
                          // onSaved: (name) {
                          //   _name = name!;
                          // },
                          controller: firstname,
                          autocorrect: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: red, width: 2)),
                              contentPadding: const EdgeInsets.only(
                                  left: 24, top: 14, bottom: 13),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Blue, width: 2),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter Firstname',
                              hintStyle:
                                  const TextStyle(color: grey, fontSize: 14),
                              // border: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(24),
                              //   borderSide: BorderSide(
                              //     color: grey,
                              //   ),
                              // ),
                              // prefixIcon: IconTheme(
                              //   data: IconThemeData(
                              //     color: secondary,
                              //   ),
                              //   child: Icon(Icons.email),
                              // ),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Blue,
                              )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'LastName',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Please enter lastname";
                            }
                            return null;
                          },
                          // onSaved: (name) {
                          //   _name = name!;
                          // },
                          controller: lastname,
                          autocorrect: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: red, width: 2)),
                              contentPadding: const EdgeInsets.only(
                                  left: 24, top: 14, bottom: 13),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Blue, width: 2),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter lastname',
                              hintStyle:
                                  const TextStyle(color: grey, fontSize: 14),
                              // border: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(24),
                              //   borderSide: BorderSide(
                              //     color: grey,
                              //   ),
                              // ),
                              // prefixIcon: IconTheme(
                              //   data: IconThemeData(
                              //     color: secondary,
                              //   ),
                              //   child: Icon(Icons.email),
                              // ),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Blue,
                              )),
                        ),
                        const SizedBox(
                          height: 34,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Blue,
                            minimumSize: const Size.fromHeight(44),
                          ),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              user();
                            }
                            // var username;
                            // if (formkey.currentState!.validate()) {
                            //   Navigator.of(context).push(MaterialPageRoute(
                            //       builder: (context) => Navigation(
                            //             name: username.toString(),
                            //           )));
                            // } else {}
                          },
                          // onPressed: () {
                          //   Navigator.of(context).push(MaterialPageRoute(
                          //       builder: (context) => Navigation()));
                          // },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        // Row(children: const <Widget>[
                        //   Expanded(
                        //       child: Divider(
                        //     indent: 10.0,
                        //     endIndent: 10.0,
                        //     thickness: 1,
                        //     color: grey,
                        //   )),
                        //   Text(
                        //     'or Continue with',
                        //     style: TextStyle(color: grey, fontSize: 14),
                        //   ),
                        //   Expanded(
                        //       child: Divider(
                        //     indent: 10.0,
                        //     endIndent: 10.0,
                        //     thickness: 1,
                        //     color: grey,
                        //   )),
                        // ]),
                        // const SizedBox(
                        //   height: 36,
                        // ),
                        // const SizedBox(
                        //   height: 22,
                        // ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                            },
                            child: Center(
                              child: RichText(
                                text: const TextSpan(
                                    text: ' Already have an account?',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' Login',
                                        style: TextStyle(
                                          color: Blue,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      )
                                    ]),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  user() async {
    // var jsonResponse;
    var data = {
      'email': email.text,
      'first_name': firstname.text,
      'last_name': lastname.text,
      'password': pass.text,
      // 'phone': phone.text
    };
    print(data);
    // var url = 'http://192.168.29.233/laravel/childerns/api/register';
    //var url = api_url + 'register';
    var url = register;
    var urlparse = Uri.parse(url);
    var body = json.encode(data);

    var response = await http.post(
      urlparse,
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );

    print(response.body);
    print(response.statusCode);
    var response_data = json.decode(response.body.toString());
    print(response_data);
    if (response.statusCode == 200) {
      final session = await SharedPreferences.getInstance();

      await session.setInt('user_id', response_data['user_id']);
      print(response_data['user_id']);
      print(response_data['email']);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Navigation(
                    name: firstname.text,
                  )));
      toastInfo(mesg: response_data['message']);
      print('Sucessfull');
    } else {
      toastInfo(mesg: response_data['message']);
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text(response_data['message']),
      //   backgroundColor: Colors.red.shade300,
      // ));
      print('Error');
    }
  }
}
