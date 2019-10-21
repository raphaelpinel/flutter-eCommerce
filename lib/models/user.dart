import 'package:flutter/widgets.dart';

class User {
  String id;
  String username;
  String email;
  String jwt;

  User({
    @required this.id,
    @required this.username,
    @required this.email,
    @required this.jwt,
  });
}