import 'package:flutter/material.dart';

class Channel {
  String name;
  IconData icon;

  Channel({
    required this.name,
    required this.icon,
  });
}

List<Channel> channels = [
  Channel(name: "Welcome", icon: Icons.home),
  Channel(name: "Intoduce yourself", icon: Icons.supervised_user_circle),
  Channel(name: "Flutter", icon: Icons.flutter_dash),
];
