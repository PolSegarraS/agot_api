import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<int, Character>> fetchAllCharacters() async {
  final response =
      await http.get(Uri.parse('https://thronesapi.com/api/v2/Characters'));

  if (response.statusCode == 200) {
    final List<dynamic> characterList = jsonDecode(response.body);
    final Map<int, Character> characterMap = {};

    for (var characterJson in characterList) {
      final Character character = Character.fromJson(characterJson);
      characterMap[character.id!] = character;
    }

    return characterMap;
  } else {
    throw Exception('Failed to load characters');
  }
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

  Character({
    required this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.title,
    this.family,
    this.image,
    this.imageUrl,
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
