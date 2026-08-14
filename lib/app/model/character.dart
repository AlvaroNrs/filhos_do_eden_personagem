import 'package:filhos_do_eden_personagem/app/model/side_definition.dart';
import 'package:filhos_do_eden_personagem/app/model/strain_definition.dart';
import 'package:filhos_do_eden_personagem/app/repository/character_type_catalog.dart';
import 'package:filhos_do_eden_personagem/app/model/character_type_definition.dart';
import 'package:filhos_do_eden_personagem/app/repository/side_catalog.dart';
import 'package:filhos_do_eden_personagem/app/repository/strain_catalog.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/character_type.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/light_and_darkness.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/power.dart';
import 'package:filhos_do_eden_personagem/app/shared/enums/strain.dart';

class Character {
  String id;
  String name;
  LightAndDarkness side;
  CharacterType type;
  Strain selectedStrain;

  Character({
    required this.id,
    required this.name,
    required this.side,
    required this.type,
    required this.selectedStrain,
  });

  // Método auxiliar para pegar as regras/dados visuais da classe do personagem
  CharacterClassDefinition get classDefinition => 
      CharacterTypeCatalog.classes[type]!;
  StrainDefinition get strainDefinition =>
    StrainCatalog.strains[selectedStrain]!;
  List<Power> get powerDefinition => 
    CharacterTypeCatalog.classes[type]!.startPowers.toList();
  SideDefinition get sideDefinition =>
    SideCatalog.sides[side]!;
}