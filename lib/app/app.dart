import 'package:filhos_do_eden_personagem/app/view/navigator_start.dart';
import 'package:flutter/material.dart';

class FilhosDoEdenPersonagem extends StatelessWidget {
  const FilhosDoEdenPersonagem({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filhos do Éden Personagem',
      debugShowCheckedModeBanner: false,
      home: const NavigatorStart(),
    );
  }
}