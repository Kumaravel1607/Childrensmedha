import 'package:cmedha/screens/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CartIcon extends StatefulWidget {
  @override
  _CartIconState createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  int cartCount = 0;

  @override
  void initState() {
    super.initState();
    fetchCartData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/images/cart.svg',
          height: 35,
          color: white,
        ),
        if (cartCount > 0)
          Positioned(
            right: 1,
            top: -1,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: BoxConstraints(
                minWidth: 20,
                minHeight: 13,
              ),
              child: Text(
                '$cartCount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  Future<Map<String, dynamic>> fetchCartData() async {
    try {
      SharedPreferences session = await SharedPreferences.getInstance();
      var userId = session.getInt('user_id');

      var url = 'https://dreams.hashref.org/api/cart-count';
      var data = {'user_id': userId.toString()};

      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
          // Note: CORS headers are usually set on the server side
        },
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('............');
        print(responseData);
        var count = responseData['cart_count'] ?? 0;
        print('==========');

        print(count);
        setState(() {
          cartCount = count;
        });
        return {'cart_count': count};
      } else {
        throw Exception(
            'Failed to fetch cart count. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching cart count: $error');
      throw Exception('Failed to fetch cart count');
    }
  }
}
