import 'package:filhos_do_eden_personagem/app/model/power_definition.dart';
import 'package:filhos_do_eden_personagem/app/model/strain_definition.dart';
import 'package:filhos_do_eden_personagem/app/repository/character_type_catalog.dart';
import 'package:filhos_do_eden_personagem/app/model/character_type_definition.dart';
import 'package:filhos_do_eden_personagem/app/repository/power_catalog.dart';
import 'package:filhos_do_eden_personagem/app/repository/strain_catalog.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/character_type.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/power.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/strain.dart';

class Character {
  final String id;
  final String name;
  final CharacterType type;
  final Strain selectedStrain;
  final List<Power> currentPowers;

  const Character({
    required this.id,
    required this.name,
    required this.type,
    required this.selectedStrain,
    required this.currentPowers,
  });

  // Método auxiliar para pegar as regras/dados visuais da classe do personagem
  CharacterClassDefinition get classDefinition => 
      CharacterTypeCatalog.classes[type]!;
  StrainDefinition get strainDefinition =>
    StrainCatalog.strains[selectedStrain]!;
}