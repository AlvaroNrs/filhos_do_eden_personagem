import 'package:filhos_do_eden_personagem/app/model/character.dart';
import 'package:filhos_do_eden_personagem/app/view/styles/app_colors.dart';
import 'package:filhos_do_eden_personagem/app/view/widgets/buttons/custom_text_button.dart';
import 'package:filhos_do_eden_personagem/app/view/widgets/character_list_tile.dart';
import 'package:flutter/material.dart';

class CreatedCharactersPage extends StatefulWidget {
  final List<Character> charactersList;
  final Function(int value) updateIndex;
  const CreatedCharactersPage({super.key, required this.updateIndex, required this.charactersList});

  @override
  State<CreatedCharactersPage> createState() => _CreatedCharactersPageState();
}

class _CreatedCharactersPageState extends State<CreatedCharactersPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Personagens Criados".toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.darkBrown,
              fontSize: 25,
              fontFamily: 'Eremaeus'
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.charactersList.length,
              itemBuilder: (context, index) {
                Character model = widget.charactersList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: CharacterListTile(character: model),
                );
              },
            ),
          ),
          CustomTextButton(text: "Voltar", onPressed: (){widget.updateIndex(0);}),
        ]
      ),
    );
  }
}