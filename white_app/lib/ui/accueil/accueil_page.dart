import 'package:flutter/material.dart';
import 'package:white_app/ui/widget_utils/app_bar.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({
    super.key,
  });

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Pour enlever l'overflow quand on ouvre le clavier
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarWidget(),
      ),
      body: Container(
        color: Colors.blue,
        height: 200,
      ),
    );
  }
}
