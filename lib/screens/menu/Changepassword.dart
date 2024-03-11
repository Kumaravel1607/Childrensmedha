import 'dart:convert';

import 'package:cmedha/Api/Api.dart';
import 'package:cmedha/Navigation.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isloading = false;

  @override
  void initState() {
    // user();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _passVisibility = true;
  bool _passVisibility1 = true;
  bool _passVisibility2 = true;
  TextEditingController old = TextEditingController();
  TextEditingController newpass = TextEditingController();
  TextEditingController confirm = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Blue,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              color: white,
            ),
          ),
          titleSpacing: 10,
          leadingWidth: 30,
          title: const Text(
            'Change Password',
            style: TextStyle(
                color: white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
            child: Form(
          key: formkey,
          child: Container(
            margin: const EdgeInsets.only(top: 50),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Old Password',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    // onChanged: (value) {
                    //   context
                    //       .read<LoginBloc>()
                    //       .add(PasswordEvent(value));
                    // },

                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter Old password";
                      }

                      return null;
                    },
                    controller: old,
                    autocorrect: true,
                    obscureText: !_passVisibility,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: red, width: 2)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: box),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Blue, width: 2),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 14, top: 14, bottom: 13),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter your Old password',
                      hintStyle: const TextStyle(color: grey, fontSize: 14),
                      suffixIcon: IconButton(
                        color: grey,
                        icon: _passVisibility
                            ? const Icon(
                                Icons.visibility,
                                color: Blue,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: Blue.withOpacity(0.6),
                              ),
                        onPressed: () {
                          _passVisibility = !_passVisibility;
                          setState(() {});
                        },
                      ),
                      // prefixIcon: Icon(
                      //   Icons.lock_rounded,
                      //   color: Blue,
                      // ),
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'New Password',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    // onChanged: (value) {
                    //   context
                    //       .read<LoginBloc>()
                    //       .add(PasswordEvent(value));
                    // },

                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter new password";
                      }

                      return null;
                    },
                    controller: newpass,
                    autocorrect: true,
                    obscureText: _passVisibility1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: red, width: 2)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: box),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Blue, width: 2),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 14, top: 14, bottom: 13),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter your new password',
                      hintStyle: const TextStyle(
                          fontFamily: 'Rubik', color: grey, fontSize: 14),
                      suffixIcon: IconButton(
                        color: grey,
                        icon: _passVisibility1
                            ? Icon(
                                Icons.visibility_off,
                                color: Blue.withOpacity(0.6),
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Blue,
                              ),
                        onPressed: () {
                          _passVisibility1 = !_passVisibility1;
                          setState(() {});
                        },
                      ),
                      // prefixIcon: Icon(
                      //   Icons.lock_rounded,
                      //   color: Blue,
                      // ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Confirm Password',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    // onChanged: (value) {
                    //   context
                    //       .read<LoginBloc>()
                    //       .add(PasswordEvent(value));
                    // },

                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter confirm password";
                      }

                      return null;
                    },
                    controller: confirm,
                    autocorrect: true,
                    obscureText: _passVisibility2,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: red, width: 2)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: box),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Blue, width: 2),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 14, top: 14, bottom: 13),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter your confirm password',
                      hintStyle: const TextStyle(
                          fontFamily: 'Rubik', color: grey, fontSize: 14),
                      suffixIcon: IconButton(
                        color: grey,
                        icon: _passVisibility2
                            ? Icon(
                                Icons.visibility_off,
                                color: Blue.withOpacity(0.6),
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Blue,
                              ),
                        onPressed: () {
                          _passVisibility2 = !_passVisibility2;
                          setState(() {});
                        },
                      ),
                      // prefixIcon: Icon(
                      //   Icons.lock_rounded,
                      //   color: Blue,
                      // ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: SizedBox(
                      // width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Blue,
                          minimumSize: const Size.fromHeight(44),
                        ),
                        onPressed: () {
                          newpassword();
                          // Navigator.pop(context);
                          // setState(() {
                          //   if (formkey.currentState!.validate()) {
                          //     isloading = true;
                          //     print(isloading);
                          //     // data();
                          //     // newpassword();
                          //   }
                          // });
                        },
                        child: isloading == true
                            ? Container(
                                width: 24,
                                height: 24,
                                padding: const EdgeInsets.all(2.0),
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              )
                            : const Text(
                                'Submit',
                                style: TextStyle(
                                  color: white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       "Don't have an account ?",
                  //       style: TextStyle(
                  //         fontSize: 16,
                  //         fontFamily: 'IBMPlexSans',
                  //         fontWeight: FontWeight.w500,
                  //       ),
                  //     ),
                  //     Text(
                  //       "Register",
                  //       style: TextStyle(
                  //         color: Blue,
                  //         fontSize: 16,
                  //         fontFamily: 'IBMPlexSans',
                  //         fontWeight: FontWeight.w500,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Center(
                  //   child: Text(
                  //     "Are you a teacher ?",
                  //     style: TextStyle(
                  //       fontSize: 16,
                  //       fontFamily: 'IBMPlexSans',
                  //       fontWeight: FontWeight.w500,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),

                  // Center(
                  //   child: TextButton(
                  //     onPressed: () {
                  //       // Navigator.of(context).pushAndRemoveUntil(
                  //       //     MaterialPageRoute(
                  //       //         builder: (BuildContext context) => Mobile_login()),
                  //       //     (Route<dynamic> route) => false);
                  //     },
                  //     child: Text(
                  //       "Login with Otp",
                  //       style: TextStyle(
                  //         color: Blue,
                  //         fontSize: 16,
                  //         fontFamily: 'IBMPlexSans',
                  //         fontWeight: FontWeight.w500,
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        )));
  }

  void newpassword() async {
    SharedPreferences session = await SharedPreferences.getInstance();
    // String? token = await FirebaseMessaging.instance.getToken();
    var first_name = session.getString("first_name");
    var token = session.getString('token');
    var user_id = session.getInt('user_id');
    print('token :' '$token');
    var url = change_pswd;
    var data = {
      "user_id": user_id.toString(),
      "old_password": old.text,
      "new_password": newpass.text,
      "confirm_password": confirm.text,
      "app_key": token,
    };
    print(data);

    var body = json.encode(data);
    var urlparse = Uri.parse(url);

    Response response = await http.post(urlparse, body: data, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(urlparse);
    var response_data = json.decode(response.body.toString());
    print(response_data);
    if (response.statusCode == 200) {
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(
      //         builder: (BuildContext context) => History_Screen()),
      //     (Route<dynamic> route) => false);
      Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return Navigation(
              name: first_name.toString(),
            );
          },
        ),
        (_) => false,
      );
      toastInfo(mesg: response_data['message'].toString());
    } else {
      toastInfo(mesg: response_data['message'].toString());
    }
  }
}
