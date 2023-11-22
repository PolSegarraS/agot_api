import 'package:flutter/material.dart';
import 'package:agot_api/character_model.dart';

class CharacterPage extends StatefulWidget {
  final Character character;

  const CharacterPage(this.character, {Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _CharacterPageState createState() => _CharacterPageState(character);
}

class _CharacterPageState extends State<CharacterPage> {
  late Character character;
  _CharacterPageState(this.character);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.fullName.toString()),
      ),
      body: Row(
        children: [
          Text(
            character.fullName.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            character.family.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            character.title.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
