import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ProductsPage extends StatefulWidget {
  final void Function() onInit;

  const ProductsPage({this.onInit});
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getUser();
  }

  _getUser() async {
    final prefs = await SharedPreferences.getInstance();
    var storedUser = prefs.getString('user');
    print('storedUser: $storedUser');
    print(json.decode(storedUser));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Products Page'),
    );
  }
}
