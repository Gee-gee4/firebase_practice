// my_app_bar.dart
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onDrawerIconPressed;
  final Color? backgroundColorAppBar;
  final String? pageTitle;

  const MyAppBar(
      {super.key,
      required this.onDrawerIconPressed,
      this.backgroundColorAppBar,
      this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColorAppBar ?? Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color:
            Theme.of(context).colorScheme.secondary, // Change drawer icon color
      ),
      leading: IconButton(
        onPressed: onDrawerIconPressed,
        icon: const Icon(Icons.menu),
      ),
      title: pageTitle != null ? Text(pageTitle!,style: TextStyle(
                color: Theme.of(context).colorScheme.secondary, // Set title text color
              ),) : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
