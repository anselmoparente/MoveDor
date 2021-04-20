import 'package:flutter/material.dart';

import '../../../size_config.dart';
// import 'categories.dart';
import 'book_header.dart';
import 'chapters.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(30)),
            Chapters(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
