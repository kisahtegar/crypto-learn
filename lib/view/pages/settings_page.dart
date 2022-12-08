import 'package:flutter/material.dart';

import '../../assets/constants.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Settings',
          style: kTitleTextStyle,
        ),
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
