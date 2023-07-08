import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    super.key,
    required this.mainColor,
    this.action,
    this.defaultLeading,
  });

  final Color mainColor;
  final Widget? action;
  final bool? defaultLeading;

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
      automaticallyImplyLeading: defaultLeading ?? false,
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}