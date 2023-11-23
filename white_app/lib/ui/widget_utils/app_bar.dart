import 'package:flutter/material.dart';
import 'package:white_app/business/locale/app_localizations.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        MyAppLocalizations.instance.title,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
  }
}
