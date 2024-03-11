import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmedha/Api/Api.dart';
import 'package:cmedha/Api/Api_services/Remote_services.dart';
import 'package:cmedha/Models/addcart_model.dart';
import 'package:cmedha/screens/Constant/color.dart';
import 'package:cmedha/screens/Payment/Confirm.dart';
import 'package:cmedha/screens/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<AddCart> cartItems = [];
  double totalPrice = 0.0; // Variable to store the total price

  @override
  void initState() {
    super.initState();
    _fetchCartItems();
    _fetchCartPrice();
  }

  Future<void> _fetchCartItems() async {
    try {
      List<AddCart> items = await RemoteService.addcart();
      setState(() {
        cartItems = items;
      });
    } catch (error) {
      print('Error fetching cart items: $error');
    }
  }

  Future<void> _fetchCartPrice() async {
    try {
      // Fetch cart price from the API
      double price = await _getCartPrice();
      setState(() {
        totalPrice = price;
      });
    } catch (error) {
      print('Error fetching cart price: $error');
    }
  }

  Future<double> _getCartPrice() async {
    try {
      SharedPreferences session = await SharedPreferences.getInstance();
      var userId = session.getInt('user_id');

      var url = cart_price;
      var data = {
        'user_id': userId.toString(),
      };

      var body = json.encode(data);
      var urlparse = Uri.parse(url);

      var response = await http.post(urlparse, body: body, headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      });

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        var price = responseData['total_price'];
        if (price is int) {
          return price.toDouble();
        } else if (price is double) {
          return price;
        } else {
          throw Exception('Invalid price format');
        }
      } else {
        throw Exception('Failed to fetch cart price');
      }
    } catch (error) {
      print('Error fetching cart price: $error');
      throw Exception('Failed to fetch cart price');
    }
  }

  Future<void> _deleteCartItem(int cartId) async {
    try {
      // Show loading indicator while deleting
      showLoadingIndicator();
      await deleteCartItem(cartId);

      print('Cart Items before deletion: ${cartItems.length}');

      // Remove the item from cartItems list
      cartItems.removeWhere((item) => item.cartId == cartId);

      print('Cart Items after deletion: ${cartItems.length}');
      setState(() {});

      await Future.delayed(Duration(seconds: 1));

      await _fetchCartItems();
      await _fetchCartPrice();

      // Hide the loading indicator
      hideLoadingIndicator();
    } catch (error) {
      hideLoadingIndicator();
      print('Error deleting item: $error');
    }
  }

  void showLoadingIndicator() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void hideLoadingIndicator() {
    Navigator.of(context).pop();
  }

  static Future<void> deleteCartItem(int cartId) async {
    try {
      SharedPreferences session = await SharedPreferences.getInstance();
      var userId = session.getInt('user_id');

      var url = delete_cart;
      var data = {
        'user_id': userId.toString(),
        'cart_id': cartId.toString(),
      };

      var body = json.encode(data);
      var urlparse = Uri.parse(url);

      var response = await http.post(urlparse, body: body, headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      });

      if (response.statusCode == 200) {
        print('Item deleted successfully');
      } else {
        print('Failed to delete item. Status code: ${response.statusCode}');
        throw Exception('Failed to delete item');
      }
    } catch (error) {
      print('Error deleting item: $error');
      throw Exception('Failed to delete item');
    }
  }

  Future<void> _refreshCart() async {
    await _fetchCartItems();
    await _fetchCartPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: text20('Course Cart', white),
        elevation: 3,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshCart,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Column(
                  children: [
                    if (cartItems.isEmpty)
                      Center(
                        child: Text(
                          'No items added to the cart',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    else
                      Column(
                        children: [
                          ListView.builder(
                              key: UniqueKey(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: cartItems.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  elevation: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Card(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    cartItems[index].image,
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    Center(
                                                        child: SizedBox(
                                                            height: 25,
                                                            width: 25,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                          Color>(
                                                                      Blue),
                                                              backgroundColor:
                                                                  Colors.white,
                                                              strokeWidth: 2,
                                                            ))),
                                                // Placeholder widget while loading
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cartItems[index].name,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.justify,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: black,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                text16(
                                                    '\$ ${cartItems[index].price}',
                                                    black),
                                                SizedBox(
                                                  width: 140,
                                                ),
                                                CircleAvatar(
                                                  child: IconButton(
                                                      onPressed: () {
                                                        _deleteCartItem(
                                                            cartItems[index]
                                                                .cartId);
                                                      },
                                                      icon: Icon(
                                                        Icons.delete,
                                                        color: red,
                                                      )),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    text20('Total price :', black),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    text20('\$ $totalPrice', black),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Blue,
                              minimumSize: Size.fromHeight(44),
                            ),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                      builder: (context) => Confirm()));
                            },
                            child: const Text(
                              'Confirm and Continue',
                              style: TextStyle(
                                color: white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
