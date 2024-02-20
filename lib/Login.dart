import 'package:cmedha/Navigation.dart';
import 'package:cmedha/Register.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: true,
            child: _body(),
          )
        ],
      ),
    );
  }

  Widget _body() {
    return Column(
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
        Form(
            key: formkey,
            child: SizedBox(
              height: 700,
              child: Stack(
                children: [
                  Container(
                    color: Blue,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40))),
                    // color: white,
                    //  margin: EdgeInsets.only(top: 120),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
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
                                return "Please enter Email";
                              }

                              return null;
                            },
                            controller: email,
                            autocorrect: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Blue, width: 2)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: box),
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
                                hintText: "Enter your email",
                                hintStyle:
                                    const TextStyle(color: grey, fontSize: 14),
                                prefixIcon: const Icon(
                                  Icons.mail_rounded,
                                  color: Blue,
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Password',
                            style: TextStyle(
                                fontSize: 14,
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
                                return "Please enter password";
                              }

                              return null;
                            },
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
                                  borderSide: const BorderSide(color: box),
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
                                  Icons.lock_rounded,
                                  color: Blue,
                                )),
                          ),
                          const SizedBox(height: 25),
                          Align(
                            alignment: Alignment.topRight,
                            child: TextButton(
                              onPressed: () {
                                // Navigator.of(context).pushAndRemoveUntil(
                                //     MaterialPageRoute(
                                //         builder: (BuildContext context) => ForgotScreen()),
                                //     (Route<dynamic> route) => false);
                              },
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Blue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
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
                                  // setState(() {
                                  //   if (formkey.currentState!.validate()) {
                                  //     isloading = true;
                                  //     print(isloading);
                                  //     user();
                                  //   }
                                  // });
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Navigation()),
                                      (Route<dynamic> route) => false);
                                  // setState(() {
                                  //   if (formkey.currentState!.validate()) {
                                  //     isloading = true;
                                  //     print(isloading);
                                  //     Navigator.of(context).pushAndRemoveUntil(
                                  //         MaterialPageRoute(
                                  //             builder: (BuildContext context) =>
                                  //                 Navigation()),
                                  //         (Route<dynamic> route) => false);
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
                                        'Sign in',
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
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account ?",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              RegisterScreen()),
                                      (Route<dynamic> route) => false);
                                },
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                    color: Blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  // user() async {
  //   // String? deviceId = await _getId();
  //   String? token = await FirebaseMessaging.instance.getToken();
  //   // print('Deviceid :' '$deviceId');

  //   print('token :' '$token');
  //   var url = login;
  //   var data = {"email": email.text, "password": pass.text, 'app_key': token};
  //   print(data);
  //   print(url);
  //   var body = json.encode(data);
  //   var urlparse = Uri.parse(url);

  //   http.Response response = await http.post(
  //     urlparse,
  //     body: data,
  //   );
  //   var response_data = json.decode(response.body.toString());

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       isloading = false;
  //     });
  //     print(isloading);
  //     print(response_data['result']);
  //     print(response_data['result']['user_id']);
  //     print(response_data['result']['first_name']);

  //     print(response_data['result']['email']);
  //     final session = await SharedPreferences.getInstance();
  //     await session.setString('email', response_data['result']['email']);
  //     await session.setInt('user_id', response_data['result']['user_id']);
  //     await session.setString(
  //         'first_name', response_data['result']['first_name']);
  //     await session.setString('token', response_data['result']['token']);

  //     var user_name = session.getString('first_name');

  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(
  //             builder: (BuildContext context) =>
  //                 Navigation(name: user_name.toString())),
  //         (Route<dynamic> route) => false);

  //     print('Success');
  //     toastInfo(mesg: response_data['message'].toString());
  //   } else {
  //     setState(() {
  //       isloading = false;
  //     });
  //     print(isloading);
  //     toastInfo(mesg: response_data['message'].toString());
  //   }
  // }
}
