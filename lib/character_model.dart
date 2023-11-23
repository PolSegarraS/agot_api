import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Character> fetchCharacter(int characterId) async {
  final response = await http
      .get(Uri.parse('https://thronesapi.com/api/v2/Characters/$characterId'));

  if (response.statusCode == 200) {
    return Character.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load character');
  }
}

Future<List<Character>> fetchCharacters() async {
  final response =
      await http.get(Uri.parse('https://thronesapi.com/api/v2/Characters'));

  if (response.statusCode == 200) {
    final List<dynamic> characterData = jsonDecode(response.body);
    return characterData.map((json) => Character.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load characters');
  }
}

Future<int> searchCharacterIdByName(String name) async {
  final characters = await fetchCharacters();
  final character = characters.firstWhere(
    (character) => character.firstName == name,
    orElse: () => Character(id: -1),
  );
  return character.id!;
}

class Character {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? title;
  final String? family;
  final String? image;
  final String? imageUrl;

  int rating = 10;

  Character({
    required this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.title,
    this.family,
    this.image,
    this.imageUrl,
    this.rating = 10,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      fullName: json['fullName'],
      title: json['title'],
      family: json['family'],
      image: json['image'],
      imageUrl: json['imageUrl'],
    );
  }
}
