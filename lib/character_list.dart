import 'package:agot_api/character_model.dart';
import 'package:agot_api/character_card.dart';
import 'package:flutter/material.dart';

class CharacterList extends StatelessWidget {
  final List<Character> characters;
  const CharacterList(this.characters, {super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint(characters.toString());
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: characters.length,
      // ignore: avoid_types_as_parameter_names
      itemBuilder: (context, int) {
        return CharacterCard(characters[int]);
      },
    );
  }
}
