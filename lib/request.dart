import 'dart:developer';
import 'dart:io';
import 'package:database/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<List<User>?> getUser() async
{
  var number = 2;
  // var number1 = 1; RANGE
  // var number2 = 2ipconfig; RANGE
  // String url = "http://192.168.1.10/database.php?number=${number}";

  String url = "http://192.168.56.1/database.php?number=${number}";
  // String url = "http://192.168.1.10/database.php?number[]=${number1}&number[]=${number2}&"; VIR RANGE
  final response = await http.get(Uri.parse(url));
  print(response.body);
  return userFromJson(response.body);
}
