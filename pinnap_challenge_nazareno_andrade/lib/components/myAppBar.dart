import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: SvgPicture.asset(
        'assets/icons/pinapp_icon.svg',
        width: 32,
        height: 32,
      ),
      backgroundColor: const Color(0xff001568),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
