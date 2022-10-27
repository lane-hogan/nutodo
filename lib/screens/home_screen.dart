import 'package:flutter/material.dart';
import 'package:nutodo/utils/colors.dart';
import 'package:nutodo/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: AppColors.black,
          iconSize: 30.0,
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: const [
            SearchBar(),
          ],
        ),
      ),
    );
  }
}
