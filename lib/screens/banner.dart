import 'package:flutter/material.dart';

class BannerList extends StatelessWidget {
  const BannerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        height: 200,
        decoration: BoxDecoration(
            color: Color.fromARGB(96, 128, 126, 126),
            borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
