import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;

  const DefaultAppBar({super.key, this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? '', style: Theme.of(context).textTheme.bodyMedium),
      centerTitle: false,
      automaticallyImplyLeading: false,
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
