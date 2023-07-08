import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    super.key,
    required this.mainColor,
    this.action,
  });

  final Color mainColor;
  final Widget? action;

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
      actions:  [
        action ?? Container(),
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}