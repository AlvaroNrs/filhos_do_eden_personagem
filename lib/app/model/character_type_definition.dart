import 'package:filhos_do_eden_personagem/app/model/skill_bonus.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/character_type.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/light_and_darkness.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/power.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/strain.dart';

class CharacterClassDefinition {
  final CharacterType type;
  final String name;
  final String description;
  final LightAndDarkness lightAndDarkness;
  final List<Strain> possibleStrains;
  final List<SkillBonus> skillsBonus;
  final List<Power> startPowers;
  final List<String> benefits;
  final String typeIconAssetPath;

  const CharacterClassDefinition({
    required this.type,
    required this.name,
    required this.description,
    required this.lightAndDarkness,
    required this.possibleStrains,
    required this.skillsBonus,
    required this.startPowers,
    required this.benefits,
    required this.typeIconAssetPath,
  });
}