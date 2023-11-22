import 'package:agot_api/character_model.dart';
import 'package:flutter/material.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  State<CharacterPage> createState() {
    return _CharacterPageState();
  }
}

class _CharacterPageState extends State<CharacterPage> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text($name'CharacterPage'),
      ),
      body: const Center(
        child: Text('Character Page'),
      ),
    );
  }
}
