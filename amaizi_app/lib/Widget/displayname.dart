import 'package:amaizi_app/Models/user.dart';
import 'package:flutter/material.dart';

// a widget to display each list element
class DisplayName extends StatelessWidget {
  final User user;
  DisplayName(this.user);
  @override
  Widget build(BuildContext context) {
    return Text(user.name,textAlign:TextAlign.center);
  }
}
