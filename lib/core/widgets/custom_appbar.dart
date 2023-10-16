import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar(
      {Key? key, required this.appTitle, this.route, required this.actions})
      : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(60);

  final String appTitle;
  final String? route;

  final List<Widget> actions;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      elevation: 0,
      title: Text(
        widget.appTitle,
        style: context.general.textTheme.titleLarge,
      ),
      actions: widget.actions ?? null,
    );
  }
}
