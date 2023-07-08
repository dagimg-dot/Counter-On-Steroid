import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    super.key,
    required this.mainColor,
  });

  final Color mainColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Counter on Steroid",
      ),
      backgroundColor: mainColor,
      foregroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}