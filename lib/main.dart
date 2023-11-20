import 'dart:async';
import 'package:agot_api/character_list.dart';
import 'package:agot_api/character_model.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  build(BuildContext context) {
    return MaterialApp(
      title: 'My fav Characters',
      theme: ThemeData(brightness: Brightness.dark),
      home: const MyHomePage(
        title: 'My fav Characters',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController =
      TextEditingController(); // Create an instance of TextEditingController

  List<Character> initialCharacters = [];

  Future<void> grabCharacters() async {
    List<Character> initialCharactersFetched = [];

    final Character initCharacter = await fetchCharacter(1);
    initialCharactersFetched.add(initCharacter);
    final Character initCharacter1 = await fetchCharacter(2);
    initialCharactersFetched.add(initCharacter1);
    final Character initCharacter2 = await fetchCharacter(3);
    initialCharactersFetched.add(initCharacter2);
    setState(() {
      initialCharacters = initialCharactersFetched;
    });
  }

  Future<void> addCharacter(String name) async {
    final int tempId = await searchCharacterIdByName(name);
    final Character tempCharacter = await fetchCharacter(tempId);
    setState(() {
      initialCharacters.add(tempCharacter);
    });
  }

  @override
  void initState() {
    super.initState();
    grabCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A Game of Thrones Characters',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('A Game of Thrones Characters'),
        ),
        body: Column(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller:
                          _searchController, // Assign the TextEditingController to the TextField
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      addCharacter(_searchController.text);
                    },
                    color: Colors.deepPurple,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: CharacterList(initialCharacters),
            ),
          ],
        ),
      ),
    );
  }
}
