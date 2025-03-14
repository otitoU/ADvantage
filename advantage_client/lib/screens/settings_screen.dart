import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../widgets/nav_bar.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavBar(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(title: Text('Settings')),
        body: Center(
            child: Text('Settings Content',
                style: TextStyle(color: AppColors.text))),
      ),
    );
  }
}
