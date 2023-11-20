import 'package:agot_api/character_model.dart';
import 'package:flutter/material.dart';

class CharacterCard extends StatefulWidget {
  final Character character;

  const CharacterCard(this.character, {Key? key}) : super(key: key);

  @override
  _CharacterCardState createState() => _CharacterCardState(character);
}

class _CharacterCardState extends State<CharacterCard> {
  Character character;
  _CharacterCardState(this.character);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  child: Image.network(
                    character.imageUrl.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 120,
              color: Colors.red,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.fullName.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    character.family.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    character.title.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
