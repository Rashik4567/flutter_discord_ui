import 'package:flutter/material.dart';

class People {
  String username;
  int id;
  IconData pic;

  People({
    required this.username,
    required this.id,
    required this.pic,
  });
}

List<People> people = [
  People(username: "ac_unit", id: 0, pic: Icons.ac_unit_outlined),
  People(username: "alarm", id: 1, pic: Icons.access_alarms),
  People(username: "accessibility", id: 2, pic: Icons.accessibility_sharp),
  People(username: "account", id: 3, pic: Icons.account_circle_outlined),
];
