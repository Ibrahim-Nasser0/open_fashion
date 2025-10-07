import 'package:flutter/material.dart';
import 'package:open_fashion/core/app_colors.dart';
import 'package:open_fashion/feaures/home/components/header_decorations.dart';
import 'package:open_fashion/feaures/home/components/home_body_content.dart';
import 'package:open_fashion/shared/components/custom_appbar.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: const CustomAppBar(isBlack: true),
      body: Stack(
        children: [
          HeaderDecorations(),
          HomeBodyContent(),
        ],
      ),
    );
  }
}


