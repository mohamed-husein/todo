import 'package:flutter/material.dart';

import '../utils/custom_text.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  final String title;
  @override
  final Size preferredSize; // default is 56.0

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(),
      ),
      title: CustomText(
        widget.title,
        context: context,
        textStyle: Theme.of(context).appBarTheme.titleTextStyle,
      ),
    );
  }
}
